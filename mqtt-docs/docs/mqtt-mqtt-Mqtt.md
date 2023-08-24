# Mqtt
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-90)</span>

Provides message access to the MQTT broker identified in config.ini or, if no config.ini can be
found, to localhost:1883.


```pony
actor tag Mqtt
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-104)</span>


```pony
new tag create(
  env: Env val,
  mqttApplication: MqttApplication tag)
: Mqtt tag^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   mqttApplication: [MqttApplication](mqtt-mqtt-MqttApplication.md) tag

#### Returns

* [Mqtt](mqtt-mqtt-Mqtt.md) tag^

---

## Public Behaviours

### connect
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-119)</span>


cmd: true - Connect to the Broker initialised during instantiation. Takes a callback that is called with 
a status flag when the Broker is ready to accept subscribe and publish messages or when the Broker connection
does not succeed. We connect by calling connect() on the network actor and the router gets a call once we have 
a confirmed TCP connection.
cmd: false - Gracefully disconnect from the Broker so that the last will and testament message is not sent. If
disconnect is not called before the Mqtt actor terminates the Broker will send the LW&T message as
configured in config.ini. 

Calling .disconnectBroker() on the router send the disconnect packet and cancels the ping timer. The tcp client
calls router.cleanup() once the network has disconnected so there is no need to call any other router behaviours here.

Router calls onConnection(false) once it has finished its clean-up and we can safely start to exit the app

> DISCONNECT must be the last message sent by the client to the server. The client must close the TCP 
connection after sending DISCONNECT.


```pony
be connect(
  cmd: Bool val)
```
#### Parameters

*   cmd: [Bool](builtin-Bool.md) val

---

### publish
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-147)</span>


This is just a passthrough to the router.


```pony
be publish(
  topic: String val,
  payload: Array[U8 val] val,
  qos: String val = "qos0")
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   payload: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val
*   qos: [String](builtin-String.md) val = "qos0"

---

### subscribe
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-160)</span>


Subscribe or unsubscribe to the passed topic, requesting messages be returned with the passed qos. 
This is just a passthrough to the router.


```pony
be subscribe(
  topic: String val,
  qos: (String val | None val))
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   qos: ([String](builtin-String.md) val | [None](builtin-None.md) val)

---

### onConnection
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-173)</span>


```pony
be onConnection(
  connected: Bool val)
```
#### Parameters

*   connected: [Bool](builtin-Bool.md) val

---

### onSubscribed
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-177)</span>


```pony
be onSubscribed(
  topic: String val,
  qos: (String val | None val))
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   qos: ([String](builtin-String.md) val | [None](builtin-None.md) val)

---

### onMessage
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-180)</span>


```pony
be onMessage(
  topic: String val,
  content: Array[U8 val] val)
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   content: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### onStatus
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-183)</span>


```pony
be onStatus(
  content: String val)
```
#### Parameters

*   content: [String](builtin-String.md) val

---

