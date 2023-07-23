---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
/********************************************************************************/
  use "bureaucracy"
  use "collections"
  use "debug"

  use ".."
  use "../idIssuer"
  use "../primitives"
  use "../publisher"
  use "../utilities"

actor Subscriber is (IdNotifySub & MqActor)
  """
  Represents an application level subscription to one topic. 
  Note - We're not implementing the multi-subscribe capability in the specification
  because the saving in a few sub/unsub messages is outweighed by losing the one topic:
  one subscriber model. The Broker cannot conflate multiple acks into one SubAck unless
  the client subscribes to multiple topics in one subscribe message so we are protected 
  from multiple unsub messages.  
  Clients must continue to ack messages from the Broker while the unsubscribe process is
  underway so we don't have an unsubscribe behaviour. Instead we have a onUnsubAck 
  behaviour which is called when the Broker has acknowledged the unsubscirbe request. 
  Only then, when we know there will be no more messages, do we start our clean-up.
  TODO - Rather than implement timeouts here we should have router manage timeouts
  for all messages - so we don't hang the app if we don't get a response to a 
  subscribe or unsubscribe for example.
  Note: The ids for sub/unsub and publish can conflict so must be kept within 
  the relevant methods. Sub/unsub ids are issued by IdIssuer. Publish ids are issued
  by the Broker.
  """
  var _reg : Registrar
  var _pktMap : Map[IdType, PublishPacket val] 
  var _topic : String
  var _qos : String
  var _this : Subscriber 

new create(reg : Registrar, topic: String, qos : String) =>
  _reg = reg
  _pktMap = Map[IdType, PublishPacket val]
  _this = this
  _topic = topic
  _qos = qos

/********************************************************************************/
be apply(id : U16, sub : Bool) =>
  """
  The packet id is the last piece of the jigsaw. Once we have this we can build our 
  subscribe or unsubscribe packet and send it to the broker
  """
  var subscriber : Subscriber tag = this
  if (sub) then 
    var arrayVal = SubscribePacket.compose(id, _topic, _qos)
    _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onSubscribe(subscriber, _topic ,id, arrayVal)})
  else
    var arrayVal = UnsubscribePacket.compose(id, _topic)
    _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onUnsubscribe(subscriber, id, arrayVal)})
  end


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
be onData(basePacket : BasePacket val) => 
  """
  The Router sends data packets from the Broker, to actors who have requested it, using the
  onData behaviour. Note that QoS 0 Publish messages don't have an id so we default this to 0.
  As a Subscriber the only messages we get from the Broker are:
  1. A SubAck to confirm our subscription
  2. A Publish packet containing a payload
  3. A PubRel message forming part three of the QoS 2 handshake
  4. A UnSubAck to confirm out unsubscription

  In response to a SubAck:
  1. We notify the app of the result
  2. We tell router we have finished processing the id of the subscribe packet
  3. If the subscription is not accepted then we leave it to the app to take further action

  In response to a Publish:
  1. If QoS is Qos1 then the Subscriber must respond with a PubAck packet containing the id of 
  the packet being acknowledged and then release the packet to the app
  2. If QoS is Qos2 then Subscriber must respond with a PubRec and save the packet until 
  a PubRel is received. 

  In reponse to a PubRel
  1. Subscriber must respond with a PubComp 
  2. Subscriber must release the packet to the app

  In response to an UnsubAck:
  1. We notify the app (via Main) of the result
  2. We tell router we have finished processing the id of the subscribe packet

  """
  // No need for a guard because the match statement will catch anything that is invalid
  match basePacket.controlType()
  | ControlPublish => onPayload(basePacket)
  | ControlSubAck => onSubAck(basePacket)
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
  TODO - Why don't we respond directly to main instead of going via router?
  """
  var accepted : Bool = true
  var subAckPacket : SubAckPacket val = SubAckPacket(basePacket)
  var approvedQos : (Qos | None) =  subAckPacket.approvedQos() 
  var subAckResult : String val = recover val
    var resultString : String iso = "Requested " + ToQos(_qos).string() 
    match approvedQos
    | let q : Qos =>  resultString.append(" Approved " + q.string())
    | None => resultString.append(" Rejected"); accepted = false
    end
    consume resultString
  end
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onSubscribeComplete(_this, subAckPacket.id(), accepted)})
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.sendToMain(_topic, subAckResult)})


/********************************************************************************/
fun ref onUnsubAck(basePacket : BasePacket val)  =>
  """
  Our unsubscribe has been acknowledged so we need to tell router to remove us from
  the map of subscribers.
  TODO - Why don't we respond directly to main instead of going via router?
  TODO - We may also have some packets in our queue and we need to decide what to do
  about these
  """
  var unsubAckPacket = UnsubscribePacket.createFromPacket(basePacket)
  if (not unsubAckPacket.isValid()) then
    Debug("Invalid UnsubAck packet at " + __loc.file() + ":" +__loc.method_name())
    return
  end  
  
  try 
    var cid = unsubAckPacket.id() as IdType
    _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onUnsubscribeComplete(_this, cid)})
    _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.sendToMain(_topic, "Unsubscribed")})
  else
    Debug("Unknown id in UnsubAck packet at " + __loc.file() + ":" +__loc.method_name())
  end 
  

/********************************************************************************/
fun ref onPayload(basePacket: BasePacket val) : None =>
  """
  Note - We name this function onPayload to avoid confusion with message publication.
  We have received a publish message. The publish message is either:
  1. A QoS 0 packet with no id
  2. A QoS 1 or QoS2 packet with an id.

  If it is QoS 0 then just release the packet

  If it is QoS 1 then send a PubAck in return and release the message. Then tell
  router we have completed processing the id
  
  If it is QoS 2 then save the message, send a PubRec and wait for a PubRel
  """
  var pubPacket : PublishPacket val = PublishPacket.createFromPacket(basePacket)
  try 
    var bid : IdType = pubPacket.id() as IdType     // fails for QoS0
    match pubPacket.qos()
    | Qos1 => doPubAck(bid); releasePkt(pubPacket); payloadComplete(bid)
    | Qos2 => _pktMap.insert(bid,pubPacket); doPubRec(bid)
    end
  else
    if (pubPacket.qos() is Qos0) then
      releasePkt(pubPacket) 
    else
      Debug("Invalid Id in publish packet at " + __loc.file() + ":" +__loc.method_name())
      Debug(basePacket.data())
    end  
  end

/********************************************************************************/
fun doPubAck(id : IdType) =>
  """
  All we have is an id, so make the pubAck packet and send it. No look-ups with id
  so we don't care whether it is Broker or Client assigned.
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  //Debug("Pub ack at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.send(PubAckPacket.compose(id))}, {()=>Debug("No router at " + __loc.file() + ":" +__loc.method_name())})
 

