use "bureaucracy"
use "time"
use "debug"
use ".."
use "../publisher"
use "../primitives"
use "../router"
use "../utilities"

class TsNotify is TimerNotify
  var _count: U64 = 0
  var _reg : Registrar
  var _pub : Publisher
  var _topic : String val 

  new iso create(reg: Registrar, pub : Publisher, topic : String val) =>
    _reg = reg
    _pub = pub
    _topic = topic

  fun ref apply(timer: Timer,count: U64): Bool =>
    _count = _count + count
    _pub.publish(PublishArgs(_topic, MqTime.startTime().array(), Qos2))
    _count < 10

  fun ref cancel(timer: Timer) =>
    _reg[Router](KeyRouter()).next[None]({(r : Router)=>r.showStatus("Timestamp publisher cancelled")})


actor Timestamper
  let _reg : Registrar
  let _pub : Publisher
  let _topic : String val = "timestamp"
  var _timerTag : Timer tag
  var _timers : Timers

  new create(reg : Registrar) =>
    _reg = reg
    _pub = Publisher(_reg,_topic)
    
    _timers = Timers
    let timer : Timer iso = Timer(TsNotify(_reg, _pub, _topic),1000000000, 1000000000)
    _timerTag = timer
    _timers(consume timer)

  be mute() =>
    _timers.cancel(_timerTag)  