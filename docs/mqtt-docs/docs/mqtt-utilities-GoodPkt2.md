# GoodPkt2
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-10)</span>
```pony
primitive val GoodPkt2
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-10)</span>


```pony
new val create()
: GoodPkt2 val^
```

#### Returns

* [GoodPkt2](mqtt-utilities-GoodPkt2.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-10)</span>


Packet 2 QoS: Requested QoS 1 Approved QoS 1


```pony
fun box apply()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-10)</span>


```pony
fun box eq(
  that: GoodPkt2 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt2](mqtt-utilities-GoodPkt2.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-10)</span>


```pony
fun box ne(
  that: GoodPkt2 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt2](mqtt-utilities-GoodPkt2.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

