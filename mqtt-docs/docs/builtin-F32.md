# F32
<span class="source-link">[[Source]](src/builtin/float.md#L-0-63)</span>
```pony
primitive val F32 is
  FloatingPoint[F32 val] val
```

#### Implements

* [FloatingPoint](builtin-FloatingPoint.md)\[[F32](builtin-F32.md) val\] val

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/float.md#L-0-64)</span>


```pony
new val create(
  value: F32 val = 0)
: F32 val^
```
#### Parameters

*   value: [F32](builtin-F32.md) val = 0

#### Returns

* [F32](builtin-F32.md) val^

---

### pi
<span class="source-link">[[Source]](src/builtin/float.md#L-0-65)</span>


```pony
new val pi()
: F32 val^
```

#### Returns

* [F32](builtin-F32.md) val^

---

### e
<span class="source-link">[[Source]](src/builtin/float.md#L-0-66)</span>


```pony
new val e()
: F32 val^
```

#### Returns

* [F32](builtin-F32.md) val^

---

### _nan
<span class="source-link">[[Source]](src/builtin/float.md#L-0-68)</span>


```pony
new val _nan()
: F32 val^
```

#### Returns

* [F32](builtin-F32.md) val^

---

### _inf
<span class="source-link">[[Source]](src/builtin/float.md#L-0-69)</span>


```pony
new val _inf(
  negative: Bool val)
: F32 val^
```
#### Parameters

*   negative: [Bool](builtin-Bool.md) val

#### Returns

* [F32](builtin-F32.md) val^

---

### from_bits
<span class="source-link">[[Source]](src/builtin/float.md#L-0-71)</span>


```pony
new val from_bits(
  i: U32 val)
: F32 val^
```
#### Parameters

*   i: [U32](builtin-U32.md) val

#### Returns

* [F32](builtin-F32.md) val^

---

### from\[B: (([I8](builtin-I8.md) val | [I16](builtin-I16.md) val | [I32](builtin-I32.md) val | [I64](builtin-I64.md) val | [I128](builtin-I128.md) val | [ILong](builtin-ILong.md) val | [ISize](builtin-ISize.md) val | [U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val | [F32](builtin-F32.md) val | [F64](builtin-F64.md) val) & [Real](builtin-Real.md)\[B\] val)\]
<span class="source-link">[[Source]](src/builtin/float.md#L-0-73)</span>


```pony
new val from[B: ((I8 val | I16 val | I32 val | 
    I64 val | I128 val | ILong val | 
    ISize val | U8 val | U16 val | 
    U32 val | U64 val | U128 val | 
    ULong val | USize val | F32 val | 
    F64 val) & Real[B] val)](
  a: B)
: F32 val^
```
#### Parameters

*   a: B

#### Returns

* [F32](builtin-F32.md) val^

---

### min_value
<span class="source-link">[[Source]](src/builtin/float.md#L-0-75)</span>


Minimum negative value representable.


```pony
new val min_value()
: F32 val^
```

#### Returns

* [F32](builtin-F32.md) val^

---

### max_value
<span class="source-link">[[Source]](src/builtin/float.md#L-0-81)</span>


Maximum positive value representable.


```pony
new val max_value()
: F32 val^
```

#### Returns

* [F32](builtin-F32.md) val^

---

### min_normalised
<span class="source-link">[[Source]](src/builtin/float.md#L-0-87)</span>


Minimum positive value representable at full precision (ie a normalised
number).


```pony
new val min_normalised()
: F32 val^
```

#### Returns

* [F32](builtin-F32.md) val^

---

### epsilon
<span class="source-link">[[Source]](src/builtin/float.md#L-0-94)</span>


Minimum positive value such that (1 + epsilon) != 1.


```pony
new val epsilon()
: F32 val^
```

#### Returns

* [F32](builtin-F32.md) val^

---

## Public Functions

### bits
<span class="source-link">[[Source]](src/builtin/float.md#L-0-72)</span>


```pony
fun box bits()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### radix
<span class="source-link">[[Source]](src/builtin/float.md#L-0-100)</span>


Exponent radix.


```pony
fun tag radix()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### precision2
<span class="source-link">[[Source]](src/builtin/float.md#L-0-106)</span>


Mantissa precision in bits.


```pony
fun tag precision2()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### precision10
<span class="source-link">[[Source]](src/builtin/float.md#L-0-112)</span>


Mantissa precision in decimal digits.


```pony
fun tag precision10()
: U8 val
```

#### Returns

* [U8](builtin-U8.md) val

---

### min_exp2
<span class="source-link">[[Source]](src/builtin/float.md#L-0-118)</span>


Minimum exponent value such that (2^exponent) - 1 is representable at full
precision (ie a normalised number).


```pony
fun tag min_exp2()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### min_exp10
<span class="source-link">[[Source]](src/builtin/float.md#L-0-125)</span>


Minimum exponent value such that (10^exponent) - 1 is representable at full
precision (ie a normalised number).


```pony
fun tag min_exp10()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### max_exp2
<span class="source-link">[[Source]](src/builtin/float.md#L-0-132)</span>


Maximum exponent value such that (2^exponent) - 1 is representable.


```pony
fun tag max_exp2()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### max_exp10
<span class="source-link">[[Source]](src/builtin/float.md#L-0-138)</span>


Maximum exponent value such that (10^exponent) - 1 is representable.


```pony
fun tag max_exp10()
: I16 val
```

#### Returns

* [I16](builtin-I16.md) val

---

### abs
<span class="source-link">[[Source]](src/builtin/float.md#L-0-144)</span>


```pony
fun box abs()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### ceil
<span class="source-link">[[Source]](src/builtin/float.md#L-0-145)</span>


```pony
fun box ceil()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### floor
<span class="source-link">[[Source]](src/builtin/float.md#L-0-146)</span>


```pony
fun box floor()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### round
<span class="source-link">[[Source]](src/builtin/float.md#L-0-147)</span>


```pony
fun box round()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### trunc
<span class="source-link">[[Source]](src/builtin/float.md#L-0-148)</span>


```pony
fun box trunc()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### min
<span class="source-link">[[Source]](src/builtin/float.md#L-0-150)</span>


```pony
fun box min(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### max
<span class="source-link">[[Source]](src/builtin/float.md#L-0-151)</span>


```pony
fun box max(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### fld
<span class="source-link">[[Source]](src/builtin/float.md#L-0-153)</span>


```pony
fun box fld(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### fld_unsafe
<span class="source-link">[[Source]](src/builtin/float.md#L-0-156)</span>


```pony
fun box fld_unsafe(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### mod
<span class="source-link">[[Source]](src/builtin/float.md#L-0-159)</span>


```pony
fun box mod(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### mod_unsafe
<span class="source-link">[[Source]](src/builtin/float.md#L-0-169)</span>


```pony
fun box mod_unsafe(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### finite
<span class="source-link">[[Source]](src/builtin/float.md#L-0-179)</span>


Check whether this number is finite, ie not +/-infinity and not NaN.


```pony
fun box finite()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### infinite
<span class="source-link">[[Source]](src/builtin/float.md#L-0-186)</span>


Check whether this number is +/-infinity


```pony
fun box infinite()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### nan
<span class="source-link">[[Source]](src/builtin/float.md#L-0-194)</span>


Check whether this number is NaN.


```pony
fun box nan()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### ldexp
<span class="source-link">[[Source]](src/builtin/float.md#L-0-202)</span>


```pony
fun box ldexp(
  x: F32 val,
  exponent: I32 val)
: F32 val
```
#### Parameters

*   x: [F32](builtin-F32.md) val
*   exponent: [I32](builtin-I32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### frexp
<span class="source-link">[[Source]](src/builtin/float.md#L-0-205)</span>


```pony
fun box frexp()
: (F32 val , U32 val)
```

#### Returns

* ([F32](builtin-F32.md) val , [U32](builtin-U32.md) val)

---

### log
<span class="source-link">[[Source]](src/builtin/float.md#L-0-210)</span>


```pony
fun box log()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### log2
<span class="source-link">[[Source]](src/builtin/float.md#L-0-211)</span>


```pony
fun box log2()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### log10
<span class="source-link">[[Source]](src/builtin/float.md#L-0-212)</span>


```pony
fun box log10()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### logb
<span class="source-link">[[Source]](src/builtin/float.md#L-0-213)</span>


```pony
fun box logb()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### pow
<span class="source-link">[[Source]](src/builtin/float.md#L-0-215)</span>


```pony
fun box pow(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### powi
<span class="source-link">[[Source]](src/builtin/float.md#L-0-216)</span>


```pony
fun box powi(
  y: I32 val)
: F32 val
```
#### Parameters

*   y: [I32](builtin-I32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### sqrt
<span class="source-link">[[Source]](src/builtin/float.md#L-0-223)</span>


```pony
fun box sqrt()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### sqrt_unsafe
<span class="source-link">[[Source]](src/builtin/float.md#L-0-230)</span>


Unsafe operation.
If this is negative, the result is undefined.


```pony
fun box sqrt_unsafe()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### cbrt
<span class="source-link">[[Source]](src/builtin/float.md#L-0-237)</span>


```pony
fun box cbrt()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### exp
<span class="source-link">[[Source]](src/builtin/float.md#L-0-238)</span>


```pony
fun box exp()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### exp2
<span class="source-link">[[Source]](src/builtin/float.md#L-0-239)</span>


```pony
fun box exp2()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### cos
<span class="source-link">[[Source]](src/builtin/float.md#L-0-241)</span>


```pony
fun box cos()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### sin
<span class="source-link">[[Source]](src/builtin/float.md#L-0-242)</span>


```pony
fun box sin()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### tan
<span class="source-link">[[Source]](src/builtin/float.md#L-0-243)</span>


```pony
fun box tan()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### cosh
<span class="source-link">[[Source]](src/builtin/float.md#L-0-245)</span>


```pony
fun box cosh()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### sinh
<span class="source-link">[[Source]](src/builtin/float.md#L-0-246)</span>


```pony
fun box sinh()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### tanh
<span class="source-link">[[Source]](src/builtin/float.md#L-0-247)</span>


```pony
fun box tanh()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### acos
<span class="source-link">[[Source]](src/builtin/float.md#L-0-249)</span>


```pony
fun box acos()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### asin
<span class="source-link">[[Source]](src/builtin/float.md#L-0-250)</span>


```pony
fun box asin()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### atan
<span class="source-link">[[Source]](src/builtin/float.md#L-0-251)</span>


```pony
fun box atan()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### atan2
<span class="source-link">[[Source]](src/builtin/float.md#L-0-252)</span>


```pony
fun box atan2(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### acosh
<span class="source-link">[[Source]](src/builtin/float.md#L-0-254)</span>


```pony
fun box acosh()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### asinh
<span class="source-link">[[Source]](src/builtin/float.md#L-0-255)</span>


```pony
fun box asinh()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### atanh
<span class="source-link">[[Source]](src/builtin/float.md#L-0-256)</span>


```pony
fun box atanh()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### copysign
<span class="source-link">[[Source]](src/builtin/float.md#L-0-258)</span>


```pony
fun box copysign(
  sign: F32 val)
: F32 val
```
#### Parameters

*   sign: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### hash
<span class="source-link">[[Source]](src/builtin/float.md#L-0-260)</span>


```pony
fun box hash()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### hash64
<span class="source-link">[[Source]](src/builtin/float.md#L-0-261)</span>


```pony
fun box hash64()
: U64 val
```

#### Returns

* [U64](builtin-U64.md) val

---

### i128
<span class="source-link">[[Source]](src/builtin/float.md#L-0-263)</span>


```pony
fun box i128()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### u128
<span class="source-link">[[Source]](src/builtin/float.md#L-0-264)</span>


```pony
fun box u128()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### i128_unsafe
<span class="source-link">[[Source]](src/builtin/float.md#L-0-266)</span>


Unsafe operation.
If the value doesn't fit in the destination type, the result is undefined.


```pony
fun box i128_unsafe()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### u128_unsafe
<span class="source-link">[[Source]](src/builtin/float.md#L-0-273)</span>


Unsafe operation.
If the value doesn't fit in the destination type, the result is undefined.


```pony
fun box u128_unsafe()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### add_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-527)</span>


```pony
fun box add_unsafe(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### sub_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-536)</span>


```pony
fun box sub_unsafe(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### mul_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-545)</span>


```pony
fun box mul_unsafe(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### div_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-554)</span>


```pony
fun box div_unsafe(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### divrem_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-571)</span>


```pony
fun box divrem_unsafe(
  y: F32 val)
: (F32 val , F32 val)
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* ([F32](builtin-F32.md) val , [F32](builtin-F32.md) val)

---

### rem_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-580)</span>


```pony
fun box rem_unsafe(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### neg_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-597)</span>


```pony
fun box neg_unsafe()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### eq_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-606)</span>


```pony
fun box eq_unsafe(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-615)</span>


```pony
fun box ne_unsafe(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### lt_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-624)</span>


```pony
fun box lt_unsafe(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### le_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-633)</span>


```pony
fun box le_unsafe(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ge_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-642)</span>


```pony
fun box ge_unsafe(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### gt_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-651)</span>


```pony
fun box gt_unsafe(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

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
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### sub
<span class="source-link">[[Source]](src/builtin/real.md#L-0-142)</span>


```pony
fun box sub(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### mul
<span class="source-link">[[Source]](src/builtin/real.md#L-0-143)</span>


```pony
fun box mul(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### div
<span class="source-link">[[Source]](src/builtin/real.md#L-0-144)</span>


```pony
fun box div(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### divrem
<span class="source-link">[[Source]](src/builtin/real.md#L-0-150)</span>


```pony
fun box divrem(
  y: F32 val)
: (F32 val , F32 val)
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* ([F32](builtin-F32.md) val , [F32](builtin-F32.md) val)

---

### rem
<span class="source-link">[[Source]](src/builtin/real.md#L-0-151)</span>


```pony
fun box rem(
  y: F32 val)
: F32 val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [F32](builtin-F32.md) val

---

### neg
<span class="source-link">[[Source]](src/builtin/real.md#L-0-159)</span>


```pony
fun box neg()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### eq
<span class="source-link">[[Source]](src/builtin/real.md#L-0-172)</span>


```pony
fun box eq(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/builtin/real.md#L-0-173)</span>


```pony
fun box ne(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### lt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-174)</span>


```pony
fun box lt(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### le
<span class="source-link">[[Source]](src/builtin/real.md#L-0-175)</span>


```pony
fun box le(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ge
<span class="source-link">[[Source]](src/builtin/real.md#L-0-176)</span>


```pony
fun box ge(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### gt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-177)</span>


```pony
fun box gt(
  y: F32 val)
: Bool val
```
#### Parameters

*   y: [F32](builtin-F32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

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
  that: F32 val)
: (Less val | Equal val | Greater val)
```
#### Parameters

*   that: [F32](builtin-F32.md) val

#### Returns

* ([Less](builtin-Less.md) val | [Equal](builtin-Equal.md) val | [Greater](builtin-Greater.md) val)

---

## Private Functions

### _value
<span class="source-link">[[Source]](src/builtin/real.md#L-0-211)</span>


```pony
fun box _value()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

