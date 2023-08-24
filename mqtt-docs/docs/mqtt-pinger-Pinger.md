# Pinger
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-35)</span>

Keep alive pinger. Starts a timer that calls .doPing() on the router tag
stored in _reg.  


```pony
actor tag Pinger
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-44)</span>


```pony
new tag create(
  router: Router tag,
  period: U64 val,
  repetitions: U64 val = 0)
: Pinger tag^
```
#### Parameters

*   router: [Router](mqtt-router-Router.md) tag
*   period: [U64](builtin-U64.md) val
*   repetitions: [U64](builtin-U64.md) val = 0

#### Returns

* [Pinger](mqtt-pinger-Pinger.md) tag^

---

## Public Behaviours

### cancel
<span class="source-link">[[Source]](src/mqtt-pinger/pinger.md#L-0-52)</span>


```pony
be cancel()
```

---

