# RlByteCount
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-155)</span>
```pony
primitive val RlByteCount
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-155)</span>


```pony
new val create()
: RlByteCount val^
```

#### Returns

* [RlByteCount](mqtt-utilities-RlByteCount.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-155)</span>


Returns the number of bytes in the remaining length field of the fixed header  


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
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-155)</span>


```pony
fun box eq(
  that: RlByteCount val)
: Bool val
```
#### Parameters

*   that: [RlByteCount](mqtt-utilities-RlByteCount.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-155)</span>


```pony
fun box ne(
  that: RlByteCount val)
: Bool val
```
#### Parameters

*   that: [RlByteCount](mqtt-utilities-RlByteCount.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

