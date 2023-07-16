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
  1. passes its arguments to IdIssuer to get the next unique id
  2. provides a IdNotifyPub behaviour that sends the completed publish packet to router

  Publisher is responsible for managing its in-flight window. For 3.1.1 we will keep this
  to one packet for now but with a view to parameterizing this for MQTT 5 compliance.

  To manage the in-flight window we only allow n messages to be pending ack and queue any
  that arrive before the ack arrives. For 3.1.1 compliance we only need to do this for QoS 1.
  
  This first version queues the packets after then have been allocated an id. Not sure of
  the trade-offs of doing this before or after yet... 

  TODO - The classes for the Pub ack types are virtually identical and could all be 
  replaced by a factory class once we have all the functions coded

  """
  let _reg : Registrar
  let _topic : String val
  let _idNotify : IdNotifyPub tag = this 
  let _publisher : Publisher tag = this 


  var _pktMap : Map[IdType, ArrayVal] 
  var _pubRelMap : Map[IdType, ArrayVal] 

  let _pending : Array[PublishArgs val] = Array[PublishArgs val]  // use push and shift for fifo
  
  let _inFlight : Array[IdType] = Array[IdType] // the array of in-flight ids  
  let _inFlightWindow : USize = 1  // max length of the _inFlight array

  
  new create(reg : Registrar, topic': String val) =>
    _pktMap = Map[IdType, ArrayVal]
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
  Called by IdIssuer once an id has been allocated. The id is the last of the 
  arguments needed before building the publish packet so we have a complete
  set of arguments to save to the queue
  """ 

  var nextArgs : PublishArgs val = args

  // limit this in-flight window to QoS 1 messages 
  if (args.qos is Qos1) then
    if (_inFlight.size() > _inFlightWindow) then
      _pending.push(args)
      Debug("Queued id ")
      return
    end

    if (_pending.size() > 0) then
      _pending.push(nextArgs)
      try nextArgs = _pending.shift()? end
    end

    _inFlight.push(nextArgs.id)

  end  // of QoS 1 in-flight window management

  var data = PublishPacket.compose(nextArgs)
  _reg[Router](KeyRouter()).next[None]({(router) =>
      router.onPublish(_publisher, nextArgs.topic, nextArgs.id , data)
    }, {()=>
      Debug("No router!")
    }) 


/********************************************************************************/
be onData(basePacket : BasePacket val) =>
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
fun ref onPubAck(basePacket : BasePacket val) =>
  """
  The single ack packet for QoS 1 messages. Once we get this we can discard the 
  publish message and check-in the id
  """
  var pubAckPacket : PubAckPacket val = PubAckPacket.createFromPacket(basePacket)
  if (not pubAckPacket.isValid()) then 
    Debug("Got invalid PubAck packet - id = " + pubAckPacket.id().string())  
    return
  end
  // Our QoS 1 publication has been received so we can remove it from the in-flight 
  // list and check-in the id
  Debug("Completed QoS 1 publication id " + pubAckPacket.id().string())
  
  try 
    var id : IdType = _inFlight.pop()?
    Debug("Popped id " + id.string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    publishComplete(id)
  else
    Debug("In-flight queue is empty")
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
  // Our QoS 2 publication has been received so we can send a PubRel packet to
  // the Broker to acknowledge receipt of the PubRec
  deletePacket(pubRecPacket.id())
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
fun ref savePacket(id : IdType, data: ArrayVal) =>
  """
  Before sending a publish packet we save the already encoded packet data in case
  we don't get a pubAck message and have to resend it.
  TODO - Add functionality to retransmit on reconnect if not cleansession
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  
  _pktMap.update(id,data)

/********************************************************************************/
fun ref deletePacket(id : IdType) =>
  """
  Called after getting a pubAck or PubRec message when we know that we won't have
  to resend it the data.
  """
  if (id == 0) then
      Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
      return
  end
  
  try
    _pktMap.remove(id)?
  else
    Debug("Unable to remove id " + id.string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end

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
  Debug("Completed QoS 2 publication id " + id.string())
 
  // Not using a guard because we wouldn't have got here without a valid id
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.onPublishComplete(id)})

/********************************************************************************/
fun topic() : String val =>
  _topic

/********************************************************************************/
be onTick(sec : I64) =>
  """
  This is the target for the TickListener trait that is called by the system tick
  tick timer. Each time we get this we scan the in-flight queue for expired messages
  """
  Debug(_topic.string() + " subscriber got system tick " + sec.string())

