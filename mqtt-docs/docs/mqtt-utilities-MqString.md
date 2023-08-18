# MqString
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-43)</span>

Converts a standard string into a sequence of bytes representing the format used for 
strings in the MQTT spec. This has a two byte length field followed by the bytes of 
the charaacters. The MQTT version of an empty string is two bytes of zeros


```pony
primitive val MqString
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-43)</span>


```pony
new val create()
: MqString val^
```

#### Returns

* [MqString](mqtt-utilities-MqString.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-49)</span>


```pony
fun box apply(
  stg: String val)
: Array[U8 val] val
```
#### Parameters

*   stg: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-49)</span>


```pony
fun box eq(
  that: MqString val)
: Bool val
```
#### Parameters

*   that: [MqString](mqtt-utilities-MqString.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-49)</span>


```pony
fun box ne(
  that: MqString val)
: Bool val
```
#### Parameters

*   that: [MqString](mqtt-utilities-MqString.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

