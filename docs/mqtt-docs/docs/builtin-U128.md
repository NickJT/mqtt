# U128
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-624)</span>
```pony
primitive val U128 is
  UnsignedInteger[U128 val] val
```

#### Implements

* [UnsignedInteger](builtin-UnsignedInteger.md)\[[U128](builtin-U128.md) val\] val

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-625)</span>


```pony
new val create(
  value: U128 val)
: U128 val^
```
#### Parameters

*   value: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val^

---

### from\[A: (([I8](builtin-I8.md) val | [I16](builtin-I16.md) val | [I32](builtin-I32.md) val | [I64](builtin-I64.md) val | [I128](builtin-I128.md) val | [ILong](builtin-ILong.md) val | [ISize](builtin-ISize.md) val | [U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val | [F32](builtin-F32.md) val | [F64](builtin-F64.md) val) & [Real](builtin-Real.md)\[A\] val)\]
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-626)</span>


```pony
new val from[A: ((I8 val | I16 val | I32 val | 
    I64 val | I128 val | ILong val | 
    ISize val | U8 val | U16 val | 
    U32 val | U64 val | U128 val | 
    ULong val | USize val | F32 val | 
    F64 val) & Real[A] val)](
  a: A)
: U128 val^
```
#### Parameters

*   a: A

#### Returns

* [U128](builtin-U128.md) val^

---

### min_value
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-628)</span>


```pony
new val min_value()
: U128 val^
```

#### Returns

* [U128](builtin-U128.md) val^

---

### max_value
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-629)</span>


```pony
new val max_value()
: U128 val^
```

#### Returns

* [U128](builtin-U128.md) val^

---

## Public Functions

### next_pow2
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-631)</span>


```pony
fun box next_pow2()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### abs
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-635)</span>


```pony
fun box abs()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### bit_reverse
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-636)</span>


```pony
fun box bit_reverse()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### bswap
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-637)</span>


```pony
fun box bswap()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### popcount
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-638)</span>


```pony
fun box popcount()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### clz
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-639)</span>


```pony
fun box clz()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### ctz
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-640)</span>


```pony
fun box ctz()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### clz_unsafe
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-642)</span>


Unsafe operation.
If this is 0, the result is undefined.


```pony
fun box clz_unsafe()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### ctz_unsafe
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-649)</span>


Unsafe operation.
If this is 0, the result is undefined.


```pony
fun box ctz_unsafe()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### bitwidth
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-656)</span>


```pony
fun box bitwidth()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### bytewidth
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-658)</span>


```pony
fun box bytewidth()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### min
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-660)</span>


```pony
fun box min(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### max
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-661)</span>


```pony
fun box max(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### hash
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-663)</span>


```pony
fun box hash()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### hash64
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-673)</span>


```pony
fun box hash64()
: U64 val
```

#### Returns

* [U64](builtin-U64.md) val

---

### string
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-676)</span>


```pony
fun box string()
: String iso^
```

#### Returns

* [String](builtin-String.md) iso^

---

### mul
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-679)</span>


```pony
fun box mul(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### divrem
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-708)</span>


```pony
fun box divrem(
  y: U128 val)
: (U128 val , U128 val)
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [U128](builtin-U128.md) val)

---

### div
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-738)</span>


```pony
fun box div(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### rem
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-746)</span>


```pony
fun box rem(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### mul_unsafe
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-754)</span>


Unsafe operation.
If the operation overflows, the result is undefined.


```pony
fun box mul_unsafe(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### divrem_unsafe
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-765)</span>


Unsafe operation.
If y is 0, the result is undefined.
If the operation overflows, the result is undefined.


```pony
fun box divrem_unsafe(
  y: U128 val)
: (U128 val , U128 val)
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [U128](builtin-U128.md) val)

---

### div_unsafe
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-777)</span>


Unsafe operation.
If y is 0, the result is undefined.
If the operation overflows, the result is undefined.


```pony
fun box div_unsafe(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### rem_unsafe
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-789)</span>


Unsafe operation.
If y is 0, the result is undefined.
If the operation overflows, the result is undefined.


```pony
fun box rem_unsafe(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### f32
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-801)</span>


```pony
fun box f32()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### f64
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-809)</span>


```pony
fun box f64()
: F64 val
```

#### Returns

* [F64](builtin-F64.md) val

---

### f32_unsafe
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-843)</span>


Unsafe operation.
If the value doesn't fit in the destination type, the result is undefined.


```pony
fun box f32_unsafe()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### f64_unsafe
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-850)</span>


Unsafe operation.
If the value doesn't fit in the destination type, the result is undefined.


```pony
fun box f64_unsafe()
: F64 val
```

#### Returns

* [F64](builtin-F64.md) val

---

### addc
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-857)</span>


```pony
fun box addc(
  y: U128 val)
: (U128 val , Bool val)
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [Bool](builtin-Bool.md) val)

---

### subc
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-865)</span>


```pony
fun box subc(
  y: U128 val)
: (U128 val , Bool val)
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [Bool](builtin-Bool.md) val)

---

### mulc
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-873)</span>


```pony
fun box mulc(
  y: U128 val)
: (U128 val , Bool val)
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [Bool](builtin-Bool.md) val)

---

### divc
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-882)</span>


```pony
fun box divc(
  y: U128 val)
: (U128 val , Bool val)
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [Bool](builtin-Bool.md) val)

---

