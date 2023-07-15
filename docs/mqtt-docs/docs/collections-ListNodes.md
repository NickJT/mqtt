# ListNodes\[A: A, N: [ListNode](collections-ListNode.md)\[A\] #read\]
<span class="source-link">[[Source]](src/collections/list.md#L-0-899)</span>

Iterate over the nodes in a `List`.


```pony
class ref ListNodes[A: A, N: ListNode[A] #read] is
  Iterator[N] ref
```

#### Implements

* [Iterator](builtin-Iterator.md)\[N\] ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/collections/list.md#L-0-906)</span>


Build the iterator over nodes.

`reverse` of `false` iterates forward, while
`reverse` of `true` iterates in reverse.


```pony
new ref create(
  head: (N | None val),
  reverse: Bool val = false)
: ListNodes[A, N] ref^
```
#### Parameters

*   head: (N | [None](builtin-None.md) val)
*   reverse: [Bool](builtin-Bool.md) val = false

#### Returns

* [ListNodes](collections-ListNodes.md)\[A, N\] ref^

---

## Public Functions

### has_next
<span class="source-link">[[Source]](src/collections/list.md#L-0-916)</span>


Indicates whether there are any nodes remaining in the iterator.


```pony
fun box has_next()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### next
<span class="source-link">[[Source]](src/collections/list.md#L-0-922)</span>


Return the next node in the iterator, advancing the iterator by one element.

Order of return is determined by `reverse` argument during creation.


```pony
fun ref next()
: N ?
```

#### Returns

* N ?

---

