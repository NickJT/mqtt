use "time"
use "bureaucracy"
use "debug"
use "../primitives"
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
  Debug("SystemTick cancelled")


actor Ticker 
  """
  Ticker is used by router to schedule calls to every publisher and subscriber to 
  check message queues for expiry
  The timer fires every <period> seconds for a maximum of <repetitions> times. 
  If <repetitions> is zero then the timer fires until it is cancelled 
  """
  let _router : Router 
  let _tickTime : Timer tag
  let _timers :Timers 

  new create(router : Router, period /* seconds */: U64 val = 1, repetitions : U64 = 0) =>
    _router = router
    _timers = Timers
    var delay : U64 val = 1 /*seconds*/
    let tickTime' =  Timer(Tick(_router,repetitions), delay * 1000000000, period * 1000000000) // 3s
    _tickTime = tickTime'
    _timers(consume tickTime')

/************************************************************************/
be cancel() =>
  _timers.cancel(_tickTime)
  //Debug("Ticker cancelled")
