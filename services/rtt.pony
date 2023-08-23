use "collections"
use "debug"
use "time"

use "package:../mqtt"
use "package:../terminal"
use "package:../utilities"


actor Rtt is MqttService
  """
  A simple service to measure the round-trip time with the configured broker.
  On creation we publish a message on the given topic and then wait for a response
  to be returned via the onResponse behaviour.
  """
  let _mqtt : Mqtt tag
  let _terminal : Terminal tag
  let _topic : String val
  let _times : Map[U32, MqTime] =  Map[U32, MqTime]
  let _elapsed : Array[I64] = Array[I64]
  var _i : U32 = 0

  new create(topic: String val, mqtt: Mqtt tag, terminal: Terminal tag) =>
    _topic = topic
    _mqtt = mqtt
    _terminal = terminal
    _mqtt.subscribe(topic, "qos0")

  be onExit() =>
    _terminal.onStatus("RTT Exiting")
    _mqtt.subscribe(_topic, None)

  be onResponse(topic: String val, payload : Array[U8] val) =>
    if (String.from_array(payload) != "Subscribed") then 
      try 
        var timestamp : MqTime = _times(payload.read_u32(0)?)?
        _elapsed.push(timestamp.elapsed())
      end
      if (_elapsed.size() == 100 ) then
        doCalc()
      end
    end
    doPublish()

  fun ref doPublish() =>
    _times.insert(_i, MqTime)
    _mqtt.publish(_topic, asArray(_i), "qos0")  
    _i = _i + 1    

  fun ref doCalc() =>
    var total : I64 = 0
    for e in _elapsed.values() do 
      total = total + e
    end
    var av : I64 = total/_elapsed.size().i64()
    _elapsed.clear()
    _times.clear()
    _i = 0
    _terminal.onStatus("Rtt = " + av.string())
  
  
  fun ref asArray(i : U32) : Array[U8] val =>
    recover val 
      var array : Array[U8] = Array[U8]
      array.push_u32(i)
      array
    end