# Terminal
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-11)</span>
```pony
actor tag Terminal is
  MqttApplication ref
```

#### Implements

* [MqttApplication](mqtt-mqtt-MqttApplication.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-19)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-38)</span>


Tells the MQTT actor to connect to the Broker


```pony
be connect()
```

---

### disconnect
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-44)</span>


Tells the MQTT actor to send a disconnect message to the Broker and then release
the network connection


```pony
be disconnect()
```

---

### startService
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-51)</span>


```pony
be startService(
  code: U8 val)
```
#### Parameters

*   code: [U8](builtin-U8.md) val

---

### stopService
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-55)</span>


```pony
be stopService(
  code: U8 val)
```
#### Parameters

*   code: [U8](builtin-U8.md) val

---

### clear
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-59)</span>


Tells the display actor to clear the message section of the screen


```pony
be clear()
```

---

### onExit
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-65)</span>


Called by the terminal actor in response to a user request to exit. Releases the
keyboard handler, calls _onExit on the display actor and then calls the callback
provided by Main.  
TODO - We don't call disconnect here yet (so we can test the LW&T) but change this once
everything is working


```pony
be onExit(
  code: U8 val)
```
#### Parameters

*   code: [U8](builtin-U8.md) val

---

### onConnection
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-78)</span>


Called by the MQTT actor when the Broker is connected


```pony
be onConnection(
  connected: Bool val)
```
#### Parameters

*   connected: [Bool](builtin-Bool.md) val

---

### onSubscribed
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-84)</span>


Called by the MQTT actor with the result of a subscription request


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
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-96)</span>


Called by the MQTT actor when it has recieved a message on a subscribed channel or 
an allocated channel


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
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-104)</span>


Called by the MQTT actor when it has recieved a status message


```pony
be onStatus(
  content: String val)
```
#### Parameters

*   content: [String](builtin-String.md) val

---

