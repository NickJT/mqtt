/********************************************************************************/
  use "debug"
  use "bureaucracy"
  use "collections"

  use ".."
  use "../idIssuer"
  use "../primitives"
  use "../utilities"

actor Publisher is (IdNotifyPub & MqActor)
  """
  Represents an application level publication topic. Provides a public Publish topic
  that:
  1. takes the payload and qos
  1. passes these arguments to IdIssuer to get the next unique id
  2. provides an apply behaviour so IdNotifyPub can call us back and trigger sending
   the completed publish packet to router

  Publisher is responsible for managing its in-flight window. For 3.1.1 we will keep this
  to one packet for now but with a view to parameterizing this for MQTT 5 compliance.

  To manage the in-flight window we only allow n messages to be pending ack and queue any
  that arrive before the ack arrives. For 3.1.1 compliance we only need to do this for QoS 1.
  
  TODO - The classes for the Pub ack types are virtually identical and could all be 
  replaced by a factory class once we have all the functions coded

  """
  let _reg : Registrar
  let _topic : String val
  let _idNotify : IdNotifyPub tag = this 
  let _publisher : Publisher tag = this 
  let _inFlightWindow : USize = 1  

  var _qos1Map : Map[IdType, PublishArgs val]
  """
  A map for storing our in-flight QoS 1 messages. We keep these separate from
  QoS 2 messages because we use the size of this map to track the number of
  QoS 1 message we have in-flight. 
  """ 

  var _pending : Array[PublishArgs val] 
  """
  We store any QoS1 messages in the _pending array if we have already reached our 
  in-flight limit. We use an array here to get fifo behaviour using push (to back)
  and shift (from front)
  """

  var _qos2Map : Map[IdType, PublishArgs val]
  """
  A map for the in-flight QoS 2 messages. 
  """
  
  var _pubRelMap : Map[IdType, ArrayVal] 
  """
  A map for the in-flight QoS 2 messages 
  """

  new create(reg : Registrar, topic': String val) =>
    _qos1Map = Map[IdType, PublishArgs val]
    _pending = Array[PublishArgs val]  
    _qos2Map = Map[IdType, PublishArgs val]
    _pubRelMap = Map[IdType, ArrayVal]
    _reg = reg
    _topic = topic'

/********************************************************************************/
be publish(args : PublishArgs val) =>
  """
  Public API call to publish a payload
  """
  _reg[IdIssuer tag](KeyIssuer()).next[None]({(issuer) => issuer.checkOutPub(_idNotify, args)},
    {()=> Debug("No issuer!")})


/********************************************************************************/
be apply(args : PublishArgs val) =>
  """
  Called by IdIssuer once an id has been allocated and we have a complete
  set of arguments to send and/or save to the queue. NextQosnArgs determines
  whether we:
  1. continue to publish the current set of args
  2. pull a different set of args of the pending queue and send those instead,
  queuing our current set
  3. queue the current set and wait for a space to open in the in-flight window
  In the case of QoS 0, we always just send the current args immediately 
  """ 
  if (args.qos is Qos2) then 
    nextQos2Args(args)
  elseif (args.qos is Qos1) then
    nextQos1Args(args)
  else
    sendToRouter(args)
  end

/********************************************************************************/
fun ref nextQos1Args(argsOrNone : (PublishArgs val | None)) =>
  """
  Manages the in-flight window for QoS 1 messages and saves the packet in case we
  don't get a pubAck

  If we are passed args we push them onto the back of the pending queue. Then we 
  check whether the in-flight window is open. If it is we take the args at the head
  of the queue, send them to router and add the packet to the in-flight map.

  If we are passed None, we check whether the in-flight window is open. If it is we
  take the args at the head of the queue, if there are any, and send them to router, 
  addding the packet to the in-flight map.
  """

  try
    _pending.push(argsOrNone as PublishArgs val)  // if we have args then queue them
  else
    if (_pending.size() == 0 ) then return end    // if we have None and the queue is empty then there's nothing to do
  end

  if (inFlightLimitReached()) then  // We can't send any more packets from the queue so return
    try  //TODO - Only for debugging. Remove converson and fail silently later. 
      var args = argsOrNone as PublishArgs val
      Debug("Queued QoS 1 id " + args.cid.string() + " In-flight: " + _qos1Map.size().string() + " Queued: " + _pending.size().string())
    end  
    return  
  end

  var nextArgs : PublishArgs val
  // next args to send are at the front of the queue. We know the queue isn't empty here.
  try
    nextArgs = _pending.shift()?
  else 
    Debug("\nProgram error in " + __loc.file() + ":" +__loc.method_name() + "\n")
    return
  end  
  sendToRouter(nextArgs)
  _qos1Map.insert(nextArgs.cid, nextArgs)

/********************************************************************************/
fun inFlightLimitReached() : Bool =>
  """
  Returns true if there are fewer messages in-flight than our in-flight limit
  """
  not (_qos1Map.size() < _inFlightWindow)

/********************************************************************************/
fun ref nextQos2Args(argsOrNone : (PublishArgs val | None)) =>
  """
  For protocol Vsn 3.1.1 there is no in-flight limit for QoS 2 messages. This means 
  the all we need to do is save the packet in case we don't get a pubRec. We're
  doing it like this though because protocol Vsn 5 has in-flight windows for all QoS.
  Only called from within publisher so must be using Cid
  """
  try
    var args : PublishArgs val = argsOrNone as PublishArgs val
    _qos2Map.insert(args.cid, args)
    sendToRouter(args)
  else
    Debug("\nProgram error in " + __loc.file() + ":" +__loc.method_name() + "\n")
  end

/********************************************************************************/
be onData(basePacket : BasePacket val) =>
  """
  Called by router via the findPublisherById map [Cid,Published] when it receives
  one of the three publish acknowledge packets (PubAck for QoS1, PubRec or PubComp for Qos2)
  """
  // No need for a guard because the match statement will catch anything that is invalid
  match basePacket.controlType()
  | ControlPubAck => onPubAck(basePacket)
  | ControlPubRec => onPubRec(basePacket)
  | ControlPubComp => onPubComp(basePacket)
  else
    Debug ("Unexpected " + basePacket.controlType().string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end    

/********************************************************************************/
fun sendToRouter(args: PublishArgs val) =>
  """
  Make a publish packet with the passed arguments and send it to router
  """
    _reg[Router](KeyRouter()).next[None]({(router) => router.onPublish(_publisher, args.topic, args.cid, PublishPacket.compose(args))}) 


/********************************************************************************/
be onTick(sec : I64) =>
  """
  This is the target for the TickListener trait that is called by the system tick
  tick timer. Each time we get this we scan the in-flight queue for expired messages
  """
  Debug(_topic.string() + " publisher got system tick " + sec.string())

/********************************************************************************/
fun ref onPubAck(basePacket : BasePacket val) =>
  """
  The single ack packet for QoS 1 messages. Once we get this we can discard the 
  publish message. The onPubAck can only be called in response to a routed PubAck
  generated by the Broker in response to a Publish with a Cid. So id is Cid
  """
  var pubAckPacket : PubAckPacket val = PubAckPacket.createFromPacket(basePacket)
  if (not pubAckPacket.isValid()) then 
    Debug("Got invalid PubAck packet - id = " + pubAckPacket.id().string())  
    return
  end

  try 
    _qos1Map.remove(pubAckPacket.id())?
  else
    Debug("Couldn't find QoS 1 publication with id " + pubAckPacket.id().string() + "  in " + __loc.file() + ":" +__loc.method_name())
  end  
  publishComplete(pubAckPacket.id())

  // Now we need to check the pending queue to see if any messages were
  // queued while the in-flight window was closed
  nextQos1Args(None)

/********************************************************************************/
fun ref onPubRec(basePacket: BasePacket val) =>
  """
  The first of the two acknowledgements for a QoS 2 transaction. Once we get a
  PubRec we can discard the publish message then send (and store) a PubRel
  """
  var pubRecPacket : PubRecPacket val = PubRecPacket.createFromPacket(basePacket)
  if (not pubRecPacket.isValid()) then 
    Debug("Got invalid PubRec packet - id = " + pubRecPacket.id().string())  
    return
  end
  // Our QoS 2 publication has been received so we can delete the packet from 
  // the in-flight map and send a PubRel packet to the Broker to acknowledge
  // receipt of the PubRec
  try
    _qos2Map.remove(pubRecPacket.id())?
  else
    Debug("Couldn't remove QoS 2 message id " + pubRecPacket.id().string() + "  at " + __loc.file() + ":" +__loc.method_name())
  end
  doPubRel(pubRecPacket.id())


/********************************************************************************/
fun ref doPubRel(cid : IdType) =>
  """
  Send a PubRelPacket with the passed Cid to the router.
  """
  var data  = PubRelPacket.compose(cid)
  //Debug("Inserted id " + id.string() + " in _pubRel at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  
  _pubRelMap.insert(cid,data)
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.send(data)})


