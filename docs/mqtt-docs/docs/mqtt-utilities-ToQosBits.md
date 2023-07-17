# ToQosBits
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-80)</span>
```pony
primitive val ToQosBits
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-80)</span>


```pony
new val create()
: ToQosBits val^
```

#### Returns

* [ToQosBits](mqtt-utilities-ToQosBits.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-80)</span>


Takes a string and matches it against the qos patterns. Anything that
doesn't match returns QOS0 ( = 0)


```pony
fun box apply(
  stg: String val)
: U8 val
```
#### Parameters

*   stg: [String](builtin-String.md) val

#### Returns

* [U8](builtin-U8.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-80)</span>


```pony
fun box eq(
  that: ToQosBits val)
: Bool val
```
#### Parameters

*   that: [ToQosBits](mqtt-utilities-ToQosBits.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-80)</span>


```pony
fun box ne(
  that: ToQosBits val)
: Bool val
```
#### Parameters

*   that: [ToQosBits](mqtt-utilities-ToQosBits.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

