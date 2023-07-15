# Ping
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-7)</span>

Fire the time <reps> number of times and then cancel. If reps is zero
 then the timer does not cancel itself


```pony
class ref Ping is
  TimerNotify ref
```

#### Implements

* [TimerNotify](time-TimerNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-17)</span>


```pony
new iso create(
  reg: Registrar tag,
  reps: U64 val = 0)
: Ping iso^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   reps: [U64](builtin-U64.md) val = 0

#### Returns

* [Ping](mqtt-pinger-Ping.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-22)</span>


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
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-28)</span>


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

