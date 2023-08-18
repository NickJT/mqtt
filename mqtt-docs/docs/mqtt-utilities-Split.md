# Split
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-6)</span>

Split the provided U16 into two U8 bytes `


```pony
primitive val Split
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-6)</span>


```pony
new val create()
: Split val^
```

#### Returns

* [Split](mqtt-utilities-Split.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-10)</span>


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
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-10)</span>


```pony
fun box eq(
  that: Split val)
: Bool val
```
#### Parameters

*   that: [Split](mqtt-utilities-Split.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-10)</span>


```pony
fun box ne(
  that: Split val)
: Bool val
```
#### Parameters

*   that: [Split](mqtt-utilities-Split.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

