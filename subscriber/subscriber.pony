use "debug"
use "collections"
use "bureaucracy"
use "../primitives"
use "../utilities"
use "../idIssuer"
use ".."
use "../publisher"

actor Subscriber is (IdNotify & TickListener)
  """
  Represents an application level subscription to one topic. 
  Note - We're not implementing the multi-subscribe capability in the specification
  because the saving in a few sub/unsub messages is outweighed by losing the one topic:
  one subscriber model. The Broker cannot conflate multiple acks into one SubAck unless
  the client subscribes to multiple topics in one subscribe message.
  """
  var _reg : Registrar
  var _pktMap : Map[IdType, PublishPacket val] 
  var _topic : String
  var _qos : String
  var _id : U16

  new create(reg : Registrar, topic: String, qos : String) =>
    _reg = reg
    _pktMap = Map[IdType, PublishPacket val]

    _topic = topic
    _qos = qos
    _id = 0   // Note must be a dummy because Id is generated asynhronously later


/********************************************************************************/
be apply(id : U16) =>
  """
  The packet id is the last piece of the jigsaw. Once we have this we can build our subscribe packet and
  send it to the broker
  """
  _id = id
  //Debug("SubscriberBasePacket " + _id.string() + " is subscription to " + _topic + " (" + _qos + ") with id = " + id.string())
  //_router.onSubscribe(this, _topic ,id, SubscribePacket.compose(id, _topic, _qos))
  var subscribePacket = SubscribePacket.compose(id, _topic, _qos)
  var subscriber : Subscriber tag = this
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onSubscribe(subscriber, _topic ,id, subscribePacket)}, {()=>Debug("No router at " + __loc.file() + ":" +__loc.method_name())})


/********************************************************************************/
be onTick(sec : I64) =>
  """
  This is the target for the TickListener trait that is called by the system tick
  tick timer. Each time we get this we scan the in-flight queue for expired messages
  """
  None
  //Debug(_topic.string() + " subscriber got system tick " + sec.string())

/********************************************************************************/
be onDisconnect() => 
  """
  All Subscribers get informed of a broker disconnect will a call to the onDisconnect behaviour.
  This enables the Subscriber to take whatever application level action is to respond 
  to this externally (to the actor) generated break in data. 
  Note there is no Broker connection at this point so no point in unsubscribing
  """
  Debug("Disconnecting " + _topic)

/********************************************************************************/
be unSubscribe() =>
  """
  A controlled unsubscribe behaviour to be used with an active broker connections
  """

/********************************************************************************/
be onData(basePacket : BasePacket val) => 
  """
  The Router sends data packets from the Broker, to actors who have requested it, using the
  onData behaviour. Note that not all Publish messages have an id so we default this to 0.
  As a Subscriber we only get:
  1. A SubAck to confirm our subscription
  2. A Publish packet containing a payload
  3. A PubRel message forming part three of the QoS 2 handshake
  4. A UnSubAck to confirm out unsubscription

  In response to a SubAck:
  1. We notify the app (via Main) of the result
  2. If the subscription is not accepted then we shoould go out of scope because any action
  Main takes will result in a new subscriber

  In response to a Publish:
  1. If QoS is Qos1 then the Subscriber must respond with a PubAck packet containing the id of 
  the packet being acknowledged 
  2. If QoS is Qos2 then Subscriber must respond with a PubRec and then wait for a PubRel

  In reponse to a PubRel
  1. Subscriber must respond with a PubComp 
  2. Release the packet to the app
  """
  // No need for a guard because the match statement will catch anything that is invalid
  match basePacket.controlType()
  | ControlSubAck => onSubAck(basePacket)
  | ControlPublish => onPublish(basePacket)
  | ControlPubRel => onPubRel(basePacket)
  | ControlUnsubAck => onUnsubAck(basePacket)
  else
    Debug ("Unexpected " + basePacket.controlType().string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end    

/********************************************************************************/
fun onSubAck(basePacket : BasePacket val)  =>
  """
  Our subscription has been acknowledged so we need to notify the app of the
  result.
  """
  var subAckPacket : SubAckPacket val = SubAckPacket(basePacket)
  var approvedQos : (Qos | None) =  subAckPacket.approvedQos() 
  var subAckResult : String val = recover val
    var resultString : String iso = " QoS: Requested " + ToQos(_qos).string() 
    match approvedQos
    | let q : Qos =>  resultString.append(" Approved " + q.string())
    | None => resultString.append(" Rejected")
    end
    consume resultString
  end
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onSubscribeComplete(subAckPacket.id())})
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.sendToMain(_topic, subAckResult)})


/********************************************************************************/
fun ref onUnsubAck(basePacket : BasePacket val)  =>
  """
  Our unsubscribe has been acknowledged so we need to tell router to remove us from
  the map of subscribers.
  TODO - We may also have some packets in our queue and we need to decide what to do
  about these
  """
  var unsubAckPacket = UnsubscribePacket.createFromPacket(basePacket)
  if (not unsubAckPacket.isValid()) then
    Debug("Invalid UnsubAck packet at " + __loc.file() + ":" +__loc.method_name())
    return
  end  
  
  try 
    var id = unsubAckPacket.id() as IdType
    _pktMap.remove(id)?
    _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onUnsubscribeComplete(id)})
  else
    Debug("Unknown in in UnsubAck packet at " + __loc.file() + ":" +__loc.method_name())
  end 
  

