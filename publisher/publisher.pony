/********************************************************************************/
  use "debug"
  use "bureaucracy"
  use "collections"

  use ".."
  use "../idIssuer"
  use "../primitives"
  use "../utilities"

actor Publisher is IdNotifyPub
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
  set of arguments to send and/or save to the queue
  """ 
  var argsOrNone : (PublishArgs val | None) = args
  if (args.qos is Qos2) then 
    argsOrNone = nextQos2Args(args)
  elseif (args.qos is Qos1) then
    argsOrNone = nextQos1Args(args)
  end
  // Nothing needed for QoS 0
  try
    var nextArgs = argsOrNone as PublishArgs val
    sendToRouter(nextArgs)
  end

/********************************************************************************/
fun sendToRouter(args: PublishArgs val) =>
  """
  Finally - we send the publish packet to router
  """
    _reg[Router](KeyRouter()).next[None]({(router) => router.onPublish(_publisher, args.topic, args.id, PublishPacket.compose(args))}) 

/********************************************************************************/
fun ref nextQos1Args(args : PublishArgs val) : (PublishArgs val | None) =>
  """
  Manages the in-flight window for QoS messages and saves the packet in case we
  don't get a pubAck
  """
  // limit this in-flight window to QoS 1 messages 
  if (not (args.qos is Qos1)) then
    Debug("Incorrect QoS message received by " + __loc.file() + ":" +__loc.method_name())
    return None
  end

  // If we have we reached our in-flight limit then push the current set of args onto 
  // the pending queue
  if (inFlightLimitReached()) then
    _pending.push(args)
    Debug("Queued QoS 1 id " + args.id.string() + " in-flight " + _qos1Map.size().string() + " queued " + _pending.size().string())
    return None
  end

  // if there are any entries in the queue then we want to send these first so push 
  // args on the back of the queue and shift the args at the front of the queue out
  // ready to send 
  var nextArgs : PublishArgs val = args
  if (_pending.size() > 0) then
    _pending.push(args)
    try nextArgs = _pending.shift()? end  // worse case we get our original back so no error
  end
  // args is now either the passed argument if the in-flight window had space or the
  // args that had been waiting longest in the queue
  // before we return it we also need to save it in case we don't get an ack
  _qos1Map.insert(nextArgs.id, nextArgs)
  nextArgs

/********************************************************************************/
fun inFlightLimitReached() : Bool =>
  """
  Returns true if there are fewer messages in-flight than our in-flight limit
  """
  not (_qos1Map.size() < _inFlightWindow)

/********************************************************************************/
fun ref nextQos2Args(args : PublishArgs val) : (PublishArgs val | None) =>
  """
  For protocol Vsn 3.1.1 there is no in-flight limit for QoS 2 messages. This means 
  the all we need to do is save the packet in case we don't get a pubAck. We're
  doing it like this though because protocol Vsn 5 has in-flight windows for all QoS
  """
  _qos2Map.insert(args.id, args)
  args

/********************************************************************************/
be onAck(basePacket : BasePacket val) =>
  """
  Called by router via the findPublisherById map when it receives one of the three
  publish acknowledge packets (PubAck for QoS1, PubRec or PubComp for Qos2)
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
  publish message
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

  // Now we need to check whether there is any space in the in-flight window
  // and, if so, whether there are any messages in the pending queue
  // Note that the in-flight space check is needed otherwise we will take a
  // message from the front of the queue and then queue it at the back - which 
  // will destroy our message order
  if (not inFlightLimitReached()) then
    try 
      sendToRouter(nextQos1Args(_pending.shift()?) as PublishArgs val)
    else
      Debug("Nothing in pending queue")
    end 
  end

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
fun ref onPubComp(basePacket: BasePacket val) =>
  """
  The second of the two acknowledgement messages of the QoS 2 transaction. Once we
  get a PubComp we can delete the saved PubRel message and check-in the id
  """
  var pubCompPacket : PubCompPacket val = PubCompPacket.createFromPacket(basePacket)
  if (not pubCompPacket.isValid()) then 
    Debug("Got invalid PubComp packet - id = " + pubCompPacket.id().string())  
    // TODO - Add some cleanup here
    return
  end

  deletePubRel(pubCompPacket.id())
  publishComplete(pubCompPacket.id())
  

/********************************************************************************/
fun ref doPubRel(id : IdType) =>
  """
  Send a PubRelPacket with the passed id to the router. Includes a id = 0 guard but
  this can probably be optimised out later
  """
  if (id == 0) then
    Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
    return
  end
  var data  = PubRelPacket.compose(id)
  savePubRel(id, data)
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.send(data)})

/********************************************************************************/
fun ref savePubRel(id : IdType, data: ArrayVal) =>
  """
  Before sending the pubRel packet we save the already encoded packet data in case
  we don't get a pubComp message and have to resend it.
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  
  _pubRelMap.insert(id,data)

/********************************************************************************/
fun ref deletePubRel(id : IdType) =>
  """
  Called after getting a pubComp message when we know that we won't have to resend
  the pubRel and we can delete it.
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  
  try
    _pubRelMap.remove(id)?
  else
    Debug("Unable to remove id " + id.string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end

/********************************************************************************/
fun publishComplete(id : IdType) =>
  """
  Called when we have received our last publish acknowledgement. We can now
  remove the pubRel message from the map and tell the router to do it's necessary
  cleanup before it releases the id. 
  This function should be preceded by deletion of the publish packet in the case
  of QoS 1 publication and by deletion of the PubRel packet in the case of QoS 2.
  """
  //Debug("Informing router we've completed publication with id " + id.string())
 
  // Not using a guard because we wouldn't have got here without a valid id
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onPublishComplete(id)})


