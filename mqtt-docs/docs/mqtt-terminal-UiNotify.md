# UiNotify
<span class="source-link">[[Source]](src/mqtt-terminal/uistamper.md#L-0-3)</span>
```pony
class ref UiNotify is
  TimerNotify ref
```

#### Implements

* [TimerNotify](time-TimerNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/uistamper.md#L-0-7)</span>


```pony
new iso create(
  term: Display tag)
: UiNotify iso^
```
#### Parameters

*   term: [Display](mqtt-terminal-Display.md) tag

#### Returns

* [UiNotify](mqtt-terminal-UiNotify.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-terminal/uistamper.md#L-0-10)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/uistamper.md#L-0-16)</span>


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

