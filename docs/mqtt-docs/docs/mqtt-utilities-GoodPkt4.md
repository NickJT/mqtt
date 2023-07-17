# GoodPkt4
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-24)</span>
```pony
primitive val GoodPkt4
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-24)</span>


```pony
new val create()
: GoodPkt4 val^
```

#### Returns

* [GoodPkt4](mqtt-utilities-GoodPkt4.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-24)</span>


Packet 3 QoS: Requested QoS 1 Approved QoS 1


```pony
fun box apply()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-24)</span>


```pony
fun box eq(
  that: GoodPkt4 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt4](mqtt-utilities-GoodPkt4.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-24)</span>


```pony
fun box ne(
  that: GoodPkt4 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt4](mqtt-utilities-GoodPkt4.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

