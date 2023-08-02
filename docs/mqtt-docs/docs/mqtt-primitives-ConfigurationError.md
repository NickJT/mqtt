# ConfigurationError
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-36)</span>
```pony
primitive val ConfigurationError
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-36)</span>


```pony
new val create()
: ConfigurationError val^
```

#### Returns

* [ConfigurationError](mqtt-primitives-ConfigurationError.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-36)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-36)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-36)</span>


```pony
fun box eq(
  that: ConfigurationError val)
: Bool val
```
#### Parameters

*   that: [ConfigurationError](mqtt-primitives-ConfigurationError.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-36)</span>


```pony
fun box ne(
  that: ConfigurationError val)
: Bool val
```
#### Parameters

*   that: [ConfigurationError](mqtt-primitives-ConfigurationError.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

