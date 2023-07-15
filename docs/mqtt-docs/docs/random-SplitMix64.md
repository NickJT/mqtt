# SplitMix64
<span class="source-link">[[Source]](src/random/splitmix64.md#L-0-1)</span>

Very fast Pseudo-Random-Number-Generator
using only 64 bit of state, as detailed at:

http://xoshiro.di.unimi.it/ and http://gee.cs.oswego.edu/dl/papers/oopsla14.pdf

Using [XorOshiro128StarStar](random-XorOshiro128StarStar.md) or [XorOshiro128Plus](random-XorOshiro128Plus.md)
should be prefered unless using only 64 bit of state is a requirement.


```pony
class ref SplitMix64 is
  Random ref
```

#### Implements

* [Random](random-Random.md) ref

---

## Constructors

### from_u64
<span class="source-link">[[Source]](src/random/splitmix64.md#L-0-14)</span>


```pony
new ref from_u64(
  x: U64 val = 5489)
: SplitMix64 ref^
```
#### Parameters

*   x: [U64](builtin-U64.md) val = 5489

#### Returns

* [SplitMix64](random-SplitMix64.md) ref^

---

### create
<span class="source-link">[[Source]](src/random/splitmix64.md#L-0-17)</span>


Only x is used, y is discarded.


```pony
new ref create(
  x: U64 val = 5489,
  y: U64 val = 0)
: SplitMix64 ref^
```
#### Parameters

*   x: [U64](builtin-U64.md) val = 5489
*   y: [U64](builtin-U64.md) val = 0

#### Returns

* [SplitMix64](random-SplitMix64.md) ref^

---

## Public Functions

### next
<span class="source-link">[[Source]](src/random/splitmix64.md#L-0-23)</span>


```pony
fun ref next()
: U64 val
```

#### Returns

* [U64](builtin-U64.md) val

---

### has_next
<span class="source-link">[[Source]](src/random/random.md#L-0-34)</span>


```pony
fun tag has_next()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### u8
<span class="source-link">[[Source]](src/random/random.md#L-0-45)</span>


```pony
fun ref u8()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### u16
<span class="source-link">[[Source]](src/random/random.md#L-0-51)</span>


```pony
fun ref u16()
: U16 val
```

#### Returns

* [U16](builtin-U16.md) val

---

### u32
<span class="source-link">[[Source]](src/random/random.md#L-0-57)</span>


```pony
fun ref u32()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### u64
<span class="source-link">[[Source]](src/random/random.md#L-0-63)</span>


```pony
fun ref u64()
: U64 val
```

#### Returns

* [U64](builtin-U64.md) val

---

### u128
<span class="source-link">[[Source]](src/random/random.md#L-0-69)</span>


```pony
fun ref u128()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### ulong
<span class="source-link">[[Source]](src/random/random.md#L-0-75)</span>


```pony
fun ref ulong()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### usize
<span class="source-link">[[Source]](src/random/random.md#L-0-85)</span>


```pony
fun ref usize()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### i8
<span class="source-link">[[Source]](src/random/random.md#L-0-95)</span>


```pony
fun ref i8()
: I8 val
```

#### Returns

* [I8](builtin-I8.md) val

---

### i16
<span class="source-link">[[Source]](src/random/random.md#L-0-101)</span>


```pony
fun ref i16()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### i32
<span class="source-link">[[Source]](src/random/random.md#L-0-107)</span>


```pony
fun ref i32()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### i64
<span class="source-link">[[Source]](src/random/random.md#L-0-113)</span>


```pony
fun ref i64()
: I64 val
```

#### Returns

* [I64](builtin-I64.md) val

---

### i128
<span class="source-link">[[Source]](src/random/random.md#L-0-119)</span>


```pony
fun ref i128()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### ilong
<span class="source-link">[[Source]](src/random/random.md#L-0-125)</span>


```pony
fun ref ilong()
: ILong val
```

#### Returns

* [ILong](builtin-ILong.md) val

---

### isize
<span class="source-link">[[Source]](src/random/random.md#L-0-131)</span>


```pony
fun ref isize()
: ISize val
```

#### Returns

* [ISize](builtin-ISize.md) val

---

### int_fp_mult\[optional N: (([U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val) & [Real](builtin-Real.md)\[N\] val)\]
<span class="source-link">[[Source]](src/random/random.md#L-0-137)</span>


```pony
fun ref int_fp_mult[optional N: ((U8 val | U16 val | U32 val | 
    U64 val | U128 val | ULong val | 
    USize val) & Real[N] val)](
  n: N)
: N
```
#### Parameters

*   n: N

#### Returns

* N

---

### int\[optional N: (([U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val) & [Real](builtin-Real.md)\[N\] val)\]
<span class="source-link">[[Source]](src/random/random.md#L-0-143)</span>


```pony
fun ref int[optional N: ((U8 val | U16 val | U32 val | 
    U64 val | U128 val | ULong val | 
    USize val) & Real[N] val)](
  n: N)
: N
```
#### Parameters

*   n: N

#### Returns

* N

---

### int_unbiased\[optional N: (([U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val) & [Real](builtin-Real.md)\[N\] val)\]
<span class="source-link">[[Source]](src/random/random.md#L-0-159)</span>


```pony
fun ref int_unbiased[optional N: ((U8 val | U16 val | U32 val | 
    U64 val | U128 val | ULong val | 
    USize val) & Real[N] val)](
  n: N)
: N
```
#### Parameters

*   n: N

#### Returns

* N

---

### real
<span class="source-link">[[Source]](src/random/random.md#L-0-195)</span>


```pony
fun ref real()
: F64 val
```

#### Returns

* [F64](builtin-F64.md) val

---

### shuffle\[A: A\]
<span class="source-link">[[Source]](src/random/random.md#L-0-201)</span>


```pony
fun ref shuffle[A: A](
  array: Array[A] ref)
: None val
```
#### Parameters

*   array: [Array](builtin-Array.md)\[A\] ref

#### Returns

* [None](builtin-None.md) val

---

## Private Functions

### _u64_unbiased
<span class="source-link">[[Source]](src/random/random.md#L-0-167)</span>


```pony
fun ref _u64_unbiased(
  range: U64 val)
: U64 val
```
#### Parameters

*   range: [U64](builtin-U64.md) val

#### Returns

* [U64](builtin-U64.md) val

---

