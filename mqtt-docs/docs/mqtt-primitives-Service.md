# Service
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-26)</span>
```pony
primitive val Service
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-26)</span>


```pony
new val create()
: Service val^
```

#### Returns

* [Service](mqtt-primitives-Service.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-26)</span>


```pony
fun box apply()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-26)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-26)</span>


```pony
fun box eq(
  that: Service val)
: Bool val
```
#### Parameters

*   that: [Service](mqtt-primitives-Service.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/commands.md#L-0-26)</span>


```pony
fun box ne(
  that: Service val)
: Bool val
```
#### Parameters

*   that: [Service](mqtt-primitives-Service.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

