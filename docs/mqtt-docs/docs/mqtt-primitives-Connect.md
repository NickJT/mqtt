# Connect
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-22)</span>
```pony
primitive val Connect
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-22)</span>


```pony
new val create()
: Connect val^
```

#### Returns

* [Connect](mqtt-primitives-Connect.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-22)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-22)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-22)</span>


```pony
fun box eq(
  that: Connect val)
: Bool val
```
#### Parameters

*   that: [Connect](mqtt-primitives-Connect.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-22)</span>


```pony
fun box ne(
  that: Connect val)
: Bool val
```
#### Parameters

*   that: [Connect](mqtt-primitives-Connect.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

