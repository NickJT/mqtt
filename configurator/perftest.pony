use "bureaucracy"
use "time"
use "debug"
use ".."
use "../publisher"
use "../primitives"
use "../router"
use "../utilities"
use "collections"

actor MessageTest
  let _reg : Registrar
  let _testPub : Publisher
  let _testTopic : String val = "MessageTest/q0"
  let _count : U64 = 1000

  new create(reg : Registrar) =>
    _reg = reg
    _testPub = Publisher(_reg,_testTopic)
    var args = PublishArgs(_testTopic, Datestamp().array(), Qos0)
    for i in Range[U64](0,_count) do 
      _testPub.publish(args)
    end

  be mute() =>
   None  