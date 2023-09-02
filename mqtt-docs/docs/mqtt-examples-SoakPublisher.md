# SoakPublisher
<span class="source-link">[[Source]](src/mqtt-examples/soaktest.md#L-0-12)</span>
```pony
class ref SoakPublisher is
  TimerNotify ref
```

#### Implements

* [TimerNotify](time-TimerNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-examples/soaktest.md#L-0-19)</span>


```pony
new iso create(
  reg: Registrar tag)
: SoakPublisher iso^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag

#### Returns

* [SoakPublisher](mqtt-examples-SoakPublisher.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-examples/soaktest.md#L-0-25)</span>


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
<span class="source-link">[[Source]](src/mqtt-examples/soaktest.md#L-0-31)</span>


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

