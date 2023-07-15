# ILong
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-387)</span>
```pony
primitive val ILong is
  SignedInteger[ILong val, ULong val] val
```

#### Implements

* [SignedInteger](builtin-SignedInteger.md)\[[ILong](builtin-ILong.md) val, [ULong](builtin-ULong.md) val\] val

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-388)</span>


```pony
new val create(
  value: ILong val)
: ILong val^
```
#### Parameters

*   value: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val^

---

### from\[A: (([I8](builtin-I8.md) val | [I16](builtin-I16.md) val | [I32](builtin-I32.md) val | [I64](builtin-I64.md) val | [I128](builtin-I128.md) val | [ILong](builtin-ILong.md) val | [ISize](builtin-ISize.md) val | [U8](builtin-U8.md) val | [U16](builtin-U16.md) val | [U32](builtin-U32.md) val | [U64](builtin-U64.md) val | [U128](builtin-U128.md) val | [ULong](builtin-ULong.md) val | [USize](builtin-USize.md) val | [F32](builtin-F32.md) val | [F64](builtin-F64.md) val) & [Real](builtin-Real.md)\[A\] val)\]
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-389)</span>


```pony
new val from[A: ((I8 val | I16 val | I32 val | 
    I64 val | I128 val | ILong val | 
    ISize val | U8 val | U16 val | 
    U32 val | U64 val | U128 val | 
    ULong val | USize val | F32 val | 
    F64 val) & Real[A] val)](
  a: A)
: ILong val^
```
#### Parameters

*   a: A

#### Returns

* [ILong](builtin-ILong.md) val^

---

### min_value
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-391)</span>


```pony
new val min_value()
: ILong val^
```

#### Returns

* [ILong](builtin-ILong.md) val^

---

### max_value
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-398)</span>


```pony
new val max_value()
: ILong val^
```

#### Returns

* [ILong](builtin-ILong.md) val^

---

## Public Functions

### abs
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-405)</span>


```pony
fun box abs()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### bit_reverse
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-407)</span>


```pony
fun box bit_reverse()
: ILong val
```

#### Returns

* [ILong](builtin-ILong.md) val

---

### bswap
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-414)</span>


```pony
fun box bswap()
: ILong val
```

#### Returns

* [ILong](builtin-ILong.md) val

---

### popcount
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-421)</span>


```pony
fun box popcount()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### clz
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-428)</span>


```pony
fun box clz()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### ctz
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-435)</span>


```pony
fun box ctz()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### clz_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-442)</span>


```pony
fun box clz_unsafe()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### ctz_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-449)</span>


```pony
fun box ctz_unsafe()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### bitwidth
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-456)</span>


```pony
fun box bitwidth()
: ULong val
```

#### Returns

* [ULong](builtin-ULong.md) val

---

### bytewidth
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-458)</span>


```pony
fun box bytewidth()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### min
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-460)</span>


```pony
fun box min(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### max
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-461)</span>


```pony
fun box max(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### fld
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-463)</span>


```pony
fun box fld(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### fld_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-466)</span>


```pony
fun box fld_unsafe(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### mod
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-469)</span>


```pony
fun box mod(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### mod_unsafe
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-472)</span>


```pony
fun box mod_unsafe(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### hash
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-475)</span>


```pony
fun box hash()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### addc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-477)</span>


```pony
fun box addc(
  y: ILong val)
: (ILong val , Bool val)
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [Bool](builtin-Bool.md) val)

---

### subc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-488)</span>


```pony
fun box subc(
  y: ILong val)
: (ILong val , Bool val)
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [Bool](builtin-Bool.md) val)

---

### mulc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-499)</span>


```pony
fun box mulc(
  y: ILong val)
: (ILong val , Bool val)
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [Bool](builtin-Bool.md) val)

---

### divc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-508)</span>


```pony
fun box divc(
  y: ILong val)
: (ILong val , Bool val)
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [Bool](builtin-Bool.md) val)

---

### remc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-511)</span>


```pony
fun box remc(
  y: ILong val)
: (ILong val , Bool val)
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [Bool](builtin-Bool.md) val)

---

### fldc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-514)</span>


```pony
fun box fldc(
  y: ILong val)
: (ILong val , Bool val)
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [Bool](builtin-Bool.md) val)

---

### modc
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-517)</span>


```pony
fun box modc(
  y: ILong val)
: (ILong val , Bool val)
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [Bool](builtin-Bool.md) val)

---

### add_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-520)</span>


```pony
fun box add_partial(
  y: ILong val)
: ILong val ?
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val ?

---

### sub_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-523)</span>


```pony
fun box sub_partial(
  y: ILong val)
: ILong val ?
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val ?

---

### mul_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-526)</span>


```pony
fun box mul_partial(
  y: ILong val)
: ILong val ?
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val ?

---

### div_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-529)</span>


```pony
fun box div_partial(
  y: ILong val)
: ILong val ?
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val ?

---

### rem_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-532)</span>


```pony
fun box rem_partial(
  y: ILong val)
: ILong val ?
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val ?

---

### divrem_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-535)</span>


