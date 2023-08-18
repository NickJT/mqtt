# ControlDisconnect
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-15)</span>
```pony
primitive val ControlDisconnect
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-15)</span>


```pony
new val create()
: ControlDisconnect val^
```

#### Returns

* [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-15)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-15)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-15)</span>


```pony
fun box eq(
  that: ControlDisconnect val)
: Bool val
```
#### Parameters

*   that: [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-15)</span>


```pony
fun box ne(
  that: ControlDisconnect val)
: Bool val
```
#### Parameters

*   that: [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

