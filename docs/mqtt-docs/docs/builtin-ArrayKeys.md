# ArrayKeys\[A: A, B: [Array](builtin-Array.md)\[A\] #read\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-942)</span>
```pony
class ref ArrayKeys[A: A, B: Array[A] #read] is
  Iterator[USize val] ref
```

#### Implements

* [Iterator](builtin-Iterator.md)\[[USize](builtin-USize.md) val\] ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/array.md#L-0-946)</span>


```pony
new ref create(
  array: B)
: ArrayKeys[A, B] ref^
```
#### Parameters

*   array: B

#### Returns

* [ArrayKeys](builtin-ArrayKeys.md)\[A, B\] ref^

---

## Public Functions

### has_next
<span class="source-link">[[Source]](src/builtin/array.md#L-0-950)</span>


```pony
fun box has_next()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### next
<span class="source-link">[[Source]](src/builtin/array.md#L-0-953)</span>


```pony
fun ref next()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

