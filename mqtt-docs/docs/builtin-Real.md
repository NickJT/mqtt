# Real\[A: [Real](builtin-Real.md)\[A\] val\]
<span class="source-link">[[Source]](src/builtin/real.md#L-0-133)</span>
```pony
trait val Real[A: Real[A] val] is
  Stringable box,
  _ArithmeticConvertible val,
  Comparable[A] ref
```

#### Implements

* [Stringable](builtin-Stringable.md) box
* [_ArithmeticConvertible](builtin-_ArithmeticConvertible.md) val
* [Comparable](builtin-Comparable.md)\[A\] ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/real.md#L-0-135)</span>


```pony
new val create(
  value: A)
: Real[A] val^
```
#### Parameters

*   value: A

#### Returns

* [Real](builtin-Real.md)\[A\] val^

---

### from\[B: (([I8](builtin-I8.md) val | [I16](builtin-I16.md) val | [I32](builtin-I32.md) val | [I64](builtin-I64.md) val | [I128](builtin-I128.md) val | [ILong](builtin-ILong.md) val | [ISize](builtin-ISize.md) val | [U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val | [F32](builtin-F32.md) val | [F64](builtin-F64.md) val) & [Real](builtin-Real.md)\[B\] val)\]
<span class="source-link">[[Source]](src/builtin/real.md#L-0-137)</span>


```pony
new val from[B: ((I8 val | I16 val | I32 val | 
    I64 val | I128 val | ILong val | 
    ISize val | U8 val | U16 val | 
    U32 val | U64 val | U128 val | 
    ULong val | USize val | F32 val | 
    F64 val) & Real[B] val)](
  a: B)
: Real[A] val^
```
#### Parameters

*   a: B

#### Returns

* [Real](builtin-Real.md)\[A\] val^

---

### min_value
<span class="source-link">[[Source]](src/builtin/real.md#L-0-138)</span>


```pony
new val min_value()
: Real[A] val^
```

#### Returns

* [Real](builtin-Real.md)\[A\] val^

---

### max_value
<span class="source-link">[[Source]](src/builtin/real.md#L-0-139)</span>


```pony
new val max_value()
: Real[A] val^
```

#### Returns

* [Real](builtin-Real.md)\[A\] val^

---

## Public Functions

### add
<span class="source-link">[[Source]](src/builtin/real.md#L-0-141)</span>


```pony
fun box add(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### sub
<span class="source-link">[[Source]](src/builtin/real.md#L-0-142)</span>


```pony
fun box sub(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### mul
<span class="source-link">[[Source]](src/builtin/real.md#L-0-143)</span>


```pony
fun box mul(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### div
<span class="source-link">[[Source]](src/builtin/real.md#L-0-144)</span>


Integer division, rounded towards zero.


```pony
fun box div(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### divrem
<span class="source-link">[[Source]](src/builtin/real.md#L-0-150)</span>


```pony
fun box divrem(
  y: A)
: (A , A)
```
#### Parameters

*   y: A

#### Returns

* (A , A)

---

### rem
<span class="source-link">[[Source]](src/builtin/real.md#L-0-151)</span>


Calculate the remainder after integer division, rounded towards zero (`div`).

The result has the sign of the dividend.


```pony
fun box rem(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### neg
<span class="source-link">[[Source]](src/builtin/real.md#L-0-159)</span>


```pony
fun box neg()
: A
```

#### Returns

* A

---

### fld
<span class="source-link">[[Source]](src/builtin/real.md#L-0-161)</span>


Floored integer division, rounded towards negative infinity.


```pony
fun box fld(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### mod
<span class="source-link">[[Source]](src/builtin/real.md#L-0-165)</span>


Calculate the modulo after floored integer division, rounded towards negative infinity (`fld`).

The result has the sign of the divisor.


```pony
fun box mod(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### eq
<span class="source-link">[[Source]](src/builtin/real.md#L-0-172)</span>


```pony
fun box eq(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/builtin/real.md#L-0-173)</span>


```pony
fun box ne(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### lt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-174)</span>


```pony
fun box lt(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### le
<span class="source-link">[[Source]](src/builtin/real.md#L-0-175)</span>


```pony
fun box le(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### ge
<span class="source-link">[[Source]](src/builtin/real.md#L-0-176)</span>


```pony
fun box ge(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### gt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-177)</span>


```pony
fun box gt(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### min
<span class="source-link">[[Source]](src/builtin/real.md#L-0-179)</span>


```pony
fun box min(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### max
<span class="source-link">[[Source]](src/builtin/real.md#L-0-180)</span>


```pony
fun box max(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### hash
<span class="source-link">[[Source]](src/builtin/real.md#L-0-182)</span>


```pony
fun box hash()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### hash64
<span class="source-link">[[Source]](src/builtin/real.md#L-0-198)</span>


```pony
fun box hash64()
: U64 val
```

#### Returns

* [U64](builtin-U64.md) val

---

### string



```pony
fun box string()
: String iso^
```

#### Returns

* [String](builtin-String.md) iso^

---

### i8
<span class="source-link">[[Source]](src/builtin/real.md#L-0-2)</span>


```pony
fun box i8()
: I8 val
```

#### Returns

* [I8](builtin-I8.md) val

---

### i16
<span class="source-link">[[Source]](src/builtin/real.md#L-0-3)</span>


```pony
fun box i16()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### i32
<span class="source-link">[[Source]](src/builtin/real.md#L-0-4)</span>


```pony
fun box i32()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### i64
<span class="source-link">[[Source]](src/builtin/real.md#L-0-5)</span>


```pony
fun box i64()
: I64 val
```

#### Returns

* [I64](builtin-I64.md) val

---

### i128
<span class="source-link">[[Source]](src/builtin/real.md#L-0-6)</span>


```pony
fun box i128()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### ilong
<span class="source-link">[[Source]](src/builtin/real.md#L-0-7)</span>


```pony
fun box ilong()
: ILong val
```

#### Returns

* [ILong](builtin-ILong.md) val

---

### isize
<span class="source-link">[[Source]](src/builtin/real.md#L-0-8)</span>


```pony
fun box isize()
: ISize val
```

#### Returns

* [ISize](builtin-ISize.md) val

---

### u8
<span class="source-link">[[Source]](src/builtin/real.md#L-0-10)</span>


```pony
fun box u8()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### u16
<span class="source-link">[[Source]](src/builtin/real.md#L-0-11)</span>


```pony
fun box u16()
: U16 val
```

#### Returns

* [U16](builtin-U16.md) val

---

### u32
<span class="source-link">[[Source]](src/builtin/real.md#L-0-12)</span>


```pony
fun box u32()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### u64
<span class="source-link">[[Source]](src/builtin/real.md#L-0-13)</span>


```pony
fun box u64()
: U64 val
```

#### Returns

* [U64](builtin-U64.md) val

---

### u128
<span class="source-link">[[Source]](src/builtin/real.md#L-0-14)</span>


```pony
fun box u128()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### ulong
<span class="source-link">[[Source]](src/builtin/real.md#L-0-15)</span>


```pony
fun box ulong()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### usize
<span class="source-link">[[Source]](src/builtin/real.md#L-0-16)</span>


```pony
fun box usize()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### f32
<span class="source-link">[[Source]](src/builtin/real.md#L-0-18)</span>


```pony
fun box f32()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### f64
<span class="source-link">[[Source]](src/builtin/real.md#L-0-19)</span>


```pony
fun box f64()
: F64 val
```

#### Returns

* [F64](builtin-F64.md) val

---

### i8_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-21)</span>


```pony
fun box i8_unsafe()
: I8 val
```

#### Returns

* [I8](builtin-I8.md) val

---

### i16_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-28)</span>


```pony
fun box i16_unsafe()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### i32_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-35)</span>


```pony
fun box i32_unsafe()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### i64_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-42)</span>


```pony
fun box i64_unsafe()
: I64 val
```

#### Returns

* [I64](builtin-I64.md) val

---

### i128_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-49)</span>


```pony
fun box i128_unsafe()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### ilong_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-56)</span>


```pony
fun box ilong_unsafe()
: ILong val
```

#### Returns

* [ILong](builtin-ILong.md) val

---

### isize_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-63)</span>


```pony
fun box isize_unsafe()
: ISize val
```

#### Returns

* [ISize](builtin-ISize.md) val

---

### u8_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-70)</span>


```pony
fun box u8_unsafe()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### u16_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-77)</span>


```pony
fun box u16_unsafe()
: U16 val
```

#### Returns

* [U16](builtin-U16.md) val

---

### u32_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-84)</span>


```pony
fun box u32_unsafe()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### u64_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-91)</span>


```pony
fun box u64_unsafe()
: U64 val
```

#### Returns

* [U64](builtin-U64.md) val

---

### u128_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-98)</span>


```pony
fun box u128_unsafe()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### ulong_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-105)</span>


```pony
fun box ulong_unsafe()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### usize_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-112)</span>


```pony
fun box usize_unsafe()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### f32_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-119)</span>


```pony
fun box f32_unsafe()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### f64_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-126)</span>


```pony
fun box f64_unsafe()
: F64 val
```

#### Returns

* [F64](builtin-F64.md) val

---

### compare
<span class="source-link">[[Source]](src/builtin/compare.md#L-0-28)</span>


```pony
fun box compare(
  that: box->A)
: (Less val | Equal val | Greater val)
```
#### Parameters

*   that: box->A

#### Returns

* ([Less](builtin-Less.md) val | [Equal](builtin-Equal.md) val | [Greater](builtin-Greater.md) val)

---

## Private Functions

### _value
<span class="source-link">[[Source]](src/builtin/real.md#L-0-211)</span>


```pony
fun box _value()
: A
```

#### Returns

* A

---

