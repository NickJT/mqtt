# Main
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-4)</span>

Minimal example of an application to connect, subscribe, publish and disconnect. An application or actor
must implement the following trait (defined in the mqtt package):

```
trait MqttApplication
be onConnection(connected : Bool)
be onSubscribed(topic: String val, qos: (String val | None))
be onMessage(topic: String val, content: Array[U8] val)
be onStatus(content: String val)
```



```pony
actor tag Main is
  MqttApplication ref
```

#### Implements

* [MqttApplication](mqtt-mqtt-MqttApplication.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-26)</span>


```pony
new tag create(
  env: Env val)
: Main tag^
```
#### Parameters

*   env: [Env](builtin-Env.md) val

#### Returns

* [Main](mqtt-Main.md) tag^

---

## Public Behaviours

### onConnection
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-32)</span>


```pony
be onConnection(
  connected: Bool val)
```
#### Parameters

*   connected: [Bool](builtin-Bool.md) val

---

### onSubscribed
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-36)</span>


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
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-41)</span>


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
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-55)</span>


```pony
be onStatus(
  content: String val)
```
#### Parameters

*   content: [String](builtin-String.md) val

---

## Public Functions

### dateStamp
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-59)</span>


An aribtrary function to generate some changing data to publish. Not part of the 
Mqtt trait


```pony
fun box dateStamp()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### runtime_override_defaults
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-4)</span>


```pony
fun runtime_override_defaults(
  rto: RuntimeOptions ref)
: None val
```
#### Parameters

*   rto: [RuntimeOptions](builtin-RuntimeOptions.md) ref

#### Returns

* [None](builtin-None.md) val

---

