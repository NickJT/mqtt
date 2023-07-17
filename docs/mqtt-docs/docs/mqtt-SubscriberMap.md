# SubscriberMap
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-25)</span>

A map of subscribers keyed by the topic to which they are subscribed


```pony
type SubscriberMap is
  HashMap[String val, Subscriber tag, HashEq[String val] val] ref
```

#### Type Alias For

* [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [Subscriber](mqtt-subscriber-Subscriber.md) tag, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] ref

---

