# Tick
<span class="source-link">[[Source]](src/mqtt-ticker/ticker.md#L-0-7)</span>

Fire the timer <reps> number of times and then cancel. If reps is zero
then the timer does not cancel itself


```pony
class ref Tick is
  TimerNotify ref
```

#### Implements

* [TimerNotify](time-TimerNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-ticker/ticker.md#L-0-16)</span>


```pony
new iso create(
  router: Router tag,
  reps: U64 val = 0)
: Tick iso^
```
#### Parameters

*   router: [Router](mqtt-Router.md) tag
*   reps: [U64](builtin-U64.md) val = 0

#### Returns

* [Tick](mqtt-ticker-Tick.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-ticker/ticker.md#L-0-22)</span>


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
<span class="source-link">[[Source]](src/mqtt-ticker/ticker.md#L-0-30)</span>


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

