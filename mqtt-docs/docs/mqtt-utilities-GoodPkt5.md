# GoodPkt5
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-31)</span>
```pony
primitive val GoodPkt5
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-31)</span>


```pony
new val create()
: GoodPkt5 val^
```

#### Returns

* [GoodPkt5](mqtt-utilities-GoodPkt5.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-31)</span>


Publish id 3: $SYS/broker/load/bytes/received/1min = 502.63 
controlbyte = 51
fixed header length = 2
fixed header = 51 ; 46
variable header = 0;36 then 36 chars 
remaining length = 46


```pony
fun box apply()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-31)</span>


```pony
fun box eq(
  that: GoodPkt5 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt5](mqtt-utilities-GoodPkt5.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/testPackets.md#L-0-31)</span>


```pony
fun box ne(
  that: GoodPkt5 val)
: Bool val
```
#### Parameters

*   that: [GoodPkt5](mqtt-utilities-GoodPkt5.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

