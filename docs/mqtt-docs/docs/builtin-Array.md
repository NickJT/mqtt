# Array\[A: A\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-1)</span>

Contiguous, resizable memory to store elements of type A.

## Usage

Creating an Array of String:
```pony
  let array: Array[String] = ["dog"; "cat"; "wombat"]
  // array.size() == 3
  // array.space() >= 3
```

Creating an empty Array of String, which may hold at least 10 elements before
requesting more space:
```pony
  let array = Array[String](10)
  // array.size() == 0
  // array.space() >= 10
```

Accessing elements can be done via the `apply(i: USize): this->A ?` method.
The provided index might be out of bounds so `apply` is partial and has to be
called within a try-catch block or inside another partial method:
```pony
  let array: Array[String] = ["dog"; "cat"; "wombat"]
  let is_second_element_wobat = try
    // indexes start from 0, so 1 is the second element
    array(1)? == "wombat"
  else
    false
  end
```

Adding and removing elements to and from the end of the Array can be done via
`push` and `pop` methods. You could treat the array as a LIFO stack using
those methods:
```pony
  while (array.size() > 0) do
    let elem = array.pop()?
    // do something with element
  end
```

Modifying the Array can be done via `update`, `insert` and `delete` methods
which alter the Array at an arbitrary index, moving elements left (when
deleting) or right (when inserting) as necessary.

Iterating over the elements of an Array can be done using the `values` method:
```pony
  for element in array.values() do
      // do something with element
  end
```

## Memory allocation
Array allocates contiguous memory. It always allocates at least enough memory
space to hold all of its elements. Space is the number of elements the Array
can hold without allocating more memory. The `space()` method returns the
number of elements an Array can hold. The `size()` method returns the number
of elements the Array holds.

Different data types require different amounts of memory. Array[U64] with size
of 6 will take more memory than an Array[U8] of the same size.

When creating an Array or adding more elements will calculate the next power
of 2 of the requested number of elements and allocate that much space, with a
lower bound of space for 8 elements.

Here's a few examples of the space allocated when initialising an Array with
various number of elements:

| size | space |
|------|-------|
| 0    | 0     |
| 1    | 8     |
| 8    | 8     |
| 9    | 16    |
| 16   | 16    |
| 17   | 32    |

Call the `compact()` method to ask the GC to reclaim unused space. There are
no guarantees that the GC will actually reclaim any space.


```pony
class ref Array[A: A] is
  Seq[A] ref
```

#### Implements

* [Seq](builtin-Seq.md)\[A\] ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/array.md#L-0-89)</span>


Create an array with zero elements, but space for len elements.


```pony
new ref create(
  len: USize val = 0)
: Array[A] ref^
```
#### Parameters

*   len: [USize](builtin-USize.md) val = 0

#### Returns

* [Array](builtin-Array.md)\[A\] ref^

---

