"""
The actor and classes needed to subscribe to messages from the Broker and handle the ensuing 
handshakes.  
Note - This package includes suback codes on the basis that it may be better to interpret these
within the library code and return a string to the app than to return a code. 
"""

/********************************************************************************/
  use "bureaucracy"
  use "collections"
  use "debug"

  use ".."
  use "package:../primitives"
  use "package:../publisher"
  use "package:../router"
  use "package:../utilities"

actor Subscriber is MqActor
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
  var _router : Router
  var _pktMap : Map[IdType, PublishPacket val] 
  var _topic : String
  var _qos : Qos
  var _this : Subscriber 

new create(router : Router, topic: String val, qos : Qos) =>
  _router = router
  _pktMap = Map[IdType, PublishPacket val]
  """
  A map that stores QoS 2 packets indexed by Bid
  """
  _this = this
  _topic = topic
  _qos = qos

/********************************************************************************/
be subscribe(cid : IdType) =>
  """
  The packet id is the last piece of the jigsaw. Once we have this we can build our 
  subscribe packet and send it to the broker
  """
    _router.send(SubscribePacket.compose(cid, _topic, _qos))

/********************************************************************************/
be unsubscribe(cid : IdType) =>
  """
  The packet id is the last piece of the jigsaw. Once we have this we can build our 
  unsubscribe packet and send it to the broker
  """
  _router.send(UnsubscribePacket.compose(cid, _topic))

/********************************************************************************/
be onTick(sec : I64) =>
  """
  This is the target for the TickListener trait that is called by the system tick
  tick timer. Each time we get this we scan the in-flight queue for expired messages
  """
  None
  //Debug.err(_topic.string() + " subscriber got system tick " + sec.string())

/********************************************************************************/
be onDuckAndCover() => 
  """
  We need to save state because the broker is disconnecting or something has gone awry.   
  """
  Debug.err(_pktMap.size().string() + " unreleased packets in " + _topic + " subscriber")

