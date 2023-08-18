# FloatingPoint\[A: [FloatingPoint](builtin-FloatingPoint.md)\[A\] val\]
<span class="source-link">[[Source]](src/builtin/real.md#L-0-516)</span>
```pony
trait val FloatingPoint[A: FloatingPoint[A] val] is
  Real[A] val
```

#### Implements

* [Real](builtin-Real.md)\[A\] val

---

## Constructors

### min_normalised
<span class="source-link">[[Source]](src/builtin/real.md#L-0-517)</span>


```pony
new val min_normalised()
: FloatingPoint[A] val^
```

#### Returns

* [FloatingPoint](builtin-FloatingPoint.md)\[A\] val^

---

### epsilon
<span class="source-link">[[Source]](src/builtin/real.md#L-0-518)</span>


```pony
new val epsilon()
: FloatingPoint[A] val^
```

#### Returns

* [FloatingPoint](builtin-FloatingPoint.md)\[A\] val^

---

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

### radix
<span class="source-link">[[Source]](src/builtin/real.md#L-0-519)</span>


```pony
fun tag radix()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### precision2
<span class="source-link">[[Source]](src/builtin/real.md#L-0-520)</span>


```pony
fun tag precision2()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### precision10
<span class="source-link">[[Source]](src/builtin/real.md#L-0-521)</span>


```pony
fun tag precision10()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### min_exp2
<span class="source-link">[[Source]](src/builtin/real.md#L-0-522)</span>


```pony
fun tag min_exp2()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### min_exp10
<span class="source-link">[[Source]](src/builtin/real.md#L-0-523)</span>


```pony
fun tag min_exp10()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### max_exp2
<span class="source-link">[[Source]](src/builtin/real.md#L-0-524)</span>


```pony
fun tag max_exp2()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### max_exp10
<span class="source-link">[[Source]](src/builtin/real.md#L-0-525)</span>


```pony
fun tag max_exp10()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### add_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-527)</span>


Unsafe operation.
If any input or output of the operation is +/- infinity or NaN, the result
is undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box add_unsafe(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### sub_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-536)</span>


Unsafe operation.
If any input or output of the operation is +/- infinity or NaN, the result
is undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box sub_unsafe(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### mul_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-545)</span>


Unsafe operation.
If any input or output of the operation is +/- infinity or NaN, the result
is undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box mul_unsafe(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### div_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-554)</span>


Unsafe operation.
If any input or output of the operation is +/- infinity or NaN, the result
is undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box div_unsafe(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### fld_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-563)</span>


Unsafe operation.
If any input or output of the operation is +/- infinity or NaN, the result
is undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box fld_unsafe(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### divrem_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-571)</span>


Unsafe operation.
If any input or output of the operation is +/- infinity or NaN, the result
is undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box divrem_unsafe(
  y: A)
: (A , A)
```
#### Parameters

*   y: A

#### Returns

* (A , A)

---

### rem_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-580)</span>


Unsafe operation.
If any input or output of the operation is +/- infinity or NaN, the result
is undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box rem_unsafe(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### mod_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-589)</span>


Unsafe operation.
If any input or output of the operation is +/- infinity or NaN, the result
is undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box mod_unsafe(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### neg_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-597)</span>


Unsafe operation.
If any input or output of the operation is +/- infinity or NaN, the result
is undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box neg_unsafe()
: A
```

#### Returns

* A

---

### eq_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-606)</span>


Unsafe operation.
If any input of the operation is +/- infinity or NaN, the result is
undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box eq_unsafe(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-615)</span>


Unsafe operation.
If any input of the operation is +/- infinity or NaN, the result is
undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box ne_unsafe(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### lt_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-624)</span>


Unsafe operation.
If any input of the operation is +/- infinity or NaN, the result is
undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box lt_unsafe(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### le_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-633)</span>


Unsafe operation.
If any input of the operation is +/- infinity or NaN, the result is
undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box le_unsafe(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### ge_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-642)</span>


Unsafe operation.
If any input of the operation is +/- infinity or NaN, the result is
undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box ge_unsafe(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### gt_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-651)</span>


Unsafe operation.
If any input of the operation is +/- infinity or NaN, the result is
undefined.
The operation isn't required to fully comply to IEEE 754 semantics.


```pony
fun box gt_unsafe(
  y: box->A)
: Bool val
```
#### Parameters

*   y: box->A

#### Returns

* [Bool](builtin-Bool.md) val

---

### abs
<span class="source-link">[[Source]](src/builtin/real.md#L-0-660)</span>


```pony
fun box abs()
: A
```

#### Returns

* A

---

### ceil
<span class="source-link">[[Source]](src/builtin/real.md#L-0-661)</span>


```pony
fun box ceil()
: A
```

#### Returns

* A

---

### floor
<span class="source-link">[[Source]](src/builtin/real.md#L-0-662)</span>


```pony
fun box floor()
: A
```

#### Returns

* A

---

### round
<span class="source-link">[[Source]](src/builtin/real.md#L-0-663)</span>


```pony
fun box round()
: A
```

#### Returns

* A

---

### trunc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-664)</span>


```pony
fun box trunc()
: A
```

#### Returns

* A

---

### finite
<span class="source-link">[[Source]](src/builtin/real.md#L-0-666)</span>


```pony
fun box finite()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### infinite
<span class="source-link">[[Source]](src/builtin/real.md#L-0-667)</span>


```pony
fun box infinite()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### nan
<span class="source-link">[[Source]](src/builtin/real.md#L-0-668)</span>


```pony
fun box nan()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### ldexp
<span class="source-link">[[Source]](src/builtin/real.md#L-0-670)</span>


```pony
fun box ldexp(
  x: A,
  exponent: I32 val)
: A
```
#### Parameters

*   x: A
*   exponent: [I32](builtin-I32.md) val

#### Returns

* A

---

### frexp
<span class="source-link">[[Source]](src/builtin/real.md#L-0-671)</span>


```pony
fun box frexp()
: (A , U32 val)
```

#### Returns

* (A , [U32](builtin-U32.md) val)

---

### log
<span class="source-link">[[Source]](src/builtin/real.md#L-0-672)</span>


```pony
fun box log()
: A
```

#### Returns

* A

---

### log2
<span class="source-link">[[Source]](src/builtin/real.md#L-0-673)</span>


```pony
fun box log2()
: A
```

#### Returns

* A

---

### log10
<span class="source-link">[[Source]](src/builtin/real.md#L-0-674)</span>


```pony
fun box log10()
: A
```

#### Returns

* A

---

### logb
<span class="source-link">[[Source]](src/builtin/real.md#L-0-675)</span>


```pony
fun box logb()
: A
```

#### Returns

* A

---

### pow
<span class="source-link">[[Source]](src/builtin/real.md#L-0-677)</span>


```pony
fun box pow(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### powi
<span class="source-link">[[Source]](src/builtin/real.md#L-0-678)</span>


```pony
fun box powi(
  y: I32 val)
: A
```
#### Parameters

*   y: [I32](builtin-I32.md) val

#### Returns

* A

---

### sqrt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-680)</span>


```pony
fun box sqrt()
: A
```

#### Returns

* A

---

### sqrt_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-682)</span>


Unsafe operation.
If this is negative, the result is undefined.


```pony
fun box sqrt_unsafe()
: A
```

#### Returns

* A

---

### cbrt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-688)</span>


```pony
fun box cbrt()
: A
```

#### Returns

* A

---

### exp
<span class="source-link">[[Source]](src/builtin/real.md#L-0-689)</span>


```pony
fun box exp()
: A
```

#### Returns

* A

---

### exp2
<span class="source-link">[[Source]](src/builtin/real.md#L-0-690)</span>


```pony
fun box exp2()
: A
```

#### Returns

* A

---

### cos
<span class="source-link">[[Source]](src/builtin/real.md#L-0-692)</span>


```pony
fun box cos()
: A
```

#### Returns

* A

---

### sin
<span class="source-link">[[Source]](src/builtin/real.md#L-0-693)</span>


```pony
fun box sin()
: A
```

#### Returns

* A

---

### tan
<span class="source-link">[[Source]](src/builtin/real.md#L-0-694)</span>


```pony
fun box tan()
: A
```

#### Returns

* A

---

### cosh
<span class="source-link">[[Source]](src/builtin/real.md#L-0-696)</span>


```pony
fun box cosh()
: A
```

#### Returns

* A

---

### sinh
<span class="source-link">[[Source]](src/builtin/real.md#L-0-697)</span>


```pony
fun box sinh()
: A
```

#### Returns

* A

---

### tanh
<span class="source-link">[[Source]](src/builtin/real.md#L-0-698)</span>


```pony
fun box tanh()
: A
```

#### Returns

* A

---

### acos
<span class="source-link">[[Source]](src/builtin/real.md#L-0-700)</span>


```pony
fun box acos()
: A
```

#### Returns

* A

---

### asin
<span class="source-link">[[Source]](src/builtin/real.md#L-0-701)</span>


```pony
fun box asin()
: A
```

#### Returns

* A

---

### atan
<span class="source-link">[[Source]](src/builtin/real.md#L-0-702)</span>


```pony
fun box atan()
: A
```

#### Returns

* A

---

### atan2
<span class="source-link">[[Source]](src/builtin/real.md#L-0-703)</span>


```pony
fun box atan2(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### acosh
<span class="source-link">[[Source]](src/builtin/real.md#L-0-705)</span>


```pony
fun box acosh()
: A
```

#### Returns

* A

---

### asinh
<span class="source-link">[[Source]](src/builtin/real.md#L-0-706)</span>


```pony
fun box asinh()
: A
```

#### Returns

* A

---

### atanh
<span class="source-link">[[Source]](src/builtin/real.md#L-0-707)</span>


```pony
fun box atanh()
: A
```

#### Returns

* A

---

### copysign
<span class="source-link">[[Source]](src/builtin/real.md#L-0-709)</span>


```pony
fun box copysign(
  sign: A)
: A
```
#### Parameters

*   sign: A

#### Returns

* A

---

### string
<span class="source-link">[[Source]](src/builtin/real.md#L-0-711)</span>


```pony
fun box string()
: String iso^
```

#### Returns

* [String](builtin-String.md) iso^

---

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

