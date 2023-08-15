use "time"

class UiNotify is TimerNotify
  var _count: U64 = 0
  let _term : Display

  new iso create(term: Display) =>
    _term = term

  fun ref apply(timer: Timer,count: U64): Bool =>
    _count = _count + count
    (var s : I64, var ns : I64) = Time.now()
    _term.onTick(s)
    true

  fun ref cancel(timer: Timer) =>
    None

actor UIManager
  let _term : Display
  var _timerTag : Timer tag
  var _timers : Timers

  new create(term : Display) =>
    _term = term
    _timers = Timers
    let timer = Timer(UiNotify(_term), 1_000_000_000, 2_000_000_000)
    _timerTag = timer
    _timers(consume timer) 

  be mute() =>
    _timers.cancel(_timerTag)  