/********************************************************************************/
be onDisconnect() => 
  """
  All Subscribers get informed of a broker disconnect with a call to the onDisconnect behaviour.
  This enables the Subscriber to take whatever application level action is to respond 
  to this externally (to the actor) generated break in data. Actions depend on QoS of messages:
  QoS 0 - Nothing to be done
  QoS 1 - Nothing to be done. If we haven't acked a received packet the Broker will re-send it
  QoS 2 - Save the _pktMap entries because the app may want to restore the session
  Note - Disconnect may be a result of an error so we can't assume there is a Broker connection
  at this point but we will try to unsubscribe anyway.
  If we have packets in _pktMap onDisconnect and CleanSession is false then they are awaiting
  PubRels from the Broker. We need to save these by sending them to main. 
  """
  Debug.err("Disconnecting " + _topic)
  if (_pktMap.size() != 0) then Debug.err("Sending " + _pktMap.size().string() + " unreleased packets for storage") end

  // TODO - We need to send them in the original order and this won't do it...
  for (k,v) in _pktMap.pairs() do 
    Debug.err("Sending []" + k.string() + v.topic().string() + "]")
  end


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
    Debug ("Unexpected " + basePacket.controlType().string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
  end    

/********************************************************************************/
fun onSubAck(basePacket : BasePacket val)  =>
  """
  Our subscription has been acknowledged so we need to notify the app of the
  result.
  """
  var subAckPacket : SubAckPacket val = SubAckPacket(basePacket)
  var approved : (String val | None) = None
  var message : String trn = "Requested " + _qos.string()

  try
    var q : Qos = (subAckPacket.approvedQos() as Qos)
    approved = q.string()
    message.append(" Approved " + q.string())
  else
    message.append(" Rejected")
  end  

  _router.onSubscribeComplete(_this, _topic, subAckPacket.id(), consume message, approved)

/********************************************************************************/
fun ref onUnsubAck(basePacket : BasePacket val)  =>
  """
  Our unsubscribe has been acknowledged so we need to tell router to remove us from
  the map of subscribers.
  TODO - Why don't we respond directly to main instead of going via router?
  TODO - We may also have some packets in our queue and we need to decide what to do
  about these
  """
  // Note this is an unsuback packet NOT a UNSUBSCRIBE packet
 
  // id is in bytes 2 and 3
  var cid = BytesToU16(basePacket.data().trim(2,4)) 
  if cid > 0 then 
    _router.onUnsubscribeComplete(_this, cid)
    var msg : String val =  "Unsubscribed"
    _router.onMessage(_topic, msg.array())
  else
    Debug.err("Zero id in UnsubAck packet at " + __loc.file() + ":" +__loc.method_name())
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
  router we have completed processing the id. The packet is never stored in _pktMap
  
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
      Debug.err("Invalid Id in publish packet at " + __loc.file() + ":" +__loc.method_name())
      Debug(basePacket.data() where stream = DebugErr)
    end  
  end

/********************************************************************************/
fun doPubAck(id : IdType) =>
  """
  All we have is an id, so make the pubAck packet and send it. No look-ups with id
  so we don't care whether it is Broker or Client assigned.
  Note that QoS 1 packets are never stored in _pktMap so there is no remove to do
  """
  if (id == 0) then
      Debug.err("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  //Debug.err("Pub ack at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
  _router.send(PubAckPacket.compose(id))
 

/********************************************************************************/
fun ref doPubRec(id : IdType) =>
  """
  We have received a publish message with QoS 2. We acknowledge this with a 
  PubRec message and wait for a PubRel in response. No id lookup so we don't 
  care whether this is a Bid or  Cid
  """
  if (id == 0) then
      Debug.err("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end

  _router.send(PubRecPacket.compose(id))
 

/********************************************************************************/
fun ref onPubRel(basePacket : BasePacket val) =>
  """
  We have received a publish release message for a QoS 2 packet. Send a pubComp
  to ack this. The payload was stored when we received the publish message and 
  we need to retrieve this from the packetMap to release it. 
  Then we **delete the message** from the packet Map and tell router we have completed
  processing.
  Note - we do a lookup with id on _pktMap so we can't mix Bid and Cid in one
  subscriber instance. 
  """
  var pubRelPacket = PubRelPacket.createFromPacket(basePacket)
  
  if (pubRelPacket.id() == 0) then
    Debug ("Invalid id at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
  end
  doPubComp(pubRelPacket.id())

  try 
    (var bid , var packet ) = _pktMap.remove(pubRelPacket.id())?
    releasePkt(packet) 
  else
    Debug.err("Unable to release QoS 2 packet id " + pubRelPacket.id().string()  +  " in " + __loc.file() + ":" +__loc.method_name())
  end
  payloadComplete(pubRelPacket.id())

/********************************************************************************/
fun doPubComp(id : IdType) =>
  """
  We have received a PubRel from a sender so we acknowledge this with a PubComp 
  message. We only have the id at this stage so there is little else to do. No
  lookups on id so we don't care whether it is a Bid or a Cid.
  """
  _router.send(PubCompPacket.compose(id))

/********************************************************************************/
fun releasePkt(pubPacket : PublishPacket val) =>
  """
  We are at an appropriate place in the protocol to release the message to the 
  application. This can be:
  1. After receiving a ControlPublish with QoS 0
  2. After receiving a ControlPublish with QoS 1
  2. After receiving a ControlPubRel with QoS 2
  """
  try
    var topic : String val = pubPacket.topic() as String
    _router.onMessage(topic, (pubPacket.payload() as ArrayVal))
  else
    Debug.err("Packet error in " + __loc.method_name())
  end

/********************************************************************************/
fun ref payloadComplete(bid : IdType) =>
  """
  Informs router that we have finished processing this id.
  """
  if (bid == 0) then
      Debug.err("Zero Broker Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  _router.onPayloadComplete(bid)
