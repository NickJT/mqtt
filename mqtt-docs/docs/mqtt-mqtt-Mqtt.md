# Mqtt
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-26)</span>

Provides message access to the MQTT broker identified in config.ini or, if no config.ini can be
found, to localhost:1883.


```pony
actor tag Mqtt
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-41)</span>


```pony
new tag create(
  env: Env val,
  mqttClient: MqttClient tag)
: Mqtt tag^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   mqttClient: [MqttClient](mqtt-mqtt-MqttClient.md) tag

#### Returns

* [Mqtt](mqtt-mqtt-Mqtt.md) tag^

---

## Public Behaviours

### connect
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-65)</span>


cmd: true - Connect to the Broker initialised during instantiation. Takes a callback that is called with 
a status flag when the Broker is ready to accept subscribe and publish messages or when the Broker connection
does not succeed. We connect by calling connect() on the network actor and the router gets a call once we have 
a confirmed TCP connection.
cmd: false - Gracefully disconnect from the Broker so that the last will and testament message is not sent. If
disconnect is not called before the Mqtt actor terminates the Broker will send the LW&T message as
configured in config.ini. Calling .disconnectBroker() on the router causes a disconnect message to be sent to
the Broker before the network is closed.


```pony
be connect(
  cmd: Bool val)
```
#### Parameters

*   cmd: [Bool](builtin-Bool.md) val

---

### publish
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-82)</span>


Publish the payload on the passed topic with the passed QoS. 


```pony
be publish(
  topic: String val,
  qos: String val,
  payload: Array[U8 val] val)
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   qos: [String](builtin-String.md) val
*   payload: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### subscribe
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-89)</span>


Subscribe or unsubscribe to the passed topic, requesting messages be returned with the passed qos. Takes a callback
that is called with topic and payload when a message is received.
If qos is None then the topic is unsubscribed


```pony
be subscribe(
  topic: String val,
  qos: (String val | None val))
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   qos: ([String](builtin-String.md) val | [None](builtin-None.md) val)

---

