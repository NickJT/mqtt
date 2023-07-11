
class PublishArgs
  """
  A simple class to enable a set of args for a publish behaviour to be grouped 
  and stored in an array
  """
  var id : IdType 
  let topic : String val 
  let payload : ArrayVal
  let qos : Qos val
  let retain: Bool 
  let dup: Bool 

  new val create (
    topic' : String val,
    payload' : ArrayVal,
    qos' : Qos val = Qos0,
    d': Bool = false,
    r': Bool = false,
    id' : IdType = 0 ) =>
    
    topic = topic'
    payload = payload'
    qos = qos'
    retain = r'
    dup = d'
    id  = id'

  new val createWithId(args : PublishArgs val, newId : IdType) =>
    topic = args.topic
    payload = args.payload
    qos = args.qos
    retain = args.retain
    dup = args.dup
    id  = newId
  