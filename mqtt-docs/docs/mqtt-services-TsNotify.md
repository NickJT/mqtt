# TsNotify
<span class="source-link">[[Source]](src/mqtt-services/timestamper.md#L-0-12)</span>
```pony
class ref TsNotify is
  TimerNotify ref
```

#### Implements

* [TimerNotify](time-TimerNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-services/timestamper.md#L-0-18)</span>


```pony
new iso create(
  topic: String val,
  mqtt: Mqtt tag,
  terminal: Terminal tag)
: TsNotify iso^
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   mqtt: [Mqtt](mqtt-mqtt-Mqtt.md) tag
*   terminal: [Terminal](mqtt-terminal-Terminal.md) tag

#### Returns

* [TsNotify](mqtt-services-TsNotify.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-services/timestamper.md#L-0-23)</span>


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
<span class="source-link">[[Source]](src/mqtt-services/timestamper.md#L-0-28)</span>


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

