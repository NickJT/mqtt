# UiTimer
<span class="source-link">[[Source]](src/mqtt-terminal/uitimer.md#L-0-4)</span>

TODO - Not used at present. Instead we're using a manually constructed delegate in
the Terminal actor. 


```pony
class ref UiTimer is
  TimerNotify ref
```

#### Implements

* [TimerNotify](time-TimerNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/uitimer.md#L-0-12)</span>


```pony
new iso create(
  cb: {(I64)} iso)
: UiTimer iso^
```
#### Parameters

*   cb: {(I64)} iso

#### Returns

* [UiTimer](mqtt-terminal-UiTimer.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-terminal/uitimer.md#L-0-15)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/uitimer.md#L-0-21)</span>


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

