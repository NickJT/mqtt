# U16ToBytes
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-17)</span>

Convert a U16 into two U8 bytes where the first byte is the msb of the original U16. 
Just a pass-through for Split at present.
TODO - Endian for different platforms?


```pony
primitive val U16ToBytes
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-17)</span>


```pony
new val create()
: U16ToBytes val^
```

#### Returns

* [U16ToBytes](mqtt-utilities-U16ToBytes.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-23)</span>


```pony
fun box apply(
  value: U16 val)
: (U8 val , U8 val)
```
#### Parameters

*   value: [U16](builtin-U16.md) val

#### Returns

* ([U8](builtin-U8.md) val , [U8](builtin-U8.md) val)

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-23)</span>


```pony
fun box eq(
  that: U16ToBytes val)
: Bool val
```
#### Parameters

*   that: [U16ToBytes](mqtt-utilities-U16ToBytes.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-23)</span>


```pony
fun box ne(
  that: U16ToBytes val)
: Bool val
```
#### Parameters

*   that: [U16ToBytes](mqtt-utilities-U16ToBytes.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

