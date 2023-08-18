# Timestamper
<span class="source-link">[[Source]](src/mqtt-services/timestamper.md#L-0-32)</span>
```pony
actor tag Timestamper is
  MqttService ref
```

#### Implements

* [MqttService](mqtt-mqtt-MqttService.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-services/timestamper.md#L-0-36)</span>


```pony
new tag create(
  topic: String val,
  mqtt: Mqtt tag,
  terminal: Terminal tag)
: Timestamper tag^
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   mqtt: [Mqtt](mqtt-mqtt-Mqtt.md) tag
*   terminal: [Terminal](mqtt-terminal-Terminal.md) tag

#### Returns

* [Timestamper](mqtt-services-Timestamper.md) tag^

---

## Public Behaviours

### onExit
<span class="source-link">[[Source]](src/mqtt-services/timestamper.md#L-0-42)</span>


```pony
be onExit()
```

---

### onResponse
<span class="source-link">[[Source]](src/mqtt-services/timestamper.md#L-0-45)</span>


```pony
be onResponse(
  topic: String val,
  payload: Array[U8 val] val)
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   payload: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### dispose
<span class="source-link">[[Source]](src/mqtt-services/timestamper.md#L-0-48)</span>


```pony
be dispose()
```

---

