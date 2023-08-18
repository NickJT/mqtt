# MqttService
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-22)</span>
```pony
trait ref MqttService
```

## Public Behaviours

### onResponse
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-23)</span>


```pony
be onResponse(
  topic: String val,
  payload: Array[U8 val] val)
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   payload: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### onExit
<span class="source-link">[[Source]](src/mqtt-mqtt/mqtt.md#L-0-24)</span>


```pony
be onExit()
```

---

