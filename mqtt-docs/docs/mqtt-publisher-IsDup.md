# IsDup
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-29)</span>
```pony
primitive val IsDup
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-29)</span>


```pony
new val create()
: IsDup val^
```

#### Returns

* [IsDup](mqtt-publisher-IsDup.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-29)</span>


Returns true if the DUP flag is set in the control byte


```pony
fun box apply(
  value: U8 val)
: Bool val
```
#### Parameters

*   value: [U8](builtin-U8.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-29)</span>


```pony
fun box eq(
  that: IsDup val)
: Bool val
```
#### Parameters

*   that: [IsDup](mqtt-publisher-IsDup.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-29)</span>


```pony
fun box ne(
  that: IsDup val)
: Bool val
```
#### Parameters

*   that: [IsDup](mqtt-publisher-IsDup.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

