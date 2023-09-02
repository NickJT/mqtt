# TsNotify
<span class="source-link">[[Source]](src/mqtt-examples/timestamper.md#L-0-10)</span>
```pony
class ref TsNotify is
  TimerNotify ref
```

#### Implements

* [TimerNotify](time-TimerNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-examples/timestamper.md#L-0-16)</span>


```pony
new iso create(
  reg: Registrar tag,
  pub: Publisher tag,
  topic: String val)
: TsNotify iso^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   pub: [Publisher](mqtt-publisher-Publisher.md) tag
*   topic: [String](builtin-String.md) val

#### Returns

* [TsNotify](mqtt-examples-TsNotify.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-examples/timestamper.md#L-0-21)</span>


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
<span class="source-link">[[Source]](src/mqtt-examples/timestamper.md#L-0-26)</span>


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

