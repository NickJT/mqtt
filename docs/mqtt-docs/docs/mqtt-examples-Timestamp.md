# Timestamp
<span class="source-link">[[Source]](src/mqtt-examples/timestamp.md#L-0-9)</span>
```pony
class ref Timestamp is
  TimerNotify ref
```

#### Implements

* [TimerNotify](time-TimerNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-examples/timestamp.md#L-0-15)</span>


```pony
new iso create(
  reg: Registrar tag,
  pub: Publisher tag,
  topic: String val)
: Timestamp iso^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   pub: [Publisher](mqtt-publisher-Publisher.md) tag
*   topic: [String](builtin-String.md) val

#### Returns

* [Timestamp](mqtt-examples-Timestamp.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-examples/timestamp.md#L-0-20)</span>


```pony
fun ref apply(
  timer: Timer ref,
  count: U64 val)
: Bool val
```
#### Parameters

*   timer: [Timer](time-Timer.md) ref
*   count: [U64](builtin-U64.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### cancel
<span class="source-link">[[Source]](src/mqtt-examples/timestamp.md#L-0-42)</span>


```pony
fun ref cancel(
  timer: Timer ref)
: None val
```
#### Parameters

*   timer: [Timer](time-Timer.md) ref

#### Returns

* [None](builtin-None.md) val

---

