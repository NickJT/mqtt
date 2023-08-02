# Quit
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-31)</span>
```pony
primitive val Quit
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-31)</span>


```pony
new val create()
: Quit val^
```

#### Returns

* [Quit](mqtt-primitives-Quit.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-31)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-31)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-31)</span>


```pony
fun box eq(
  that: Quit val)
: Bool val
```
#### Parameters

*   that: [Quit](mqtt-primitives-Quit.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-31)</span>


```pony
fun box ne(
  that: Quit val)
: Bool val
```
#### Parameters

*   that: [Quit](mqtt-primitives-Quit.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

