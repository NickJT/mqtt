# Main
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-39)</span>

Main is responsible for reading the config.ini file identified in the ConfigFile primitive
and passing the Client into the TCPConnection
Once the client is established and the Broker is connected, main subscribes to the topics
in the .ini file 


```pony
actor tag Main
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-64)</span>


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

### onExit
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-100)</span>


Called by Client when the TCP connection is closed or if the network connection request fails 


```pony
be onExit(
  diagnostic: String val)
```
#### Parameters

*   diagnostic: [String](builtin-String.md) val

---

### onTick
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-107)</span>


```pony
be onTick(
  sec: I64 val)
```
#### Parameters

*   sec: [I64](builtin-I64.md) val

---

### onMessage
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-113)</span>


This is the primary route into main for messages received over MQTT. It is called
by the router for subscription receipts.


```pony
be onMessage(
  topic: String val,
  content: String val)
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   content: [String](builtin-String.md) val

---

### onBrokerConnect
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-130)</span>


Called once when the router has confirmed that we have a valid connection to the
broker. This is the location for any app setup such as starting publication actors
or subscribing to topics.
TODO - Add local collection of subscribers so we can call unsubscriber on them later


```pony
be onBrokerConnect(
  message: String val)
```
#### Parameters

*   message: [String](builtin-String.md) val

---

## Public Functions

### refreshTopics
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-180)</span>


```pony
fun ref refreshTopics()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### refresh
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-194)</span>


```pony
fun ref refresh()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### showMsg
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-209)</span>


```pony
fun box showMsg(
  topic: String val,
  content: String val = "")
: None val
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   content: [String](builtin-String.md) val = ""

#### Returns

* [None](builtin-None.md) val

---

### toIPv4
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-218)</span>


This doesn't fit comfortably anywhere yet so we'll leave it in main for now
TODO - Decide where network utilities should go


```pony
fun box toIPv4(
  env: Env val,
  arg: String val)
: (String val | None val)
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   arg: [String](builtin-String.md) val

#### Returns

* ([String](builtin-String.md) val | [None](builtin-None.md) val)

---

### runtime_override_defaults
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-39)</span>


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

## Private Functions

### _initialise
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-147)</span>


```pony
fun ref _initialise(
  env: Env val,
  reg: Registrar tag)
: Bool val
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   reg: [Registrar](bureaucracy-Registrar.md) tag

#### Returns

* [Bool](builtin-Bool.md) val

---

