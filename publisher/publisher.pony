use "debug"
use "bureaucracy"
use "../primitives"
use "../utilities"
use "../idIssuer"
use ".."

actor Publisher is IdNotifyArgs
  """
  Represents an application level publication of one message to one topic. We're starting with this minimum
  level of aggregation for simplicity but we will need to add a persistant topic publisher later.
  In that event, this actor (one message to one topic) would probably become an intermediate stage and 
  the persistant publisher will look after state and timeouts.
  Publishes the payload to the topic with which this instance of Publisher was created. The sequence is:
  1. Calls PublishPacket to compose the Publish data packet by combining the topic
  argument used in instantiation and the arguments passed
  2. Passes itself to IdIssuer to get the next unique id

  IdIssuer calls apply on this instance of Publisher once it has allocated an id. The
  apply behaviour then calls publish on router with the completed packet

  TODO - The classes for the Pub ack types are virtually identical and could all be 
  replaced by a factory class once we have all the functions coded

  """
  let _reg : Registrar
  let _topic : String val
  let _idNotify : IdNotifyArgs tag = this 
  let _publisher : Publisher tag = this 

  new create(reg : Registrar, topic: String val) =>
    _reg = reg
    _topic = topic

/********************************************************************************/
be publish(payload : ArrayVal,  qos : Qos val, retain: Bool = false) =>
  """
  Public API call to publish a payload
  """
  _reg[IdIssuer tag](KeyIssuer()).next[None]({(issuer) => issuer.checkOutArgs(_idNotify, payload, qos, retain)},
    {()=> Debug("No issuer!")})


/********************************************************************************/
be apply(id: U16, payload : ArrayVal,  qos : Qos, retain: Bool ) =>
  """
  Called to add an id to the other arguments before building the publish packet  
  """    
  var basePacket = PublishPacket.compose(id, _topic, payload, qos where d = false,  r = retain)

  _reg[Router](KeyRouter()).next[None]({(router) =>
      router.onPublish(_publisher, _topic, id , basePacket)
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
fun onPubAck(basePacket : BasePacket val) =>
  var pubAckPacket : PubAckPacket val = PubAckPacket.createFromPacket(basePacket)
  if (not pubAckPacket.isValid()) then 
    Debug("Got invalid PubAck packet - id = " + pubAckPacket.id().string())  
    // TODO - Add some cleanup here
    return
  end
  // Our QoS 1 publication has been received so we can remove it from the in-flight 
  // list and check-in the id
  Debug("Completed QoS 1 publication id " + pubAckPacket.id().string())
  // TODO - implement cleanup


/********************************************************************************/
fun onPubRec(basePacket: BasePacket val) =>
  var pubRecPacket : PubRecPacket val = PubRecPacket.createFromPacket(basePacket)
  if (not pubRecPacket.isValid()) then 
    Debug("Got invalid PubRec packet - id = " + pubRecPacket.id().string())  
    // TODO - Add some cleanup here
    return
  end
  // Our QoS 2 publication has been received so we can send a PubRel packet to
  // the Broker to acknowledge receipt of the PubRec
  doPubRel(pubRecPacket.id())

/********************************************************************************/
fun onPubComp(basePacket: BasePacket val) =>
  var pubCompPacket : PubCompPacket val = PubCompPacket.createFromPacket(basePacket)
  if (not pubCompPacket.isValid()) then 
    Debug("Got invalid PubComp packet - id = " + pubCompPacket.id().string())  
    // TODO - Add some cleanup here
    return
  end
  // The Broker has completed the processing of our QoS 2 publication, so we can
  // so we can remove it from the in-flight list and check-in the id 
  Debug("Completed QoS 2 publication id " + pubCompPacket.id().string())
  // TODO - implement cleanup


/********************************************************************************/
fun doPubRel(id : IdType) =>
  """
  Send a PubRelPacket with the passed id to the router. Includes a id = 0 guard but
  this can probably be optimised out later
  """
  if (id == 0) then
    Debug("Zero Id found in " + __loc.file() + ":" +__loc.method_name())
    return
  end
  _reg[Router](KeyRouter()).next[None]({(r: Router)=>r.send(PubRelPacket.compose(id))})

/********************************************************************************/
be onTick(sec : I64) =>
  """
  This is the target for the TickListener trait that is called by the system tick
  tick timer. Each time we get this we scan the in-flight queue for expired messages
  """
  Debug(_topic.string() + " subscriber got system tick " + sec.string())