```pony
fun box divrem_partial(
  y: ILong val)
: (ILong val , ILong val) ?
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [ILong](builtin-ILong.md) val) ?

---

### fld_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-538)</span>


```pony
fun box fld_partial(
  y: ILong val)
: ILong val ?
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val ?

---

### mod_partial
<span class="source-link">[[Source]](src/builtin/signed.md#L-0-541)</span>


```pony
fun box mod_partial(
  y: ILong val)
: ILong val ?
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val ?

---

### shl
<span class="source-link">[[Source]](src/builtin/real.md#L-0-401)</span>


```pony
fun box shl(
  y: ULong val)
: ILong val
```
#### Parameters

*   y: [ULong](builtin-ULong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### shr
<span class="source-link">[[Source]](src/builtin/real.md#L-0-402)</span>


```pony
fun box shr(
  y: ULong val)
: ILong val
```
#### Parameters

*   y: [ULong](builtin-ULong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### shl_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-404)</span>


```pony
fun box shl_unsafe(
  y: ULong val)
: ILong val
```
#### Parameters

*   y: [ULong](builtin-ULong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### shr_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-412)</span>


```pony
fun box shr_unsafe(
  y: ULong val)
: ILong val
```
#### Parameters

*   y: [ULong](builtin-ULong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

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
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### sub_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-221)</span>


```pony
fun box sub_unsafe(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### mul_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-228)</span>


```pony
fun box mul_unsafe(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### div_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-235)</span>


```pony
fun box div_unsafe(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### divrem_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-245)</span>


```pony
fun box divrem_unsafe(
  y: ILong val)
: (ILong val , ILong val)
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [ILong](builtin-ILong.md) val)

---

### rem_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-255)</span>


```pony
fun box rem_unsafe(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### neg_unsafe
<span class="source-link">[[Source]](src/builtin/real.md#L-0-344)</span>


```pony
fun box neg_unsafe()
: ILong val
```

#### Returns

* [ILong](builtin-ILong.md) val

---

### op_and
<span class="source-link">[[Source]](src/builtin/real.md#L-0-384)</span>


```pony
fun box op_and(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### op_or
<span class="source-link">[[Source]](src/builtin/real.md#L-0-385)</span>


```pony
fun box op_or(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### op_xor
<span class="source-link">[[Source]](src/builtin/real.md#L-0-386)</span>


```pony
fun box op_xor(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### op_not
<span class="source-link">[[Source]](src/builtin/real.md#L-0-387)</span>


```pony
fun box op_not()
: ILong val
```

#### Returns

* [ILong](builtin-ILong.md) val

---

### add
<span class="source-link">[[Source]](src/builtin/real.md#L-0-141)</span>


```pony
fun box add(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### sub
<span class="source-link">[[Source]](src/builtin/real.md#L-0-142)</span>


```pony
fun box sub(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### mul
<span class="source-link">[[Source]](src/builtin/real.md#L-0-143)</span>


```pony
fun box mul(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### div
<span class="source-link">[[Source]](src/builtin/real.md#L-0-144)</span>


```pony
fun box div(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### divrem
<span class="source-link">[[Source]](src/builtin/real.md#L-0-150)</span>


```pony
fun box divrem(
  y: ILong val)
: (ILong val , ILong val)
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* ([ILong](builtin-ILong.md) val , [ILong](builtin-ILong.md) val)

---

### rem
<span class="source-link">[[Source]](src/builtin/real.md#L-0-151)</span>


```pony
fun box rem(
  y: ILong val)
: ILong val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [ILong](builtin-ILong.md) val

---

### neg
<span class="source-link">[[Source]](src/builtin/real.md#L-0-159)</span>


```pony
fun box neg()
: ILong val
```

#### Returns

* [ILong](builtin-ILong.md) val

---

### eq
<span class="source-link">[[Source]](src/builtin/real.md#L-0-172)</span>


```pony
fun box eq(
  y: ILong val)
: Bool val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/builtin/real.md#L-0-173)</span>


```pony
fun box ne(
  y: ILong val)
: Bool val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### lt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-174)</span>


```pony
fun box lt(
  y: ILong val)
: Bool val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### le
<span class="source-link">[[Source]](src/builtin/real.md#L-0-175)</span>


```pony
fun box le(
  y: ILong val)
: Bool val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ge
<span class="source-link">[[Source]](src/builtin/real.md#L-0-176)</span>


```pony
fun box ge(
  y: ILong val)
: Bool val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### gt
<span class="source-link">[[Source]](src/builtin/real.md#L-0-177)</span>


```pony
fun box gt(
  y: ILong val)
: Bool val
```
#### Parameters

*   y: [ILong](builtin-ILong.md) val

#### Returns

* [Bool](builtin-Bool.md) val

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
  that: ILong val)
: (Less val | Equal val | Greater val)
```
#### Parameters

*   that: [ILong](builtin-ILong.md) val

#### Returns

* ([Less](builtin-Less.md) val | [Equal](builtin-Equal.md) val | [Greater](builtin-Greater.md) val)

---

## Private Functions

### _value
<span class="source-link">[[Source]](src/builtin/real.md#L-0-211)</span>


```pony
fun box _value()
: ILong val
```

#### Returns

* [ILong](builtin-ILong.md) val

---

