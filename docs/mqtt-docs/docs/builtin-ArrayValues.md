# ArrayValues\[A: A, B: [Array](builtin-Array.md)\[A\] #read\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-960)</span>
```pony
class ref ArrayValues[A: A, B: Array[A] #read] is
  Iterator[B->A] ref
```

#### Implements

* [Iterator](builtin-Iterator.md)\[B->A\] ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/array.md#L-0-964)</span>


```pony
new ref create(
  array: B)
: ArrayValues[A, B] ref^
```
#### Parameters

*   array: B

#### Returns

* [ArrayValues](builtin-ArrayValues.md)\[A, B\] ref^

---

## Public Functions

### has_next
<span class="source-link">[[Source]](src/builtin/array.md#L-0-968)</span>


```pony
fun box has_next()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### next
<span class="source-link">[[Source]](src/builtin/array.md#L-0-971)</span>


```pony
fun ref next()
: B->A ?
```

#### Returns

* B->A ?

---

### rewind
<span class="source-link">[[Source]](src/builtin/array.md#L-0-974)</span>


```pony
fun ref rewind()
: ArrayValues[A, B] ref
```

#### Returns

* [ArrayValues](builtin-ArrayValues.md)\[A, B\] ref

---

