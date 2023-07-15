# SocketError
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-27)</span>
```pony
primitive val SocketError
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-27)</span>


```pony
new val create()
: SocketError val^
```

#### Returns

* [SocketError](mqtt-primitives-SocketError.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-27)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-27)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-27)</span>


```pony
fun box eq(
  that: SocketError val)
: Bool val
```
#### Parameters

*   that: [SocketError](mqtt-primitives-SocketError.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-27)</span>


```pony
fun box ne(
  that: SocketError val)
: Bool val
```
#### Parameters

*   that: [SocketError](mqtt-primitives-SocketError.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

