# Rtt
<span class="source-link">[[Source]](src/mqtt-services/rtt.md#L-0-10)</span>

A simple service to measure the round-trip time with the configured broker.
On creation we publish a message on the given topic and then wait for a response
to be returned via the onResponse behaviour.


```pony
actor tag Rtt is
  MqttService ref
```

#### Implements

* [MqttService](mqtt-mqtt-MqttService.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-services/rtt.md#L-0-23)</span>


```pony
new tag create(
  topic: String val,
  mqtt: Mqtt tag,
  terminal: Terminal tag)
: Rtt tag^
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   mqtt: [Mqtt](mqtt-mqtt-Mqtt.md) tag
*   terminal: [Terminal](mqtt-terminal-Terminal.md) tag

#### Returns

* [Rtt](mqtt-services-Rtt.md) tag^

---

## Public Behaviours

### onExit
<span class="source-link">[[Source]](src/mqtt-services/rtt.md#L-0-29)</span>


```pony
be onExit()
```

---

### onResponse
<span class="source-link">[[Source]](src/mqtt-services/rtt.md#L-0-33)</span>


```pony
be onResponse(
  topic: String val,
  payload: Array[U8 val] val)
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   payload: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

## Public Functions

### doPublish
<span class="source-link">[[Source]](src/mqtt-services/rtt.md#L-0-45)</span>


```pony
fun ref doPublish()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### doCalc
<span class="source-link">[[Source]](src/mqtt-services/rtt.md#L-0-50)</span>


```pony
fun ref doCalc()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### asArray
<span class="source-link">[[Source]](src/mqtt-services/rtt.md#L-0-62)</span>


```pony
fun ref asArray(
  i: U32 val)
: Array[U8 val] val
```
#### Parameters

*   i: [U32](builtin-U32.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

