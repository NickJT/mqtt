# IsFixedHeader
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-108)</span>
```pony
primitive val IsFixedHeader
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-108)</span>


```pony
new val create()
: IsFixedHeader val^
```

#### Returns

* [IsFixedHeader](mqtt-utilities-IsFixedHeader.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-108)</span>


```pony
fun box apply(
  data: Array[U8 val] val)
: Bool val
```
#### Parameters

*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

#### Returns

* [Bool](builtin-Bool.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-108)</span>


```pony
fun box eq(
  that: IsFixedHeader val)
: Bool val
```
#### Parameters

*   that: [IsFixedHeader](mqtt-utilities-IsFixedHeader.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-108)</span>


```pony
fun box ne(
  that: IsFixedHeader val)
: Bool val
```
#### Parameters

*   that: [IsFixedHeader](mqtt-utilities-IsFixedHeader.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

