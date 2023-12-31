---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "time"
use "bureaucracy"
use "debug"
use "../primitives"
use "package:../router"
use ".."

class Tick is TimerNotify
  """
  Fire the timer <reps> number of times and then cancel. If reps is zero
  then the timer does not cancel itself
  """ 
  var _count: U64 = 0
  let _router : Router
  let _reps : U64 

  new iso create(router : Router, reps : U64 = 0) =>
    _router = router 
    _count = 0
    _reps = reps

/************************************************************************/
fun ref apply(timer: Timer, count: U64): Bool =>
  _count = _count + count
  (var s , var ns) = Time.now()
  _router.onTick(s)
  // false to cancel
  (_reps == 0) or (_count < _reps)

/************************************************************************/
fun ref cancel(timer: Timer) =>
  Debug.err("SystemTick cancelled")


actor Ticker 
  """
  Ticker is used by router to schedule calls to every publisher and subscriber to 
  check message queues for expiry
  The timer fires every <period> seconds for a maximum of <repetitions> times. 
  If <repetitions> is zero then the timer fires until it is cancelled 
  """
  let _router : Router 
  var _tickTime : (Timer tag | None) = None
  let _timers :Timers 
  let _repetitions : U64
  let _period : U64

  new create(router : Router, period /* seconds */: U64 val = 1, repetitions : U64 = 0) =>
    _router = router
    _timers = Timers
    _repetitions = repetitions
    _period = period

 
/************************************************************************/
be start() =>
    var delay : U64 val = 1 /*seconds*/
    let tickTime' =  Timer(Tick(_router,_repetitions), delay * 1000000000, _period * 1000000000) // 3s
    _tickTime = tickTime'
    _timers(consume tickTime')


/************************************************************************/
be cancel() =>
  try _timers.cancel(_tickTime as Timer tag) end

```````