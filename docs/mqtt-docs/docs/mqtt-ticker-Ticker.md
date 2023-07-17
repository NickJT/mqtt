# Ticker
<span class="source-link">[[Source]](src/mqtt-ticker/ticker.md#L-0-34)</span>

Ticker is used by router to schedule calls to every pulisher and subscriber to 
check message queues for expiry
The timer fires every <period> seconds for a maximum of <repetitions> times. 
If <repetitions> is zero then the timer fires until it is cancelled 


```pony
actor tag Ticker
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-ticker/ticker.md#L-0-45)</span>


```pony
new tag create(
  router: Router tag,
  period: U64 val = 1,
  repetitions: U64 val = 0)
: Ticker tag^
```
#### Parameters

*   router: [Router](mqtt-Router.md) tag
*   period: [U64](builtin-U64.md) val = 1
*   repetitions: [U64](builtin-U64.md) val = 0

#### Returns

* [Ticker](mqtt-ticker-Ticker.md) tag^

---

## Public Behaviours

### cancel
<span class="source-link">[[Source]](src/mqtt-ticker/ticker.md#L-0-54)</span>


```pony
be cancel()
```

---

