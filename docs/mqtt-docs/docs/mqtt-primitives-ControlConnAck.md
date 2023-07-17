# ControlConnAck
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-3)</span>
```pony
primitive val ControlConnAck
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-3)</span>


```pony
new val create()
: ControlConnAck val^
```

#### Returns

* [ControlConnAck](mqtt-primitives-ControlConnAck.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-3)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-3)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-3)</span>


```pony
fun box eq(
  that: ControlConnAck val)
: Bool val
```
#### Parameters

*   that: [ControlConnAck](mqtt-primitives-ControlConnAck.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/controlBytes.md#L-0-3)</span>


```pony
fun box ne(
  that: ControlConnAck val)
: Bool val
```
#### Parameters

*   that: [ControlConnAck](mqtt-primitives-ControlConnAck.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

