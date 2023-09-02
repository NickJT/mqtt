---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "bureaucracy"
use "collections"
use "debug"
use "time"

use ".."
use "../publisher"
use "../subscriber"
use "../primitives"
use "../utilities"

class SoakPublisher is TimerNotify
  var _reps : U64 
  var _index : U64 = 0
  let _testTopic : String val = TestPrefix()+TestTopic()
  var _publisher : Publisher tag
  var _subscriber : Subscriber tag

  new iso create (reg : Registrar) =>
   _reps = TestLength()
   _publisher = Publisher(reg,_testTopic)
   _subscriber = Subscriber(reg,_testTopic, "Qos0")
   _subscriber.subscribe()

  fun ref apply(timer : Timer, count : U64) : Bool =>
    //if (count != 1) then Debug.err("Soaktest counter = " + count.string()) end
    _publisher.publish(PublishArgs(_testTopic, _index.string().array(), Qos1))
    _index = _index + 1
    _reps > _index 

  fun ref cancel(timer: Timer) =>
    var payload : String val = "Sent " + (_index).string() + " messages"
    _publisher.publish(PublishArgs(_testTopic, payload.array(), Qos0))

  
actor SoakTester
  let _reg : Registrar
  let _timers : Timers = Timers
  let _timer : Timer tag

  new create(reg : Registrar) =>
    _reg = reg
    var timer = Timer(recover iso SoakPublisher(_reg) end, 0, TestInterval())
    _timer = timer
    _timers(consume timer)

  be mute() =>
    _timers.cancel(_timer)
```````