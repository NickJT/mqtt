# StringBytes
<span class="source-link">[[Source]](src/builtin/string.md#L-0-1685)</span>
```pony
class ref StringBytes is
  Iterator[U8 val] ref
```

#### Implements

* [Iterator](builtin-Iterator.md)\[[U8](builtin-U8.md) val\] ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/string.md#L-0-1689)</span>


```pony
new ref create(
  string: String box)
: StringBytes ref^
```
#### Parameters

*   string: [String](builtin-String.md) box

#### Returns

* [StringBytes](builtin-StringBytes.md) ref^

---

## Public Functions

### has_next
<span class="source-link">[[Source]](src/builtin/string.md#L-0-1693)</span>


```pony
fun box has_next()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### next
<span class="source-link">[[Source]](src/builtin/string.md#L-0-1696)</span>


```pony
fun ref next()
: U8 val ?
```

#### Returns

* [U8](builtin-U8.md) val ?

---