/********************************************************************************/
fun ref doPubRec(id : IdType) =>
  """
  We have received a publish message with QoS 2. We acknowledge this with a 
  PubRec message and wait for a PubRel in response. No id lookup so we don't 
  care whether this is a Bid or  Cid
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end

  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.send(PubRecPacket.compose(id))})
 


/********************************************************************************/
fun ref onPubRel(basePacket : BasePacket val) =>
  """
  We have received a publish release message for a QoS 2 packet. Send a pubComp
  to ack this. The payload was stored when we received the publish message and 
  we need to retrieve this from the packetMap to release it. Then we can delete it
  and tell router we have completed processing. 
  We do a lookup with id on _pktMap so we can't mix Bid and Cid in one subscriber instance 
  """
  var pubRelPacket = PubRelPacket.createFromPacket(basePacket)
  
  if (pubRelPacket.id() == 0) then
    Debug ("Invalid id at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end
  doPubComp(pubRelPacket.id())

  try 
    (var bid , var packet ) = _pktMap.remove(pubRelPacket.id())?
    releasePkt(packet) 
  else
    Debug("Unable to release QoS 2 packet id " + pubRelPacket.id().string()  +  " in " + __loc.file() + ":" +__loc.method_name())
  end
  payloadComplete(pubRelPacket.id())

/********************************************************************************/
fun doPubComp(id : IdType) =>
  """
  We have received a PubRel from a sender so we acknowledge this with a PubComp 
  message. We only have the id at this stage so there is little else to do. No
  lookups on id so we don't care whether it is a Bid or a Cid.
  """
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.send(PubCompPacket.compose(id))})

/********************************************************************************/
fun releasePkt(pubPacket : PublishPacket val) =>
  """
  We are at an appropriate place in the protocol to release the message to the 
  application. This can be:
  1. After receiving a ControlPublish with QoS 0
  2. After receiving a ControlPublish with QoS 1
  2. After receiving a ControlPubRel with QoS 2
  TODO - The second argument in the _reg call is a temporary kludge to get Mock Broker
  to print payloads. Mock Broker has no router so the call _reg will fail the promise
  and we print the payload as a Debug message. Nasty.
  """
  try
    var topic : String val = pubPacket.topic() as String
    var payloadString : String val = pubPacket.payloadAsString() as String
  _reg[Router](KeyRouter()).next[None]({ (r: Router)=>r.sendToMain(topic, payloadString)},{()=>Debug("Mock Broker got " + payloadString)})
  else
    Debug ("Packet error in " + __loc.method_name())
  end


/********************************************************************************/
be subscribe() =>
  // pass ourselves to the IdIssuer so IdIssuer can allocate an id and call our apply
  // behaviour that will make a subscribe packet with the id and pass it to 
  // router to send to the broker
  _reg[IdIssuer tag](KeyIssuer()).next[None]({(issuer) =>issuer.checkOutSub(_this)},{()=>Debug("No issuer found")})

/********************************************************************************/
be unsubscribe() =>
  // pass ourselves to the IdIssuer so IdIssuer can allocate an id and call our apply
  // behaviour that will make an usubscribe packet with the id and pass it to 
  // router to send to the broker
  _reg[IdIssuer tag](KeyIssuer()).next[None]({(issuer) =>issuer.checkOutUnsub(_this)},{()=>Debug("No issuer found")})


/********************************************************************************/
fun ref payloadComplete(bid : IdType) =>
  """
  Informs router that we have finished processing this id.
  """
  if (bid == 0) then
      Debug("Zero Broker Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onPayloadComplete(bid)})

```````