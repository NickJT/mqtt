use "bureaucracy"
use "debug"
use "time"

use "package:../mqtt"
use "package:../primitives"
use "package:../publisher"
use "package:../router"
use "package:../terminal"
use "package:../utilities"

class TsNotify is TimerNotify
  var _count: U64 = 0
  let _mqtt: Mqtt tag
  let _terminal : Terminal tag
  let _topic : String val 

  new iso create(topic: String val, mqtt: Mqtt tag, terminal: Terminal tag) =>
    _topic = topic
    _mqtt = mqtt
    _terminal = terminal

  fun ref apply(timer: Timer,count: U64): Bool =>
    _count = _count + count
    _mqtt.publish(_topic, "qos0", MqTime.startTime().array())
    _count < 10

  fun ref cancel(timer: Timer) =>
    _terminal.onStatus("Timestamp publisher cancelled")


actor Timestamper is MqttService
  var _timerTag : Timer tag
  var _timers : Timers

  new create(topic: String val, mqtt: Mqtt tag, terminal: Terminal tag) =>
    _timers = Timers
    let timer : Timer iso = Timer(TsNotify(topic, mqtt, terminal),1_000_000_000, 1_000_000_000)
    _timerTag = timer
    _timers(consume timer)

  be onExit() =>
    _timers.cancel(_timerTag)  

  be onResponse(topic: String val, payload : Array[U8] val) =>
    Debug.err(String.from_array(payload) + " at " + __loc.file() + ":" +__loc.method_name())

  be dispose() =>
    _timers.cancel(_timerTag)
      