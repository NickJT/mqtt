---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "bureaucracy"
use "time"
use "debug"
use ".."
use "../publisher"
use "../primitives"
use "../utilities"

class Timestamp is TimerNotify
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
    var timestring : String val = 
    recover val
      (var sec, var nano) = Time.now()
      var datetime : PosixDate = PosixDate.create(sec,nano)
      var stg : String ref = String
      stg.append(FmtDec(datetime.hour))
      stg.append(":")
      stg.append(FmtDec(datetime.min))
      stg.append(":")
      stg.append(FmtDec(datetime.sec))
      consume stg
     end
     var args = PublishArgs(_topic, timestring.array(), Qos2)
    _pub.publish(args)
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
    let timer : Timer iso = Timer(Timestamp(_reg, _pub, _topic),1000000000, 1000000000)
    _timerTag = timer
    _timers(consume timer)

  be mute() =>
   _timers.cancel(_timerTag)  
```````