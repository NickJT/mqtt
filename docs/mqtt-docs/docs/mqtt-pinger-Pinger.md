# Pinger
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-32)</span>

Keep alive pinger. Starts a timer that calls .doPing() on the router tag
stored in _reg.  
The timer fires every <period> seconds for a maximum of <repetitions> times. 
If <repetitions> is zero then the timer fires until it is cancelled 


```pony
actor tag Pinger
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-43)</span>


```pony
new tag create(
  reg: Registrar tag,
  period: U64 val,
  repetitions: U64 val)
: Pinger tag^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   period: [U64](builtin-U64.md) val
*   repetitions: [U64](builtin-U64.md) val

#### Returns

* [Pinger](mqtt-pinger-Pinger.md) tag^

---

## Public Behaviours

### cancel
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-51)</span>


```pony
be cancel()
```

---