/********************************************************************************/
fun ref onPubComp(basePacket: BasePacket val) =>
  """
  The second of the two acknowledgement messages of the QoS 2 transaction. Once we
  get a PubComp we can delete the saved PubRel message and check-in the id. Always
  called with a Cid
  """
  var pubCompPacket : PubCompPacket val = PubCompPacket.createFromPacket(basePacket)
  if (not pubCompPacket.isValid()) then 
    Debug("Got invalid PubComp packet - cid = " + pubCompPacket.id().string())  
    // TODO - Add some cleanup here
    return
  end

  try
    _pubRelMap.remove(pubCompPacket.id())?
    //Debug("Removed id " + pubCompPacket.id().string() + " in _pubRel at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  else
    Debug("Unable to remove client id " + pubCompPacket.id().string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end
  publishComplete(pubCompPacket.id())
  
/********************************************************************************/
fun ref publishComplete(cid : IdType) =>
  """
  Called when we have received our last publish acknowledgement. We can now
  remove the pubRel message from the map and tell the router to do it's necessary
  cleanup before it releases the id. 
  This function should be preceded by deletion of the publish packet in the case
  of QoS 1 publication and by deletion of the PubRel packet in the case of QoS 2.
  """
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onPublishComplete(cid)})

/********************************************************************************/
be onDuckAndCover() => 
  """
  We need to save state because the broker is disconnecting or something has gone awry.   
  """
  Debug(_qos1Map.size().string() + " unreleased packets in " + _topic + " _qos1Map")
  Debug(_pending.size().string() + " unreleased packets in " + _topic + " _pending")
  Debug(_qos2Map.size().string() + " unreleased packets in " + _topic + " _qos2Map")
  Debug(_pubRelMap.size().string() + " unreleased packets in " + _topic + " _pubRelMap")

