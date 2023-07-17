# IdMap
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-18)</span>

A map of subscribers keyed by the id of the message they are processing. We need 
this because ack messages don't contain topic


```pony
type IdMap is
  HashMap[U16 val, Subscriber tag, HashEq[U16 val] val] ref
```

#### Type Alias For

* [HashMap](collections-HashMap.md)\[[U16](builtin-U16.md) val, [Subscriber](mqtt-subscriber-Subscriber.md) tag, [HashEq](collections-HashEq.md)\[[U16](builtin-U16.md) val\] val\] ref

---

