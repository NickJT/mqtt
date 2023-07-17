# BytesToValue
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-131)</span>
```pony
primitive val BytesToValue
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-131)</span>


```pony
new val create()
: BytesToValue val^
```

#### Returns

* [BytesToValue](mqtt-utilities-BytesToValue.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-131)</span>


Takes the leading bytes of an MQTT packet and returns the remaining length encoded
in bytes 1 to n, where 0 < n < 4. If n > 4, zero is returned as the packet cannot 
meet the MQTT protocol standard.
Note - This function takes the leading bytes including the control byte (Byte 0) that
is not used in the BytesToValue calculation (hence index is defined as 1 below).


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
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-131)</span>


```pony
fun box eq(
  that: BytesToValue val)
: Bool val
```
#### Parameters

*   that: [BytesToValue](mqtt-utilities-BytesToValue.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-131)</span>


```pony
fun box ne(
  that: BytesToValue val)
: Bool val
```
#### Parameters

*   that: [BytesToValue](mqtt-utilities-BytesToValue.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

