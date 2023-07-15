# GoodPkt1
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-3)</span>
```pony
primitive val GoodPkt1
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-3)</span>


```pony
new val create()
: GoodPkt1 val^
```

#### Returns

* [GoodPkt1](mqtt-utilities-GoodPkt1.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-3)</span>


Publish id 1: $SYS/broker/subscriptions/count = 0 


```pony
fun box apply()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-3)</span>


```pony
fun box eq(
  that: GoodPkt1 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt1](mqtt-utilities-GoodPkt1.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-3)</span>


```pony
fun box ne(
  that: GoodPkt1 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt1](mqtt-utilities-GoodPkt1.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

