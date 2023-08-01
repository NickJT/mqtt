use "debug"
use "time"

class UiTimer is TimerNotify
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