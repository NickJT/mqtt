# StringRunes
<span class="source-link">[[Source]](src/builtin/string.md#L-0-1699)</span>
```pony
class ref StringRunes is
  Iterator[U32 val] ref
```

#### Implements

* [Iterator](builtin-Iterator.md)\[[U32](builtin-U32.md) val\] ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/string.md#L-0-1703)</span>


```pony
new ref create(
  string: String box)
: StringRunes ref^
```
#### Parameters

*   string: [String](builtin-String.md) box

#### Returns

* [StringRunes](builtin-StringRunes.md) ref^

---

## Public Functions

### has_next
<span class="source-link">[[Source]](src/builtin/string.md#L-0-1707)</span>


```pony
fun box has_next()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### next
<span class="source-link">[[Source]](src/builtin/string.md#L-0-1710)</span>


```pony
fun ref next()
: U32 val ?
```

#### Returns

* [U32](builtin-U32.md) val ?

---

