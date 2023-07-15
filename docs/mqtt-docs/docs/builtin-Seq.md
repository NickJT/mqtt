# Seq\[A: A\]
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-1)</span>

A sequence of elements.


```pony
interface ref Seq[A: A]
```

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-5)</span>


Create a sequence, reserving space for len elements.


```pony
new ref create(
  len: USize val = 0)
: Seq[A] ref^
```
#### Parameters

*   len: [USize](builtin-USize.md) val = 0

#### Returns

* [Seq](builtin-Seq.md)\[A\] ref^

---

## Public Functions

### reserve
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-10)</span>


Reserve space for len elements.


```pony
fun ref reserve(
  len: USize val)
: None val
```
#### Parameters

*   len: [USize](builtin-USize.md) val

#### Returns

* [None](builtin-None.md) val

---

### size
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-15)</span>


Returns the number of elements in the sequence.


```pony
fun box size()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### apply
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-20)</span>


Returns the i-th element of the sequence. Raises an error if the index
is out of bounds.


```pony
fun box apply(
  i: USize val)
: this->A ?
```
#### Parameters

*   i: [USize](builtin-USize.md) val

#### Returns

* this->A ?

---

### update
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-26)</span>


Replaces the i-th element of the sequence. Returns the previous value.
Raises an error if the index is out of bounds.


```pony
fun ref update(
  i: USize val,
  value: A)
: A^ ?
```
#### Parameters

*   i: [USize](builtin-USize.md) val
*   value: A

#### Returns

* A^ ?

---

### clear
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-32)</span>


Removes all elements from the sequence.


```pony
fun ref clear()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### push
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-37)</span>


Adds an element to the end of the sequence.


```pony
fun ref push(
  value: A)
: None val
```
#### Parameters

*   value: A

#### Returns

* [None](builtin-None.md) val

---

### pop
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-42)</span>


Removes an element from the end of the sequence.


```pony
fun ref pop()
: A^ ?
```

#### Returns

* A^ ?

---

### unshift
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-47)</span>


Adds an element to the beginning of the sequence.


```pony
fun ref unshift(
  value: A)
: None val
```
#### Parameters

*   value: A

#### Returns

* [None](builtin-None.md) val

---

### shift
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-52)</span>


Removes an element from the beginning of the sequence.


```pony
fun ref shift()
: A^ ?
```

#### Returns

* A^ ?

---

### append
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-57)</span>


Add len elements to the end of the list, starting from the given
offset.


```pony
fun ref append(
  seq: (ReadSeq[A] box & ReadElement[A^] box),
  offset: USize val = 0,
  len: USize val = call)
: None val
```
#### Parameters

*   seq: ([ReadSeq](builtin-ReadSeq.md)\[A\] box & [ReadElement](builtin-ReadElement.md)\[A^\] box)
*   offset: [USize](builtin-USize.md) val = 0
*   len: [USize](builtin-USize.md) val = call

#### Returns

* [None](builtin-None.md) val

---

### concat
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-66)</span>


Add len iterated elements to the end of the list, starting from the given
offset.


```pony
fun ref concat(
  iter: Iterator[A^] ref,
  offset: USize val = 0,
  len: USize val = call)
: None val
```
#### Parameters

*   iter: [Iterator](builtin-Iterator.md)\[A^\] ref
*   offset: [USize](builtin-USize.md) val = 0
*   len: [USize](builtin-USize.md) val = call

#### Returns

* [None](builtin-None.md) val

---

### truncate
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-72)</span>


Truncate the sequence to the given length, discarding excess elements.
If the sequence is already smaller than len, do nothing.


```pony
fun ref truncate(
  len: USize val)
: None val
```
#### Parameters

*   len: [USize](builtin-USize.md) val

#### Returns

* [None](builtin-None.md) val

---

### values
<span class="source-link">[[Source]](src/builtin/seq.md#L-0-78)</span>


Returns an iterator over the elements of the sequence.


```pony
fun box values()
: Iterator[this->A] ref^
```

#### Returns

* [Iterator](builtin-Iterator.md)\[this->A\] ref^

---

