use "time"
use "bureaucracy"
use "debug"
use "../primitives"
use "../router"
use ".."

class Ping is TimerNotify
"""
Fire the time <reps> number of times and then cancel. If reps is zero
 then the timer does not cancel itself
""" 

  var _count: U64 = 0
  let _reg : Registrar
  let _reps : U64 

  new iso create(reg: Registrar, reps : U64 = 0) =>
    _reg = reg
    _count = 0
    _reps = reps

  fun ref apply(timer: Timer, count: U64): Bool =>
    _count = _count + count
    _reg[Router](KeyRouter()).next[None]({(r : Router) => r.doPing()})
    // false to cancel
    (_reps > _count)

  fun ref cancel(timer: Timer) =>
    _reg[Router](KeyRouter()).next[None]({(r : Router) => r.showStatus("KeepAlive cancelled")})


actor Pinger 
"""
Keep alive pinger. Starts a timer that calls .doPing() on the router tag
stored in _reg.  
The timer fires every <period> seconds for a maximum of <repetitions> times. 
If <repetitions> is zero then the timer fires until it is cancelled 
"""
  let _reg : Registrar 
  let _pingTime' : Timer tag
  let _timers :Timers 

  new create(reg: Registrar, period /* seconds */: U64 val, repetitions : U64) =>
   _reg = reg
   _timers = Timers
   var delay : U64 val = 3 /*seconds*/
   let pingTime =  Timer(Ping(_reg,repetitions), delay * 1000000000, period * 1000000000) // 3s
  _pingTime' = pingTime
   _timers(consume pingTime)

be cancel() =>
  _timers.cancel(_pingTime')
  //Debug("Pinger cancelled")
