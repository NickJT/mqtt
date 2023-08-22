use "bureaucracy"
use "debug"
use "time"

use "package:../mqtt"
use "package:../terminal"
use "package:../utilities"


actor Rtt is MqttService
  let _mqtt : Mqtt tag
  let _terminal : Terminal tag
  let _topic : String val

  new create(topic: String val, mqtt: Mqtt tag, terminal: Terminal tag) =>
    _topic = topic
    _mqtt = mqtt
    _terminal = terminal
    _mqtt.publish(topic, MqTime(), "qos0")

  be onExit() =>
    None  

  be onResponse(topic: String val, payload : Array[U8] val) =>
    _terminal.onStatus(String.from_array(payload))

      