/********************************************************************************/
fun ref onPublish(basePacket: BasePacket val) : None =>
  """
  We have received a publish message. It is either:
  1. A QoS 0 packet with no id
  2. A QoS 1 or QoS2 packet with an id.

  If it is QoS 0 then just release the packet

  If it is QoS 1 then send a PubAck in return and release the message
  
  It it is QoS 2 then save the message, send a PubRec and wait for a PubRel
  """
  var pubPacket : PublishPacket val = PublishPacket.createFromPacket(basePacket)
  if (not pubPacket.isValid()) then
    Debug ("Invalid packet at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end

  var id : IdType = 0
  try
    id = pubPacket.id() as IdType // QoS 0 packets return None for id so this will fail before save
    savePacket(id, pubPacket)     // but is expected behaviour for QoS 0 so fail silently 
  end

  match pubPacket.qos()
  | Qos0 => releasePkt(pubPacket)
  | Qos1 => doPubAck(id); releasePktById(id); subscribeComplete(id)
  | Qos2 => doPubRec(id)
  end

/********************************************************************************/
fun doPubAck(id : IdType) =>
  """
  All we have is an id, so make the pubAck packet and send it
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  Debug("Pub ack at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.send(PubAckPacket.compose(id))}, {()=>Debug("No router at " + __loc.file() + ":" +__loc.method_name())})
 

/********************************************************************************/
fun ref doPubRec(id : IdType) =>
  """
  We have received a publish message with QoS 2. We acknowledge this with a 
  PubRec message and wait for a PubRel in response.
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end

  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.send(PubRecPacket.compose(id))})
 


/********************************************************************************/
fun ref onPubRel(basePacket : BasePacket val) =>
  """
  We have received a publish release message for a QoS 2 packet. The payload was
  stored when we received the publish message and we need to use this because
  pubRel only contains the id
  """
  var pubRelPacket = PubRelPacket.createFromPacket(basePacket)
  
  if (pubRelPacket.id() == 0) then
    Debug ("Invalid id at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end

  doPubComp(pubRelPacket.id())

  releasePktById(pubRelPacket.id())
  subscribeComplete(pubRelPacket.id())


/********************************************************************************/
fun doPubComp(id : IdType) =>
  """
  We have received a PubRel from a sender so we acknowledge this with a PubComp 
  message. We only have the id at this stage so there is little to do
  """

  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end

  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.send(PubCompPacket.compose(id))})


/********************************************************************************/
fun ref savePacket(id : IdType, pubPacket: PublishPacket val) =>
  """
  After receiving a QoS 2 publish packet we need to save it for when we get a PubRel
  message. 
  TODO - Add functionality to retransmit on reconnect if not cleansession
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  
  _pktMap.insert(id,pubPacket)

/********************************************************************************/
fun releasePktById(id : IdType) =>
  
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  
  try
    releasePkt(retrievePkt(id) as PublishPacket val)
  else
    Debug ("id = " + id.string() + " not found at " + __loc.method_name())
    return
  end
 
/********************************************************************************/
fun retrievePkt(id : IdType) : (PublishPacket val | None) =>
  """
  We are at an appropriate place in the protocol to release the message to the 
  application. This can be:
  1. After receiving a ControlPublish with QoS 0
  2. After receiving a ControlPublish with QoS 1
  2. After receiving a ControlPubRel with QoS 2
  """
  
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return None
  end
  
  try
    var pubPacket = _pktMap(id)?
    return pubPacket
  else
    Debug ("id = " + id.string() + " not found at " + __loc.method_name())
    return None
  end
 
/********************************************************************************/
fun releasePkt(pubPacket : PublishPacket val) =>
  """
  We are at an appropriate place in the protocol to release the message to the 
  application. This can be:
  1. After receiving a ControlPublish with QoS 0
  2. After receiving a ControlPublish with QoS 1
  2. After receiving a ControlPubRel with QoS 2
  """
  var idOrNone = pubPacket.id()
  try
    var topic : String val = pubPacket.topic() as String
    var payloadString : String val = pubPacket.payloadAsString() as String
    //TODO - This is a temporary kludge to get Mock Broker to print payloads
    _reg[Router](KeyRouter()).next[None]({ (r: Router)=>r.sendToMain(topic, payloadString)},{()=>Debug("Mock Broker got " + payloadString)})
  else
    Debug ("Packet error in " + __loc.method_name())
  end


/********************************************************************************/
fun ref subscribeComplete(id : IdType) =>
  """
  Removes the packet with this id from the map of in-flight packets and informs 
  router to do the same
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end

  try
    _pktMap.remove(id)?
    _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onSubscribeComplete(id)})
    
  else
    Debug("Id " + id.string() + " not found at " + __loc.file() + ":" +__loc.method_name())
  end    
