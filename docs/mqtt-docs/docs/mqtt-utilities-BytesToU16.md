# BytesToU16
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-27)</span>

Converts an Array of two U8 bytes into a U16 packtId. Note that the spec defines
a valid Id to be non-zero, so we can use zero as an error case


```pony
primitive val BytesToU16
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-27)</span>


```pony
new val create()
: BytesToU16 val^
```

#### Returns

* [BytesToU16](mqtt-utilities-BytesToU16.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-32)</span>


```pony
fun box apply(
  bytes: Array[U8 val] val)
: U16 val
```
#### Parameters

*   bytes: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

#### Returns

* [U16](builtin-U16.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-32)</span>


```pony
fun box eq(
  that: BytesToU16 val)
: Bool val
```
#### Parameters

*   that: [BytesToU16](mqtt-utilities-BytesToU16.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-32)</span>


```pony
fun box ne(
  that: BytesToU16 val)
: Bool val
```
#### Parameters

*   that: [BytesToU16](mqtt-utilities-BytesToU16.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

