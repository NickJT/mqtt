# I128
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-699)</span>
```pony
primitive val I128 is
  SignedInteger[I128 val, U128 val] val
```

#### Implements

* [SignedInteger](builtin-SignedInteger.md)\[[I128](builtin-I128.md) val, [U128](builtin-U128.md) val\] val

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-700)</span>


```pony
new val create(
  value: I128 val)
: I128 val^
```
#### Parameters

*   value: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val^

---

### from\[A: (([I8](builtin-I8.md) val | [I16](builtin-I16.md) val | [I32](builtin-I32.md) val | [I64](builtin-I64.md) val | [I128](builtin-I128.md) val | [ILong](builtin-ILong.md) val | [ISize](builtin-ISize.md) val | [U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val | [F32](builtin-F32.md) val | [F64](builtin-F64.md) val) & [Real](builtin-Real.md)\[A\] val)\]
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-701)</span>


```pony
new val from[A: ((I8 val | I16 val | I32 val | 
    I64 val | I128 val | ILong val | 
    ISize val | U8 val | U16 val | 
    U32 val | U64 val | U128 val | 
    ULong val | USize val | F32 val | 
    F64 val) & Real[A] val)](
  a: A)
: I128 val^
```
#### Parameters

*   a: A

#### Returns

* [I128](builtin-I128.md) val^

---

### min_value
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-703)</span>


```pony
new val min_value()
: I128 val^
```

#### Returns

* [I128](builtin-I128.md) val^

---

### max_value
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-704)</span>


```pony
new val max_value()
: I128 val^
```

#### Returns

* [I128](builtin-I128.md) val^

---

## Public Functions

### abs
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-706)</span>


```pony
fun box abs()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### bit_reverse
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-707)</span>


```pony
fun box bit_reverse()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### bswap
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-708)</span>


```pony
fun box bswap()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### popcount
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-709)</span>


```pony
fun box popcount()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### clz
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-710)</span>


```pony
fun box clz()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### ctz
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-711)</span>


```pony
fun box ctz()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### clz_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-713)</span>


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
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-720)</span>


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
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-727)</span>


```pony
fun box bitwidth()
: U128 val
```

#### Returns

* [U128](builtin-U128.md) val

---

### bytewidth
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-729)</span>


```pony
fun box bytewidth()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### min
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-731)</span>


```pony
fun box min(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### max
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-732)</span>


```pony
fun box max(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### fld
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-734)</span>


```pony
fun box fld(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### fld_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-736)</span>


```pony
fun box fld_unsafe(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### mod
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-739)</span>


```pony
fun box mod(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### mod_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-742)</span>


```pony
fun box mod_unsafe(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### hash
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-745)</span>


```pony
fun box hash()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### hash64
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-746)</span>


```pony
fun box hash64()
: U64 val
```

#### Returns

* [U64](builtin-U64.md) val

---

### string
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-748)</span>


```pony
fun box string()
: String iso^
```

#### Returns

* [String](builtin-String.md) iso^

---

### mul
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-751)</span>


```pony
fun box mul(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### divrem
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-754)</span>


```pony
fun box divrem(
  y: I128 val)
: (I128 val , I128 val)
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [I128](builtin-I128.md) val)

---

### div
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-781)</span>


```pony
fun box div(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### rem
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-789)</span>


```pony
fun box rem(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### mul_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-797)</span>


Unsafe operation.
If the operation overflows, the result is undefined.


```pony
fun box mul_unsafe(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### divrem_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-808)</span>


Unsafe operation.
If y is 0, the result is undefined.
If the operation overflows, the result is undefined.


```pony
fun box divrem_unsafe(
  y: I128 val)
: (I128 val , I128 val)
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [I128](builtin-I128.md) val)

---

### div_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-820)</span>


Unsafe operation.
If y is 0, the result is undefined.
If the operation overflows, the result is undefined.


```pony
fun box div_unsafe(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### rem_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-832)</span>


Unsafe operation.
If y is 0, the result is undefined.
If the operation overflows, the result is undefined.


```pony
fun box rem_unsafe(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### f32
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-844)</span>


```pony
fun box f32()
: F32 val
```

#### Returns

* [F32](builtin-F32.md) val

---

### f64
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-847)</span>


```pony
fun box f64()
: F64 val
```

#### Returns

* [F64](builtin-F64.md) val

---

### f32_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-854)</span>


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
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-861)</span>


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
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-868)</span>


```pony
fun box addc(
  y: I128 val)
: (I128 val , Bool val)
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [Bool](builtin-Bool.md) val)

---

### subc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-882)</span>


```pony
fun box subc(
  y: I128 val)
: (I128 val , Bool val)
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [Bool](builtin-Bool.md) val)

---

### mulc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-896)</span>


```pony
fun box mulc(
  y: I128 val)
: (I128 val , Bool val)
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [Bool](builtin-Bool.md) val)

---

### divc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-904)</span>


```pony
fun box divc(
  y: I128 val)
