use "bureaucracy"
use "time"
use "debug"
use ".."
use "../publisher"
use "../subscriber"
use "../primitives"
use "../router"
use "../utilities"
use "collections"

actor MessageTest
  let _reg : Registrar
  let _testPub : Publisher
  let _testSub : Subscriber
  let _testTopic : String val = "benchmark"
  let _count : U64 = 1000

  new create(reg : Registrar) =>
    _reg = reg
    _testPub = Publisher(_reg,_testTopic)
    _testSub = Subscriber(_reg,_testTopic, "qos0")
    var args = PublishArgs(_testTopic, Timestamp().array(), Qos2)
    _testSub.subscribe()
    for i in Range[U64](0,_count) do 
      _testPub.publish(args)
    end
    
  be mute() =>
   None  