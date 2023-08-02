---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

class PublishArgs
  """
  A simple class to enable a set of args for a publish behaviour to be created
  with sensible defaults
  TODO - This needs modifying to ensure that only the IDIssuer can call createWithId.
  """
  var cid : IdType 
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
    cid' : IdType = 0 ) =>
    
    topic = topic'
    payload = payload'
    qos = qos'
    retain = r'
    dup = d'
    cid  = cid'

  new val createWithId(args : PublishArgs val, newId : IdType) =>
    topic = args.topic
    payload = args.payload
    qos = args.qos
    retain = args.retain
    dup = args.dup
    cid  = newId
  
```````