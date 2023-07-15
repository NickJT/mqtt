# Main
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-37)</span>

Main is responsible for reading the config.ini file identified in the ConfigFile primitive
and passing the Client into the TCPConnection
Once the client is established and the Broker is connected, main subscribes to the topics
in the .ini file 

Registrar usage  
- Main adds itself to reg so its onDisconnect behaviour can be called when the client disconnects 



```pony
actor tag Main
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-51)</span>


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
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-57)</span>


```pony
be onExit(
  diagnostic: String val)
```
#### Parameters

*   diagnostic: [String](builtin-String.md) val

---

### onMessage
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-61)</span>


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
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-65)</span>


Called once router has confirmed that we have a valid connection to the broker


```pony
be onBrokerConnect(
  message: String val)
```
#### Parameters

*   message: [String](builtin-String.md) val

---

## Public Functions

### toIPv4
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-114)</span>


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
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-37)</span>


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
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-80)</span>


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

