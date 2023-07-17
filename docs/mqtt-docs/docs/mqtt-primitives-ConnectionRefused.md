# ConnectionRefused
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-32)</span>
```pony
primitive val ConnectionRefused
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-32)</span>


```pony
new val create()
: ConnectionRefused val^
```

#### Returns

* [ConnectionRefused](mqtt-primitives-ConnectionRefused.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-32)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-32)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-32)</span>


```pony
fun box eq(
  that: ConnectionRefused val)
: Bool val
```
#### Parameters

*   that: [ConnectionRefused](mqtt-primitives-ConnectionRefused.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-32)</span>


```pony
fun box ne(
  that: ConnectionRefused val)
: Bool val
```
#### Parameters

*   that: [ConnectionRefused](mqtt-primitives-ConnectionRefused.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

