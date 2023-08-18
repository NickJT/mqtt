# XorShift128Plus
<span class="source-link">[[Source]](src/random/xorshift.md#L-0-1)</span>

This is an implementation of xorshift+, as detailed at:

http://xoroshiro.di.unimi.it

This should only be used for legacy applications that specifically require
XorShift128Plus, otherwise use Rand.


```pony
class ref XorShift128Plus is
  Random ref
```

#### Implements

* [Random](random-Random.md) ref

---

## Constructors

### from_u64
<span class="source-link">[[Source]](src/random/xorshift.md#L-0-13)</span>


Use seed x to seed a [SplitMix64](random-SplitMix64.md) and use this to
initialize the 128 bits of state.


```pony
new ref from_u64(
  x: U64 val = 5489)
: XorShift128Plus ref^
```
#### Parameters

*   x: [U64](builtin-U64.md) val = 5489

#### Returns

* [XorShift128Plus](random-XorShift128Plus.md) ref^

---

### create
<span class="source-link">[[Source]](src/random/xorshift.md#L-0-22)</span>


Create with the specified seed. Returned values are deterministic for a
given seed.


```pony
new ref create(
  x: U64 val = 5489,
  y: U64 val = 0)
: XorShift128Plus ref^
```
#### Parameters

*   x: [U64](builtin-U64.md) val = 5489
*   y: [U64](builtin-U64.md) val = 0

#### Returns

* [XorShift128Plus](random-XorShift128Plus.md) ref^

---

## Public Functions

### next
<span class="source-link">[[Source]](src/random/xorshift.md#L-0-31)</span>


A random integer in [0, 2^64)


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

