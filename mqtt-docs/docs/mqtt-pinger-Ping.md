# Ping
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-8)</span>

Simple timerNotify class to provide a keepalive ping 


```pony
class ref Ping is
  TimerNotify ref
```

#### Implements

* [TimerNotify](time-TimerNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-16)</span>


```pony
new iso create(
  router: Router tag)
: Ping iso^
```
#### Parameters

*   router: [Router](mqtt-router-Router.md) tag

#### Returns

* [Ping](mqtt-pinger-Ping.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-20)</span>


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
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-24)</span>


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

