# SignedInteger\[A: [SignedInteger](builtin-SignedInteger.md)\[A, B\] val, B: [UnsignedInteger](builtin-UnsignedInteger.md)\[B\] val\]
<span class="source-link">[[Source]](src/builtin/real.md#L-0-397)</span>
```pony
trait val SignedInteger[A: SignedInteger[A, B] val, B: UnsignedInteger[B] val] is
  Integer[A] val
```

#### Implements

* [Integer](builtin-Integer.md)\[A\] val

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

### abs
<span class="source-link">[[Source]](src/builtin/real.md#L-0-399)</span>


```pony
fun box abs()
: B
```

#### Returns

* B

---

### shl
<span class="source-link">[[Source]](src/builtin/real.md#L-0-401)</span>


```pony
fun box shl(
  y: B)
: A
```
#### Parameters

*   y: B

#### Returns

* A

---

### shr
<span class="source-link">[[Source]](src/builtin/real.md#L-0-402)</span>


```pony
fun box shr(
  y: B)
: A
```
#### Parameters

*   y: B

#### Returns

* A

---

### shl_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-404)</span>


Unsafe operation.
If bits differing from the final sign bit are shifted-out, the result is
undefined.


```pony
fun box shl_unsafe(
  y: B)
: A
```
#### Parameters

*   y: B

#### Returns

* A

---

### shr_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-412)</span>


Unsafe operation.
If non-zero bits are shifted-out, the result is undefined.


```pony
fun box shr_unsafe(
  y: B)
: A
```
#### Parameters

*   y: B

#### Returns

* A

---

### popcount
<span class="source-link">[[Source]](src/builtin/real.md#L-0-419)</span>


```pony
fun box popcount()
: B
```

#### Returns

* B

---

### clz
<span class="source-link">[[Source]](src/builtin/real.md#L-0-420)</span>


```pony
fun box clz()
: B
```

#### Returns

* B

---

### ctz
<span class="source-link">[[Source]](src/builtin/real.md#L-0-421)</span>


```pony
fun box ctz()
: B
```

#### Returns

* B

---

### clz_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-423)</span>


Unsafe operation.
If this is 0, the result is undefined.


```pony
fun box clz_unsafe()
: B
```

#### Returns

* B

---

### ctz_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-429)</span>


Unsafe operation.
If this is 0, the result is undefined.


```pony
fun box ctz_unsafe()
: B
```

#### Returns

* B

---

### bitwidth
<span class="source-link">[[Source]](src/builtin/real.md#L-0-435)</span>


```pony
fun box bitwidth()
: B
```

#### Returns

* B

---

### bytewidth
<span class="source-link">[[Source]](src/builtin/real.md#L-0-437)</span>


```pony
fun box bytewidth()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### string
<span class="source-link">[[Source]](src/builtin/real.md#L-0-439)</span>


```pony
fun box string()
: String iso^
```

#### Returns

* [String](builtin-String.md) iso^

---

### add_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-214)</span>


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
<span class="source-link">[[Source]](src/builtin/real.md#L-0-221)</span>


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
<span class="source-link">[[Source]](src/builtin/real.md#L-0-228)</span>


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
<span class="source-link">[[Source]](src/builtin/real.md#L-0-235)</span>


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

### divrem_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-245)</span>


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
<span class="source-link">[[Source]](src/builtin/real.md#L-0-255)</span>


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

### fld_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-265)</span>


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

### mod_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-276)</span>


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

### add_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-286)</span>


```pony
fun box add_partial(
  y: A)
: A ?
```
#### Parameters

*   y: A

#### Returns

* A ?

---

### sub_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-293)</span>


```pony
fun box sub_partial(
  y: A)
: A ?
```
#### Parameters

*   y: A

#### Returns

* A ?

---

### mul_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-300)</span>


```pony
fun box mul_partial(
  y: A)
: A ?
```
#### Parameters

*   y: A

#### Returns

* A ?

---

### div_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-307)</span>


```pony
fun box div_partial(
  y: A)
: A ?
```
#### Parameters

*   y: A

#### Returns

* A ?

---

### rem_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-314)</span>


```pony
fun box rem_partial(
  y: A)
: A ?
```
#### Parameters

*   y: A

#### Returns

* A ?

---

### divrem_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-322)</span>


```pony
fun box divrem_partial(
  y: A)
: (A , A) ?
```
#### Parameters

*   y: A

#### Returns

* (A , A) ?

---

### fld_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-329)</span>


```pony
fun box fld_partial(
  y: A)
: A ?
```
#### Parameters

*   y: A

#### Returns

* A ?

---

### mod_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-336)</span>


```pony
fun box mod_partial(
  y: A)
: A ?
```
#### Parameters

*   y: A

#### Returns

* A ?

---

### neg_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-344)</span>


```pony
fun box neg_unsafe()
: A
```

#### Returns

* A

---

### addc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-351)</span>


```pony
fun box addc(
  y: A)
: (A , Bool val)
```
#### Parameters

*   y: A

#### Returns

* (A , [Bool](builtin-Bool.md) val)

---

### subc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-355)</span>


```pony
fun box subc(
  y: A)
: (A , Bool val)
```
#### Parameters

*   y: A

#### Returns

* (A , [Bool](builtin-Bool.md) val)

---

### mulc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-359)</span>


```pony
fun box mulc(
  y: A)
: (A , Bool val)
```
#### Parameters

*   y: A

#### Returns

* (A , [Bool](builtin-Bool.md) val)

---

### divc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-363)</span>


```pony
fun box divc(
  y: A)
: (A , Bool val)
```
#### Parameters

*   y: A

#### Returns

* (A , [Bool](builtin-Bool.md) val)

---

### remc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-367)</span>


```pony
fun box remc(
  y: A)
: (A , Bool val)
```
#### Parameters

*   y: A

#### Returns

* (A , [Bool](builtin-Bool.md) val)

---

### fldc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-373)</span>


```pony
fun box fldc(
  y: A)
: (A , Bool val)
```
#### Parameters

*   y: A

#### Returns

* (A , [Bool](builtin-Bool.md) val)

---

### modc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-377)</span>


```pony
fun box modc(
  y: A)
: (A , Bool val)
```
#### Parameters

*   y: A

#### Returns

* (A , [Bool](builtin-Bool.md) val)

---

### op_and
<span class="source-link">[[Source]](src/builtin/real.md#L-0-384)</span>


```pony
fun box op_and(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### op_or
<span class="source-link">[[Source]](src/builtin/real.md#L-0-385)</span>


```pony
fun box op_or(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### op_xor
<span class="source-link">[[Source]](src/builtin/real.md#L-0-386)</span>


```pony
fun box op_xor(
  y: A)
: A
```
#### Parameters

*   y: A

#### Returns

* A

---

### op_not
<span class="source-link">[[Source]](src/builtin/real.md#L-0-387)</span>


```pony
fun box op_not()
: A
```

#### Returns

* A

---

### bit_reverse
<span class="source-link">[[Source]](src/builtin/real.md#L-0-389)</span>


```pony
fun box bit_reverse()
: A
```

#### Returns

* A

---

### bswap
<span class="source-link">[[Source]](src/builtin/real.md#L-0-395)</span>


```pony
fun box bswap()
: A
```

#### Returns

* A

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