### remc
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-885)</span>


```pony
fun box remc(
  y: U128 val)
: (U128 val , Bool val)
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [Bool](builtin-Bool.md) val)

---

### add_partial
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-888)</span>


```pony
fun box add_partial(
  y: U128 val)
: U128 val ?
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val ?

---

### sub_partial
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-891)</span>


```pony
fun box sub_partial(
  y: U128 val)
: U128 val ?
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val ?

---

### mul_partial
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-894)</span>


```pony
fun box mul_partial(
  y: U128 val)
: U128 val ?
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val ?

---

### div_partial
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-897)</span>


```pony
fun box div_partial(
  y: U128 val)
: U128 val ?
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val ?

---

### rem_partial
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-900)</span>


```pony
fun box rem_partial(
  y: U128 val)
: U128 val ?
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val ?

---

### divrem_partial
<span class="source-link">[[Source]](src/builtin/unsigned.md#L-0-903)</span>


```pony
fun box divrem_partial(
  y: U128 val)
: (U128 val , U128 val) ?
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [U128](builtin-U128.md) val) ?

---

### shl
<span class="source-link">[[Source]](src/builtin/real.md#L-0-445)</span>


```pony
fun box shl(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### shr
<span class="source-link">[[Source]](src/builtin/real.md#L-0-446)</span>


```pony
fun box shr(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### fld
<span class="source-link">[[Source]](src/builtin/real.md#L-0-449)</span>


```pony
fun box fld(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### fldc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-450)</span>


```pony
fun box fldc(
  y: U128 val)
: (U128 val , Bool val)
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [Bool](builtin-Bool.md) val)

---

### fld_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-451)</span>


```pony
fun box fld_partial(
  y: U128 val)
: U128 val ?
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val ?

---

### fld_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-452)</span>


```pony
fun box fld_unsafe(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### mod
<span class="source-link">[[Source]](src/builtin/real.md#L-0-454)</span>


```pony
fun box mod(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### modc
<span class="source-link">[[Source]](src/builtin/real.md#L-0-455)</span>


```pony
fun box modc(
  y: U128 val)
: (U128 val , Bool val)
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* ([U128](builtin-U128.md) val , [Bool](builtin-Bool.md) val)

---

### mod_partial
<span class="source-link">[[Source]](src/builtin/real.md#L-0-456)</span>


```pony
fun box mod_partial(
  y: U128 val)
: U128 val ?
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val ?

---

### mod_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-457)</span>


```pony
fun box mod_unsafe(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### shl_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-459)</span>


```pony
fun box shl_unsafe(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### shr_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-466)</span>


```pony
fun box shr_unsafe(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### rotl
<span class="source-link">[[Source]](src/builtin/real.md#L-0-473)</span>


```pony
fun box rotl(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### rotr
<span class="source-link">[[Source]](src/builtin/real.md#L-0-481)</span>


```pony
fun box rotr(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### add_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-214)</span>


```pony
fun box add_unsafe(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### sub_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-221)</span>


```pony
fun box sub_unsafe(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### neg_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-344)</span>


```pony
fun box neg_unsafe()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### op_and
<span class="source-link">[[Source]](src/builtin/real.md#L-0-384)</span>


```pony
fun box op_and(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### op_or
<span class="source-link">[[Source]](src/builtin/real.md#L-0-385)</span>


```pony
fun box op_or(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### op_xor
<span class="source-link">[[Source]](src/builtin/real.md#L-0-386)</span>


```pony
fun box op_xor(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### op_not
<span class="source-link">[[Source]](src/builtin/real.md#L-0-387)</span>


```pony
fun box op_not()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### add
<span class="source-link">[[Source]](src/builtin/real.md#L-0-141)</span>


```pony
fun box add(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### sub
<span class="source-link">[[Source]](src/builtin/real.md#L-0-142)</span>


```pony
fun box sub(
  y: U128 val)
: U128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [U128](builtin-U128.md) val

---

### neg
<span class="source-link">[[Source]](src/builtin/real.md#L-0-159)</span>


```pony
fun box neg()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### eq
<span class="source-link">[[Source]](src/builtin/real.md#L-0-172)</span>


```pony
fun box eq(
  y: U128 val)
: Bool val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/builtin/real.md#L-0-173)</span>


```pony
fun box ne(
  y: U128 val)
: Bool val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### lt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-174)</span>


```pony
fun box lt(
  y: U128 val)
: Bool val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### le
<span class="source-link">[[Source]](src/builtin/real.md#L-0-175)</span>


```pony
fun box le(
  y: U128 val)
: Bool val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ge
<span class="source-link">[[Source]](src/builtin/real.md#L-0-176)</span>


```pony
fun box ge(
  y: U128 val)
: Bool val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### gt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-177)</span>


```pony
fun box gt(
  y: U128 val)
: Bool val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

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

### compare
<span class="source-link">[[Source]](src/builtin/compare.md#L-0-28)</span>


```pony
fun box compare(
  that: U128 val)
: (Less val | Equal val | Greater val)
```
#### Parameters

*   that: [U128](builtin-U128.md) val

#### Returns

* ([Less](builtin-Less.md) val | [Equal](builtin-Equal.md) val | [Greater](builtin-Greater.md) val)

---

## Private Functions

### _value
<span class="source-link">[[Source]](src/builtin/real.md#L-0-211)</span>


```pony
fun box _value()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