: (I128 val , Bool val)
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [Bool](builtin-Bool.md) val)

---

### remc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-907)</span>


```pony
fun box remc(
  y: I128 val)
: (I128 val , Bool val)
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [Bool](builtin-Bool.md) val)

---

### fldc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-910)</span>


```pony
fun box fldc(
  y: I128 val)
: (I128 val , Bool val)
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [Bool](builtin-Bool.md) val)

---

### modc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-913)</span>


```pony
fun box modc(
  y: I128 val)
: (I128 val , Bool val)
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [Bool](builtin-Bool.md) val)

---

### add_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-916)</span>


```pony
fun box add_partial(
  y: I128 val)
: I128 val ?
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val ?

---

### sub_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-919)</span>


```pony
fun box sub_partial(
  y: I128 val)
: I128 val ?
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val ?

---

### mul_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-922)</span>


```pony
fun box mul_partial(
  y: I128 val)
: I128 val ?
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val ?

---

### div_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-925)</span>


```pony
fun box div_partial(
  y: I128 val)
: I128 val ?
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val ?

---

### rem_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-928)</span>


```pony
fun box rem_partial(
  y: I128 val)
: I128 val ?
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val ?

---

### divrem_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-931)</span>


```pony
fun box divrem_partial(
  y: I128 val)
: (I128 val , I128 val) ?
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* ([I128](builtin-I128.md) val , [I128](builtin-I128.md) val) ?

---

### fld_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-934)</span>


```pony
fun box fld_partial(
  y: I128 val)
: I128 val ?
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val ?

---

### mod_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-937)</span>


```pony
fun box mod_partial(
  y: I128 val)
: I128 val ?
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val ?

---

### shl
<span class="source-link">[[Source]](src/builtin/real.md#L-0-401)</span>


```pony
fun box shl(
  y: U128 val)
: I128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### shr
<span class="source-link">[[Source]](src/builtin/real.md#L-0-402)</span>


```pony
fun box shr(
  y: U128 val)
: I128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### shl_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-404)</span>


```pony
fun box shl_unsafe(
  y: U128 val)
: I128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### shr_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-412)</span>


```pony
fun box shr_unsafe(
  y: U128 val)
: I128 val
```
#### Parameters

*   y: [U128](builtin-U128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### add_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-214)</span>


```pony
fun box add_unsafe(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### sub_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-221)</span>


```pony
fun box sub_unsafe(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### neg_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-344)</span>


```pony
fun box neg_unsafe()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### op_and
<span class="source-link">[[Source]](src/builtin/real.md#L-0-384)</span>


```pony
fun box op_and(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### op_or
<span class="source-link">[[Source]](src/builtin/real.md#L-0-385)</span>


```pony
fun box op_or(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### op_xor
<span class="source-link">[[Source]](src/builtin/real.md#L-0-386)</span>


```pony
fun box op_xor(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### op_not
<span class="source-link">[[Source]](src/builtin/real.md#L-0-387)</span>


```pony
fun box op_not()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### add
<span class="source-link">[[Source]](src/builtin/real.md#L-0-141)</span>


```pony
fun box add(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### sub
<span class="source-link">[[Source]](src/builtin/real.md#L-0-142)</span>


```pony
fun box sub(
  y: I128 val)
: I128 val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [I128](builtin-I128.md) val

---

### neg
<span class="source-link">[[Source]](src/builtin/real.md#L-0-159)</span>


```pony
fun box neg()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

### eq
<span class="source-link">[[Source]](src/builtin/real.md#L-0-172)</span>


```pony
fun box eq(
  y: I128 val)
: Bool val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/builtin/real.md#L-0-173)</span>


```pony
fun box ne(
  y: I128 val)
: Bool val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### lt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-174)</span>


```pony
fun box lt(
  y: I128 val)
: Bool val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### le
<span class="source-link">[[Source]](src/builtin/real.md#L-0-175)</span>


```pony
fun box le(
  y: I128 val)
: Bool val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ge
<span class="source-link">[[Source]](src/builtin/real.md#L-0-176)</span>


```pony
fun box ge(
  y: I128 val)
: Bool val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### gt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-177)</span>


```pony
fun box gt(
  y: I128 val)
: Bool val
```
#### Parameters

*   y: [I128](builtin-I128.md) val

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
  that: I128 val)
: (Less val | Equal val | Greater val)
```
#### Parameters

*   that: [I128](builtin-I128.md) val

#### Returns

* ([Less](builtin-Less.md) val | [Equal](builtin-Equal.md) val | [Greater](builtin-Greater.md) val)

---

## Private Functions

### _value
<span class="source-link">[[Source]](src/builtin/real.md#L-0-211)</span>


```pony
fun box _value()
: I128 val
```

#### Returns

* [I128](builtin-I128.md) val

---

