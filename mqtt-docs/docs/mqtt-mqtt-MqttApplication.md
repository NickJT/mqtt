# MqttApplication
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-80)</span>
```pony
trait ref MqttApplication
```

## Public Behaviours

### onConnection
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-81)</span>


```pony
be onConnection(
  connected: Bool val)
```
#### Parameters

*   connected: [Bool](builtin-Bool.md) val

---

### onSubscribed
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-82)</span>


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
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-83)</span>


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
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-84)</span>


```pony
be onStatus(
  content: String val)
```
#### Parameters

*   content: [String](builtin-String.md) val

---

