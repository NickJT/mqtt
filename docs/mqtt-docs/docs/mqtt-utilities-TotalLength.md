# TotalLength
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-111)</span>
```pony
primitive val TotalLength
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-111)</span>


```pony
new val create()
: TotalLength val^
```

#### Returns

* [TotalLength](mqtt-utilities-TotalLength.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-111)</span>


Convenience function that calculates the total length of a packet by summing:
1.  The fixed header length
2.  The value of the remaining length field
TODO - Optimise so we don't scan twice


```pony
fun box apply(
  data: Array[U8 val] box)
: USize val
```
#### Parameters

*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] box

#### Returns

* [USize](builtin-USize.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-111)</span>


```pony
fun box eq(
  that: TotalLength val)
: Bool val
```
#### Parameters

*   that: [TotalLength](mqtt-utilities-TotalLength.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-111)</span>


```pony
fun box ne(
  that: TotalLength val)
: Bool val
```
#### Parameters

*   that: [TotalLength](mqtt-utilities-TotalLength.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

