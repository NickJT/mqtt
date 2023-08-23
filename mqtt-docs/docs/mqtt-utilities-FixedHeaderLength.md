# FixedHeaderLength
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-136)</span>
```pony
primitive val FixedHeaderLength
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-136)</span>


```pony
new val create()
: FixedHeaderLength val^
```

#### Returns

* [FixedHeaderLength](mqtt-utilities-FixedHeaderLength.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-136)</span>


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
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-136)</span>


```pony
fun box eq(
  that: FixedHeaderLength val)
: Bool val
```
#### Parameters

*   that: [FixedHeaderLength](mqtt-utilities-FixedHeaderLength.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-136)</span>


```pony
fun box ne(
  that: FixedHeaderLength val)
: Bool val
```
#### Parameters

*   that: [FixedHeaderLength](mqtt-utilities-FixedHeaderLength.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

