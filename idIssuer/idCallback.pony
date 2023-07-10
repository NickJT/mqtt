
use "debug"
use "bureaucracy"

actor IdCallback is IdNotify
"""
A callback class used by actors that need a unique id 
"""
   let _reg : Registrar
   let _topic : String
   let _qos : String

   new create(reg : Registrar, topic : String, qos : String) => 
      _reg = reg
      _topic = topic
      _qos = qos


  be apply(id : U16) =>
      Debug("Spawning subscriber for " + _topic + " with id = " + id.string())
     // Subscriber(_reg, id, _topic, _qos)

