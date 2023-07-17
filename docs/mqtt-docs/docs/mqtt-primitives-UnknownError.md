# UnknownError
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-35)</span>
```pony
primitive val UnknownError
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-35)</span>


```pony
new val create()
: UnknownError val^
```

#### Returns

* [UnknownError](mqtt-primitives-UnknownError.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-35)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-35)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-35)</span>


```pony
fun box eq(
  that: UnknownError val)
: Bool val
```
#### Parameters

*   that: [UnknownError](mqtt-primitives-UnknownError.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-35)</span>


```pony
fun box ne(
  that: UnknownError val)
: Bool val
```
#### Parameters

*   that: [UnknownError](mqtt-primitives-UnknownError.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

