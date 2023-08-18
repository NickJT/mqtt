# NoError
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-10)</span>
```pony
primitive val NoError
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-10)</span>


```pony
new val create()
: NoError val^
```

#### Returns

* [NoError](mqtt-primitives-NoError.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-10)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-10)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-10)</span>


```pony
fun box eq(
  that: NoError val)
: Bool val
```
#### Parameters

*   that: [NoError](mqtt-primitives-NoError.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-10)</span>


```pony
fun box ne(
  that: NoError val)
: Bool val
```
#### Parameters

*   that: [NoError](mqtt-primitives-NoError.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

