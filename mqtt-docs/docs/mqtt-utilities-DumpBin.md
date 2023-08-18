# DumpBin
<span class="source-link">[[Source]](src/mqtt-utilities/formaters.md#L-0-20)</span>
```pony
primitive val DumpBin
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/formaters.md#L-0-20)</span>


```pony
new val create()
: DumpBin val^
```

#### Returns

* [DumpBin](mqtt-utilities-DumpBin.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/formaters.md#L-0-20)</span>


```pony
fun box apply(
  name: String val,
  data: Array[U8 val] val)
: None val
```
#### Parameters

*   name: [String](builtin-String.md) val
*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

#### Returns

* [None](builtin-None.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/formaters.md#L-0-20)</span>


```pony
fun box eq(
  that: DumpBin val)
: Bool val
```
#### Parameters

*   that: [DumpBin](mqtt-utilities-DumpBin.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/formaters.md#L-0-20)</span>


```pony
fun box ne(
  that: DumpBin val)
: Bool val
```
#### Parameters

*   that: [DumpBin](mqtt-utilities-DumpBin.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

