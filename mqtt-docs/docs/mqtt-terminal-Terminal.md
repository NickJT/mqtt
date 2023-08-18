# Terminal
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-10)</span>
```pony
actor tag Terminal is
  MqttClient ref
```

#### Implements

* [MqttClient](mqtt-mqtt-MqttClient.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-18)</span>


```pony
new tag create(
  env: Env val,
  exitMain: {(U8)} iso)
: Terminal tag^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   exitMain: {(U8)} iso

#### Returns

* [Terminal](mqtt-terminal-Terminal.md) tag^

---

## Public Behaviours

### connect
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-37)</span>


```pony
be connect()
```

---

### disconnect
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-40)</span>


```pony
be disconnect()
```

---

### startService
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-43)</span>


```pony
be startService(
  code: U8 val)
```
#### Parameters

*   code: [U8](builtin-U8.md) val

---

### stopService
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-46)</span>


```pony
be stopService(
  code: U8 val)
```
#### Parameters

*   code: [U8](builtin-U8.md) val

---

### clear
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-49)</span>


```pony
be clear()
```

---

### onConnection
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-52)</span>


```pony
be onConnection(
  connected: Bool val)
```
#### Parameters

*   connected: [Bool](builtin-Bool.md) val

---

### onSubscribed
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-55)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-61)</span>


```pony
be onMessage(
  topic: String val,
  content: String val)
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   content: [String](builtin-String.md) val

---

### onStatus
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-68)</span>


```pony
be onStatus(
  content: String val)
```
#### Parameters

*   content: [String](builtin-String.md) val

---

### onExit
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-71)</span>


```pony
be onExit(
  code: U8 val)
```
#### Parameters

*   code: [U8](builtin-U8.md) val

---

