# ValueToRLBytes
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-100)</span>
```pony
primitive val ValueToRLBytes
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-100)</span>


```pony
new val create()
: ValueToRLBytes val^
```

#### Returns

* [ValueToRLBytes](mqtt-utilities-ValueToRLBytes.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-100)</span>


Returns an array of bytes containing the passed length value encoded
as required for the remaining length field in the MQTT fixed header


```pony
fun box apply(
  length: USize val)
: Array[U8 val] val
```
#### Parameters

*   length: [USize](builtin-USize.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-100)</span>


```pony
fun box eq(
  that: ValueToRLBytes val)
: Bool val
```
#### Parameters

*   that: [ValueToRLBytes](mqtt-utilities-ValueToRLBytes.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-100)</span>


```pony
fun box ne(
  that: ValueToRLBytes val)
: Bool val
```
#### Parameters

*   that: [ValueToRLBytes](mqtt-utilities-ValueToRLBytes.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

