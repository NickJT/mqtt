use "bureaucracy"
use "collections"
use "time"

use ".."
use "../publisher"
use "../subscriber"
use "../primitives"
use "../utilities"

class SoakPublisher is TimerNotify
  var _count : U64 = 0
  var _reps : U64 = 0
  let _testTopic : String val = "stats/soaktest"
  var _publisher : Publisher tag

  new iso create (reg : Registrar, reps : U64) =>
   _reps = reps
   _publisher = Publisher(reg,_testTopic)

  fun ref apply(timer : Timer, count : U64) : Bool =>
    _count = _count + count
    var payload : String val = _count.string() + " - " + Timestamp()
    _publisher.publish(PublishArgs(_testTopic, payload.array(), Qos0))
    _count < _reps

  fun ref cancel(timer: Timer) =>
    var payload : String val = _count.string() + " - completed "  + Timestamp()
    _publisher.publish(PublishArgs(_testTopic, payload.array(), Qos0))

  
actor SoakTester
  let _reg : Registrar
  let _reps : U64 = 10
  let _timers : Timers = Timers
  let _timer : Timer tag

  new create(reg : Registrar) =>
    _reg = reg
    var timer = Timer(recover iso SoakPublisher(_reg, _reps) end, 3_000_000_000, 10_000_000)
    _timer = timer
    _timers(consume timer)
