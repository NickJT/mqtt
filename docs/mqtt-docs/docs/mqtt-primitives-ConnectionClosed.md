# ConnectionClosed
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-28)</span>
```pony
primitive val ConnectionClosed
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-28)</span>


```pony
new val create()
: ConnectionClosed val^
```

#### Returns

* [ConnectionClosed](mqtt-primitives-ConnectionClosed.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-28)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-28)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-28)</span>


```pony
fun box eq(
  that: ConnectionClosed val)
: Bool val
```
#### Parameters

*   that: [ConnectionClosed](mqtt-primitives-ConnectionClosed.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-28)</span>


```pony
fun box ne(
  that: ConnectionClosed val)
: Bool val
```
#### Parameters

*   that: [ConnectionClosed](mqtt-primitives-ConnectionClosed.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

