# PublicationMap
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-31)</span>

A map of publications in progress and which publisher owns them. This is needed
because the Ack protocol messages are keyed by id and don't contain topic


```pony
type PublicationMap is
  HashMap[U16 val, Publisher tag, HashEq[U16 val] val] ref
```

#### Type Alias For

* [HashMap](collections-HashMap.md)\[[U16](builtin-U16.md) val, [Publisher](mqtt-publisher-Publisher.md) tag, [HashEq](collections-HashEq.md)\[[U16](builtin-U16.md) val\] val\] ref

---

