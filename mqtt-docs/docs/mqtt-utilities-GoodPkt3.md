# GoodPkt3
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-17)</span>
```pony
primitive val GoodPkt3
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-17)</span>


```pony
new val create()
: GoodPkt3 val^
```

#### Returns

* [GoodPkt3](mqtt-utilities-GoodPkt3.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-17)</span>


Publish id 2: $SYS/broker/load/publish/sent/1min = 12.63


```pony
fun box apply()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-17)</span>


```pony
fun box eq(
  that: GoodPkt3 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt3](mqtt-utilities-GoodPkt3.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-17)</span>


```pony
fun box ne(
  that: GoodPkt3 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt3](mqtt-utilities-GoodPkt3.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

