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
use "package:../primitives"
use "package:../router"
use ".."

class Ping is TimerNotify
"""
Simple timerNotify class to provide a keepalive ping 
""" 

  var _count: U64 = 0
  let _router : Router

  new iso create(router: Router) =>
    _router = router
    _count = 0

  fun ref apply(timer: Timer, count: U64): Bool =>
    _router.doPing()
    true

  fun ref cancel(timer: Timer) =>
    _router.onStatus("KeepAlive cancelled")


actor Pinger 
"""
Keep alive pinger. Starts a timer that calls .doPing() on the router tag
stored in _reg.  
"""
  let _router : Router 
  let _pingTime' : Timer tag
  let _timers :Timers 

  new create(router: Router, period /* seconds */: U64 val, repetitions : U64 = 0) =>
   _router = router
   _timers = Timers
   var delay : U64 val = 3 /*seconds*/
   let pingTime =  Timer(Ping(_router), delay * 1000000000, period * 1000000000) // 3s
  _pingTime' = pingTime
   _timers(consume pingTime)

be cancel() =>
  _timers.cancel(_pingTime')

```````