### init
<span class="source-link">[[Source]](src/builtin/array.md#L-0-103)</span>


Create an array of len elements, all initialised to the given value.


```pony
new ref init(
  from: A^,
  len: USize val)
: Array[A] ref^
```
#### Parameters

*   from: A^
*   len: [USize](builtin-USize.md) val

#### Returns

* [Array](builtin-Array.md)\[A\] ref^

---

### from_cpointer
<span class="source-link">[[Source]](src/builtin/array.md#L-0-124)</span>


Create an array from a C-style pointer and length. The contents are not
copied. This must be done only with C-FFI functions that return
pony_alloc'd memory. If a null pointer is given then an empty array
is returned.


```pony
new ref from_cpointer(
  ptr: Pointer[A] ref,
  len: USize val,
  alloc: USize val = 0)
: Array[A] ref^
```
#### Parameters

*   ptr: [Pointer](builtin-Pointer.md)\[A\] ref
*   len: [USize](builtin-USize.md) val
*   alloc: [USize](builtin-USize.md) val = 0

#### Returns

* [Array](builtin-Array.md)\[A\] ref^

---

## Public Functions

### cpointer
<span class="source-link">[[Source]](src/builtin/array.md#L-0-156)</span>


Return the underlying C-style pointer.


```pony
fun box cpointer(
  offset: USize val = 0)
: Pointer[A] tag
```
#### Parameters

*   offset: [USize](builtin-USize.md) val = 0

#### Returns

* [Pointer](builtin-Pointer.md)\[A\] tag

---

### size
<span class="source-link">[[Source]](src/builtin/array.md#L-0-162)</span>


The number of elements in the array.


```pony
fun box size()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### space
<span class="source-link">[[Source]](src/builtin/array.md#L-0-168)</span>


The available space in the array.


```pony
fun box space()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### reserve
<span class="source-link">[[Source]](src/builtin/array.md#L-0-174)</span>


Reserve space for len elements, including whatever elements are already in
the array. Array space grows geometrically.


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

### compact
<span class="source-link">[[Source]](src/builtin/array.md#L-0-190)</span>


Try to remove unused space, making it available for garbage collection. The
request may be ignored.


```pony
fun ref compact()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### undefined\[optional B: (A & [Real](builtin-Real.md)\[B\] val & ([I8](builtin-I8.md) val | [I16](builtin-I16.md) val | [I32](builtin-I32.md) val | [I64](builtin-I64.md) val | [I128](builtin-I128.md) val | [ILong](builtin-ILong.md) val | [ISize](builtin-ISize.md) val | [U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val | [F32](builtin-F32.md) val | [F64](builtin-F64.md) val))\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-207)</span>


Resize to len elements, populating previously empty elements with random
memory. This is only allowed for an array of numbers.


```pony
fun ref undefined[optional B: (A & Real[B] val & (I8 val | I16 val | I32 val | 
    I64 val | I128 val | ILong val | 
    ISize val | U8 val | U16 val | 
    U32 val | U64 val | U128 val | 
    ULong val | USize val | F32 val | 
    F64 val))](
  len: USize val)
: None val
```
#### Parameters

*   len: [USize](builtin-USize.md) val

#### Returns

* [None](builtin-None.md) val

---

### read_u8\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-215)</span>


Reads a U8 from offset. This is only allowed for an array of U8s.


```pony
fun box read_u8[optional B: (A & Real[B] val & U8 val)](
  offset: USize val)
: U8 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val

#### Returns

* [U8](builtin-U8.md) val ?

---

### read_u16\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-225)</span>


Reads a U16 from offset. This is only allowed for an array of U8s.


```pony
fun box read_u16[optional B: (A & Real[B] val & U8 val)](
  offset: USize val)
: U16 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val

#### Returns

* [U16](builtin-U16.md) val ?

---

### read_u32\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-236)</span>


Reads a U32 from offset. This is only allowed for an array of U8s.


```pony
fun box read_u32[optional B: (A & Real[B] val & U8 val)](
  offset: USize val)
: U32 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val

#### Returns

* [U32](builtin-U32.md) val ?

---

### read_u64\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-247)</span>


Reads a U64 from offset. This is only allowed for an array of U8s.


```pony
fun box read_u64[optional B: (A & Real[B] val & U8 val)](
  offset: USize val)
: U64 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val

#### Returns

* [U64](builtin-U64.md) val ?

---

### read_u128\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-258)</span>


Reads a U128 from offset. This is only allowed for an array of U8s.


```pony
fun box read_u128[optional B: (A & Real[B] val & U8 val)](
  offset: USize val)
: U128 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val

#### Returns

* [U128](builtin-U128.md) val ?

---

### apply
<span class="source-link">[[Source]](src/builtin/array.md#L-0-269)</span>


Get the i-th element, raising an error if the index is out of bounds.


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

### update_u8\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-279)</span>


Write a U8 at offset. This is only allowed for an array of U8s.


```pony
fun ref update_u8[optional B: (A & Real[B] val & U8 val)](
  offset: USize val,
  value: U8 val)
: U8 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val
*   value: [U8](builtin-U8.md) val

#### Returns

* [U8](builtin-U8.md) val ?

---

### update_u16\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-289)</span>


Write a U16 at offset. This is only allowed for an array of U8s.


```pony
fun ref update_u16[optional B: (A & Real[B] val & U8 val)](
  offset: USize val,
  value: U16 val)
: U16 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val
*   value: [U16](builtin-U16.md) val

#### Returns

* [U16](builtin-U16.md) val ?

---

### update_u32\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-300)</span>


Write a U32 at offset. This is only allowed for an array of U8s.


```pony
fun ref update_u32[optional B: (A & Real[B] val & U8 val)](
  offset: USize val,
  value: U32 val)
: U32 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val
*   value: [U32](builtin-U32.md) val

#### Returns

* [U32](builtin-U32.md) val ?

---

### update_u64\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-311)</span>


Write a U64 at offset. This is only allowed for an array of U8s.


```pony
fun ref update_u64[optional B: (A & Real[B] val & U8 val)](
  offset: USize val,
  value: U64 val)
: U64 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val
*   value: [U64](builtin-U64.md) val

#### Returns

* [U64](builtin-U64.md) val ?

---

### update_u128\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-322)</span>


Write a U128 at offset. This is only allowed for an array of U8s.


```pony
fun ref update_u128[optional B: (A & Real[B] val & U8 val)](
  offset: USize val,
  value: U128 val)
: U128 val ?
```
#### Parameters

*   offset: [USize](builtin-USize.md) val
*   value: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val ?

---

### update
<span class="source-link">[[Source]](src/builtin/array.md#L-0-333)</span>


Change the i-th element, raising an error if the index is out of bounds.


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

### insert
<span class="source-link">[[Source]](src/builtin/array.md#L-0-343)</span>


Insert an element into the array. Elements after this are moved up by one
index, extending the array.

When inserting right beyond the last element, at index `this.size()`,
the element will be appended, similar to `push()`,
an insert at index `0` prepends the value to the array.
An insert into an index beyond `this.size()` raises an error.

```pony
let array = Array[U8](4)              // []
array.insert(0, 0xDE)?                // prepend: [0xDE]
array.insert(array.size(), 0xBE)?     // append:  [0xDE; 0xBE]
array.insert(1, 0xAD)?                // insert:  [0xDE; 0xAD; 0xBE]
array.insert(array.size() + 1, 0xEF)? // error
```


```pony
fun ref insert(
  i: USize val,
  value: A)
: None val ?
```
#### Parameters

*   i: [USize](builtin-USize.md) val
*   value: A

#### Returns

* [None](builtin-None.md) val ?

---

### delete
<span class="source-link">[[Source]](src/builtin/array.md#L-0-370)</span>


Delete an element from the array. Elements after this are moved down by one
index, compacting the array.
An out of bounds index raises an error.
The deleted element is returned.


```pony
fun ref delete(
  i: USize val)
: A^ ?
```
#### Parameters

*   i: [USize](builtin-USize.md) val

#### Returns

* A^ ?

---

### truncate
<span class="source-link">[[Source]](src/builtin/array.md#L-0-384)</span>


Truncate an array to the given length, discarding excess elements. If the
array is already smaller than len, do nothing.


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

### trim_in_place
<span class="source-link">[[Source]](src/builtin/array.md#L-0-391)</span>


Trim the array to a portion of itself, covering `from` until `to`.
Unlike slice, the operation does not allocate a new array nor copy elements.


```pony
fun ref trim_in_place(
  from: USize val = 0,
  to: USize val = call)
: None val
```
#### Parameters

*   from: [USize](builtin-USize.md) val = 0
*   to: [USize](builtin-USize.md) val = call

#### Returns

* [None](builtin-None.md) val

---

### trim
<span class="source-link">[[Source]](src/builtin/array.md#L-0-418)</span>


Return a shared portion of this array, covering `from` until `to`.
Both the original and the new array are immutable, as they share memory.
The operation does not allocate a new array pointer nor copy elements.


```pony
fun val trim(
  from: USize val = 0,
  to: USize val = call)
: Array[A] val
```
#### Parameters

*   from: [USize](builtin-USize.md) val = 0
*   to: [USize](builtin-USize.md) val = call

#### Returns

* [Array](builtin-Array.md)\[A\] val

---

### chop\[optional B: (A & [Any](builtin-Any.md) #send)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-442)</span>


Chops the array in half at the split point requested and returns both
the left and right portions. The original array is trimmed in place and
returned as the left portion. If the split point is larger than the
array, the left portion is the original array and the right portion
is a new empty array.
The operation does not allocate a new array pointer nor copy elements.

The entry type must be sendable so that the two halves can be isolated.
Otherwise, two entries may have shared references to mutable data,
or even to each other, such as in the code below:

```pony
  class Example
     var other: (Example | None) = None

  let arr: Array[Example] iso = recover
     let obj1 = Example
     let obj2 = Example
     obj1.other = obj2
     obj2.other = obj1
     [obj1; obj2]
  end
```


```pony
fun iso chop[optional B: (A & Any #send)](
  split_point: USize val)
: (Array[A] iso^ , Array[A] iso^)
```
#### Parameters

*   split_point: [USize](builtin-USize.md) val

#### Returns

* ([Array](builtin-Array.md)\[A\] iso^ , [Array](builtin-Array.md)\[A\] iso^)

---

### unchop
<span class="source-link">[[Source]](src/builtin/array.md#L-0-485)</span>


Unchops two iso arrays to return the original array they were chopped from.
Both input arrays are isolated and mutable and were originally chopped from
a single array. This function checks that they are indeed two arrays chopped
from the same original array and can be unchopped before doing the
unchopping and returning the unchopped array. If the two arrays cannot be
unchopped it returns both arrays without modifying them.
The operation does not allocate a new array pointer nor copy elements.


```pony
fun iso unchop(
  b: Array[A] iso)
: ((Array[A] iso^ , Array[A] iso^) | Array[A] iso^)
```
#### Parameters

*   b: [Array](builtin-Array.md)\[A\] iso

#### Returns

* (([Array](builtin-Array.md)\[A\] iso^ , [Array](builtin-Array.md)\[A\] iso^) | [Array](builtin-Array.md)\[A\] iso^)

---

### copy_from\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-529)</span>


Copy len elements from src(src_idx) to this(dst_idx).
Only works for Array[U8].


```pony
fun ref copy_from[optional B: (A & Real[B] val & U8 val)](
  src: Array[U8 val] box,
  src_idx: USize val,
  dst_idx: USize val,
  len: USize val)
: None val
```
#### Parameters

*   src: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] box
*   src_idx: [USize](builtin-USize.md) val
*   dst_idx: [USize](builtin-USize.md) val
*   len: [USize](builtin-USize.md) val

#### Returns

* [None](builtin-None.md) val

---

### copy_to
<span class="source-link">[[Source]](src/builtin/array.md#L-0-546)</span>


Copy len elements from this(src_idx) to dst(dst_idx).


```pony
fun box copy_to(
  dst: Array[this->A!] ref,
  src_idx: USize val,
  dst_idx: USize val,
  len: USize val)
: None val
```
#### Parameters

*   dst: [Array](builtin-Array.md)\[this->A!\] ref
*   src_idx: [USize](builtin-USize.md) val
*   dst_idx: [USize](builtin-USize.md) val
*   len: [USize](builtin-USize.md) val

#### Returns

* [None](builtin-None.md) val

---

### remove
<span class="source-link">[[Source]](src/builtin/array.md#L-0-562)</span>


Remove n elements from the array, beginning at index i.


```pony
fun ref remove(
  i: USize val,
  n: USize val)
: None val
```
#### Parameters

*   i: [USize](builtin-USize.md) val
*   n: [USize](builtin-USize.md) val

#### Returns

* [None](builtin-None.md) val

---

### clear
<span class="source-link">[[Source]](src/builtin/array.md#L-0-572)</span>


Remove all elements from the array.


```pony
fun ref clear()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### push_u8\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-578)</span>


Add a U8 to the end of the array. This is only allowed for an array of U8s.


```pony
fun ref push_u8[optional B: (A & Real[B] val & U8 val)](
  value: U8 val)
: None val
```
#### Parameters

*   value: [U8](builtin-U8.md) val

#### Returns

* [None](builtin-None.md) val

---

### push_u16\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-587)</span>


Add a U16 to the end of the array. This is only allowed for an array of U8s.


```pony
fun ref push_u16[optional B: (A & Real[B] val & U8 val)](
  value: U16 val)
: None val
```
#### Parameters

*   value: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### push_u32\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-596)</span>


Add a U32 to the end of the array. This is only allowed for an array of U8s.


```pony
fun ref push_u32[optional B: (A & Real[B] val & U8 val)](
  value: U32 val)
: None val
```
#### Parameters

*   value: [U32](builtin-U32.md) val

#### Returns

* [None](builtin-None.md) val

---

### push_u64\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-605)</span>


Add a U64 to the end of the array. This is only allowed for an array of U8s.


```pony
fun ref push_u64[optional B: (A & Real[B] val & U8 val)](
  value: U64 val)
: None val
```
#### Parameters

*   value: [U64](builtin-U64.md) val

#### Returns

* [None](builtin-None.md) val

---

### push_u128\[optional B: (A & [Real](builtin-Real.md)\[B\] val & [U8](builtin-U8.md) val)\]
<span class="source-link">[[Source]](src/builtin/array.md#L-0-614)</span>


Add a U128 to the end of the array. This is only allowed for an array of U8s.


```pony
fun ref push_u128[optional B: (A & Real[B] val & U8 val)](
  value: U128 val)
: None val
```
#### Parameters

*   value: [U128](builtin-U128.md) val

#### Returns

* [None](builtin-None.md) val

---

### push
<span class="source-link">[[Source]](src/builtin/array.md#L-0-623)</span>


Add an element to the end of the array.


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
<span class="source-link">[[Source]](src/builtin/array.md#L-0-631)</span>


Remove an element from the end of the array.
The removed element is returned.


```pony
fun ref pop()
: A^ ?
```

#### Returns

* A^ ?

---

### unshift
<span class="source-link">[[Source]](src/builtin/array.md#L-0-638)</span>


Add an element to the beginning of the array.


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
<span class="source-link">[[Source]](src/builtin/array.md#L-0-646)</span>


Remove an element from the beginning of the array.
The removed element is returned.


```pony
fun ref shift()
: A^ ?
```

#### Returns

* A^ ?

---

### append
<span class="source-link">[[Source]](src/builtin/array.md#L-0-653)</span>


Append the elements from a sequence, starting from the given offset.


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
<span class="source-link">[[Source]](src/builtin/array.md#L-0-680)</span>


Add len iterated elements to the end of the array, starting from the given
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

### find
<span class="source-link">[[Source]](src/builtin/array.md#L-0-736)</span>


Find the `nth` appearance of `value` from the beginning of the array,
starting at `offset` and examining higher indices, and using the supplied
`predicate` for comparisons. Returns the index of the value, or raise an
error if the value isn't present.

By default, the search starts at the first element of the array, returns
the first instance of `value` found, and uses object identity for
comparison.


```pony
fun box find(
  value: A!,
  offset: USize val = 0,
  nth: USize val = 0,
  predicate: {(box->A!, box->A!): Bool}[A] val = lambda)
: USize val ?
```
#### Parameters

*   value: A!
*   offset: [USize](builtin-USize.md) val = 0
*   nth: [USize](builtin-USize.md) val = 0
*   predicate: {(box->A!, box->A!): Bool}[A] val = lambda

#### Returns

* [USize](builtin-USize.md) val ?

---

### contains
<span class="source-link">[[Source]](src/builtin/array.md#L-0-770)</span>


Returns true if the array contains `value`, false otherwise.

The default predicate checks for matches by identity. To search for matches
by structural equality, pass an object literal such as `{(l, r) => l == r}`.


```pony
fun box contains(
  value: A!,
  predicate: {(box->A!, box->A!): Bool}[A] val = lambda)
: Bool val
```
#### Parameters

*   value: A!
*   predicate: {(box->A!, box->A!): Bool}[A] val = lambda

#### Returns

* [Bool](builtin-Bool.md) val

---

### rfind
<span class="source-link">[[Source]](src/builtin/array.md#L-0-793)</span>


Find the `nth` appearance of `value` from the end of the array, starting at
`offset` and examining lower indices, and using the supplied `predicate` for
comparisons. Returns the index of the value, or raise an error if the value
isn't present.

By default, the search starts at the last element of the array, returns the
first instance of `value` found, and uses object identity for comparison.


```pony
fun box rfind(
  value: A!,
  offset: USize val = call,
  nth: USize val = 0,
  predicate: {(box->A!, box->A!): Bool}[A] val = lambda)
: USize val ?
```
#### Parameters

*   value: A!
*   offset: [USize](builtin-USize.md) val = call
*   nth: [USize](builtin-USize.md) val = 0
*   predicate: {(box->A!, box->A!): Bool}[A] val = lambda

#### Returns

* [USize](builtin-USize.md) val ?

---

### clone
<span class="source-link">[[Source]](src/builtin/array.md#L-0-828)</span>


Clone the array.
The new array contains references to the same elements that the old array
contains, the elements themselves are not cloned.


```pony
fun box clone()
: Array[this->A!] ref^
```

#### Returns

* [Array](builtin-Array.md)\[this->A!\] ref^

---

### slice
<span class="source-link">[[Source]](src/builtin/array.md#L-0-839)</span>


Create a new array that is a clone of a portion of this array. The range is
exclusive and saturated.
The new array contains references to the same elements that the old array
contains, the elements themselves are not cloned.


```pony
fun box slice(
  from: USize val = 0,
  to: USize val = call,
  step: USize val = 1)
: Array[this->A!] ref^
```
#### Parameters

*   from: [USize](builtin-USize.md) val = 0
*   to: [USize](builtin-USize.md) val = call
*   step: [USize](builtin-USize.md) val = 1

#### Returns

* [Array](builtin-Array.md)\[this->A!\] ref^

---

### permute
<span class="source-link">[[Source]](src/builtin/array.md#L-0-874)</span>


Create a new array with the elements permuted.
Permute to an arbitrary order that may include duplicates. An out of bounds
index raises an error.
The new array contains references to the same elements that the old array
contains, the elements themselves are not copied.


```pony
fun box permute(
  indices: Iterator[USize val] ref)
: Array[this->A!] ref^ ?
```
#### Parameters

*   indices: [Iterator](builtin-Iterator.md)\[[USize](builtin-USize.md) val\] ref

#### Returns

* [Array](builtin-Array.md)\[this->A!\] ref^ ?

---

### reverse
<span class="source-link">[[Source]](src/builtin/array.md#L-0-888)</span>


Create a new array with the elements in reverse order.
The new array contains references to the same elements that the old array
contains, the elements themselves are not copied.


```pony
fun box reverse()
: Array[this->A!] ref^
```

#### Returns

* [Array](builtin-Array.md)\[this->A!\] ref^

---

### reverse_in_place
<span class="source-link">[[Source]](src/builtin/array.md#L-0-896)</span>


Reverse the array in place.


```pony
fun ref reverse_in_place()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### swap_elements
<span class="source-link">[[Source]](src/builtin/array.md#L-0-913)</span>


Swap the element at index i with the element at index j.
If either i or j are out of bounds, an error is raised.


```pony
fun ref swap_elements(
  i: USize val,
  j: USize val)
: None val ?
```
#### Parameters

*   i: [USize](builtin-USize.md) val
*   j: [USize](builtin-USize.md) val

#### Returns

* [None](builtin-None.md) val ?

---

### keys
<span class="source-link">[[Source]](src/builtin/array.md#L-0-924)</span>


Return an iterator over the indices in the array.


```pony
fun box keys()
: ArrayKeys[A, this->Array[A] ref] ref^
```

#### Returns

* [ArrayKeys](builtin-ArrayKeys.md)\[A, this->[Array](builtin-Array.md)\[A\] ref\] ref^

---

### values
<span class="source-link">[[Source]](src/builtin/array.md#L-0-930)</span>


Return an iterator over the values in the array.


```pony
fun box values()
: ArrayValues[A, this->Array[A] ref] ref^
```

#### Returns

* [ArrayValues](builtin-ArrayValues.md)\[A, this->[Array](builtin-Array.md)\[A\] ref\] ref^

---

### pairs
<span class="source-link">[[Source]](src/builtin/array.md#L-0-936)</span>


Return an iterator over the (index, value) pairs in the array.


```pony
fun box pairs()
: ArrayPairs[A, this->Array[A] ref] ref^
```

#### Returns

* [ArrayPairs](builtin-ArrayPairs.md)\[A, this->[Array](builtin-Array.md)\[A\] ref\] ref^

---

## Private Functions

### _copy_to
<span class="source-link">[[Source]](src/builtin/array.md#L-0-145)</span>


Copy copy_len elements from this to that at specified offsets.


```pony
fun box _copy_to(
  ptr: Pointer[this->A!] ref,
  copy_len: USize val,
  from_offset: USize val = 0,
  to_offset: USize val = 0)
: None val
```
#### Parameters

*   ptr: [Pointer](builtin-Pointer.md)\[this->A!\] ref
*   copy_len: [USize](builtin-USize.md) val
*   from_offset: [USize](builtin-USize.md) val = 0
*   to_offset: [USize](builtin-USize.md) val = 0

#### Returns

* [None](builtin-None.md) val

---

### _element_size
<span class="source-link">[[Source]](src/builtin/array.md#L-0-184)</span>


Element size in bytes for an element.


```pony
fun box _element_size()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

