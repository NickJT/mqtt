# IsRetain
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-36)</span>
```pony
primitive val IsRetain
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-36)</span>


```pony
new val create()
: IsRetain val^
```

#### Returns

* [IsRetain](mqtt-publisher-IsRetain.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-36)</span>


Returns true if the retain flag is set in the control bytes


```pony
fun box apply(
  value: U8 val)
: Bool val
```
#### Parameters

*   value: [U8](builtin-U8.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-36)</span>


```pony
fun box eq(
  that: IsRetain val)
: Bool val
```
#### Parameters

*   that: [IsRetain](mqtt-publisher-IsRetain.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-36)</span>


```pony
fun box ne(
  that: IsRetain val)
: Bool val
```
#### Parameters

*   that: [IsRetain](mqtt-publisher-IsRetain.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

