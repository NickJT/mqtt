use "debug"
use "time"

class UiTimer is TimerNotify
"""
TODO - Not used at present. Instead we're using a manually constructed delegate in
the Terminal actor. 
"""
  var _count: U64 = 0
  var _cb : {(I64)}

  new iso create(cb : {(I64)} iso) =>
    _cb = consume cb

  fun ref apply(timer: Timer, count: U64): Bool =>
    _count = _count + count
    (var s : I64, var ns : I64) = Time.now()
    _cb(s)
    true
    
  fun ref cancel(timer: Timer) =>
    Debug("UI timer cancelled" where stream = DebugErr)