# ListValues\[A: A, N: [ListNode](collections-ListNode.md)\[A\] #read\]
<span class="source-link">[[Source]](src/collections/list.md#L-0-941)</span>

Iterate over the values in a `List`.


```pony
class ref ListValues[A: A, N: ListNode[A] #read] is
  Iterator[N->A] ref
```

#### Implements

* [Iterator](builtin-Iterator.md)\[N->A\] ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/collections/list.md#L-0-948)</span>


Build the iterator over values.

`reverse` of `false` iterates forward, while
`reverse` of `true` iterates in reverse.


```pony
new ref create(
  head: (N | None val),
  reverse: Bool val = false)
: ListValues[A, N] ref^
```
#### Parameters

*   head: (N | [None](builtin-None.md) val)
*   reverse: [Bool](builtin-Bool.md) val = false

#### Returns

* [ListValues](collections-ListValues.md)\[A, N\] ref^

---

## Public Functions

### has_next
<span class="source-link">[[Source]](src/collections/list.md#L-0-958)</span>


Indicates whether there are any values remaining in the iterator.


```pony
fun box has_next()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### next
<span class="source-link">[[Source]](src/collections/list.md#L-0-964)</span>


Return the next node in the iterator, advancing the iterator by one element.

Order of return is determined by `reverse` argument during creation.


```pony
fun ref next()
: N->A ?
```

#### Returns

* N->A ?

---

