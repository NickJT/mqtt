use "time"
use "package:mqtt"

actor Main is MqttApplication
  """
  Minimal example of an application to connect, subscribe, publish and disconnect. An application or actor
  must implement the following trait (defined in the mqtt package):

  ```
  trait MqttApplication
  be onConnection(connected : Bool)
  be onSubscribed(topic: String val, qos: (String val | None))
  be onMessage(topic: String val, content: Array[U8] val)
  be onStatus(content: String val)
  ```

  """
  let _out : OutStream
  let _mqtt : Mqtt
  let _this : MqttApplication tag = this 
  var _reps : U8 = 10

  let _systemTopic : String val = "$SYS/broker/messages/received"
  let _appTopic : String val = "timestamp"

  new create(env: Env) =>
    _out = env.out
    _mqtt = Mqtt(env, _this)

    _mqtt.connect(true)

  be onConnection(connected : Bool) =>
    _mqtt.subscribe(_systemTopic, "QOS0")
    _mqtt.subscribe(_appTopic, "qos1")

  be onSubscribed(topic: String val, qos: (String val | None)) =>
    if (topic == _systemTopic) then
      _mqtt.publish(_appTopic, dateStamp(), "Qos2")
    end

  be onMessage(topic: String val, content: Array[U8] val) =>
    _out.print(_reps.string() + " Topic: " + topic + " - " + String.from_array(content))

    if (topic == _systemTopic) then 
      _mqtt.publish(_appTopic, dateStamp(), "qos0")
      _reps = _reps - 1
    end

    if (_reps == 0) then 
      _mqtt.subscribe(_systemTopic, None)
      _mqtt.subscribe(_appTopic, None)
      _mqtt.connect(false)
    end

  be onStatus(content: String val) =>
    _out.print("[" + content + "]")


  fun dateStamp() : Array[U8] val =>
    """
    An aribtrary function to generate some changing data to publish. Not part of the 
    Mqtt trait
    """
    (var s, var ns) = Time.now()
    var stamp : String val = String
    try
      stamp = PosixDate.create(s,ns).format("%Y:%m:%d %H:%M:%S")? + " [" + s.string() + "," + ns.string() + "]" 
    end 
    stamp.array()

