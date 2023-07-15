# Range\[optional A: ([Real](builtin-Real.md)\[A\] val & ([I8](builtin-I8.md) val | [I16](builtin-I16.md) val | [I32](builtin-I32.md) val | [I64](builtin-I64.md) val | [I128](builtin-I128.md) val | [ILong](builtin-ILong.md) val | [ISize](builtin-ISize.md) val | [U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val | [F32](builtin-F32.md) val | [F64](builtin-F64.md) val))\]
<span class="source-link">[[Source]](src/collections/range.md#L-0-1)</span>

Produces `[min, max)` with a step of `inc` for any `Number` type.

```pony
// iterating with for-loop
for i in Range(0, 10) do
  env.out.print(i.string())
end

// iterating over Range of U8 with while-loop
let range = Range[U8](5, 100, 5)
while range.has_next() do
  try
    handle_u8(range.next()?)
  end
end
```

Supports `min` being smaller than `max` with negative `inc`
but only for signed integer types and floats:

```pony
var previous = 11
for left in Range[I64](10, -5, -1) do
  if not (left < previous) then
    error
  end
  previous = left
end
```

If `inc` is nonzero, but cannot produce progress towards `max` because of its sign, the `Range` is considered empty and will not produce any iterations. The `Range` is also empty if either `min` equals `max`, independent of the value of `inc`, or if `inc` is zero.

```pony
let empty_range1 = Range(0, 10, -1)
let empty_range2 = Range(0, 10, 0)
let empty_range3 = Range(10, 10)
empty_range1.is_empty() == true
empty_range2.is_empty() == true
empty_range3.is_empty() == true
```

Note that when using unsigned integers, a negative literal wraps around so while `Range[ISize](0, 10, -1)` is empty as above, `Range[USize](0, 10, -1)` produces a single value of `min` or `[0]` here.

When using `Range` with floating point types (`F32` and `F64`) `inc` steps < 1.0 are possible. If any arguments contains NaN, the `Range` is considered empty. It is also empty if the lower bound `min` or the step `inc` are +Inf or -Inf. However, if only the upper bound `max` is +Inf or -Inf and the step parameter `inc` has the same sign, then the `Range` is considered infinite and will iterate indefinitely.

```pony
let p_inf: F64 = F64.max_value() + F64.max_value()
let n_inf: F64 = -p_inf
let nan: F64 = F64(0) / F64(0)

let infinite_range1 = Range[F64](0, p_inf, 1)
let infinite_range2 = Range[F64](0, n_inf, -1_000_000)
infinite_range1.is_infinite() == true
infinite_range2.is_infinite() == true

for i in Range[F64](0.5, 100, nan) do
  // will not be executed as `inc` is nan
end
for i in Range[F64](0.5, 100, p_inf) do
  // will not be executed as `inc` is +Inf
end
```


```pony
class ref Range[optional A: (Real[A] val & (I8 val | I16 val | I32 val | 
    I64 val | I128 val | ILong val | 
    ISize val | U8 val | U16 val | 
    U32 val | U64 val | U128 val | 
    ULong val | USize val | F32 val | 
    F64 val))] is
  Iterator[A] ref
```

#### Implements

* [Iterator](builtin-Iterator.md)\[A\] ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/collections/range.md#L-0-74)</span>


```pony
new ref create(
  min: A,
  max: A,
  inc: A = 1)
: Range[A] ref^
```
#### Parameters

*   min: A
*   max: A
*   inc: A = 1

#### Returns

* [Range](collections-Range.md)\[A\] ref^

---

## Public Functions

### has_next
<span class="source-link">[[Source]](src/collections/range.md#L-0-98)</span>


```pony
fun box has_next()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### next
<span class="source-link">[[Source]](src/collections/range.md#L-0-108)</span>


```pony
fun ref next()
: A ?
```

#### Returns

* A ?

---

### rewind
<span class="source-link">[[Source]](src/collections/range.md#L-0-115)</span>


```pony
fun ref rewind()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### is_infinite
<span class="source-link">[[Source]](src/collections/range.md#L-0-118)</span>


```pony
fun box is_infinite()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### is_empty
<span class="source-link">[[Source]](src/collections/range.md#L-0-121)</span>


```pony
fun box is_empty()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

