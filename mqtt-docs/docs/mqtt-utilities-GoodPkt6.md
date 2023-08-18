# GoodPkt6
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-43)</span>
```pony
primitive val GoodPkt6
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-43)</span>


```pony
new val create()
: GoodPkt6 val^
```

#### Returns

* [GoodPkt6](mqtt-utilities-GoodPkt6.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-43)</span>


Publish id 4: $SYS/broker/load/publish/dropped/1min = 0.00


```pony
fun box apply()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-43)</span>


```pony
fun box eq(
  that: GoodPkt6 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt6](mqtt-utilities-GoodPkt6.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-43)</span>


```pony
fun box ne(
  that: GoodPkt6 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt6](mqtt-utilities-GoodPkt6.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

