# TickListener
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-85)</span>

A trait held by actors who receive the system tick


```pony
trait ref TickListener
```

## Public Functions

### onTick
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-89)</span>


```pony
fun box onTick(
  secs: I64 val)
: None val
```
#### Parameters

*   secs: [I64](builtin-I64.md) val

#### Returns

* [None](builtin-None.md) val

---

