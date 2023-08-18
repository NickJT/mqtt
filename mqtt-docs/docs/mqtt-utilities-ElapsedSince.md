# ElapsedSince
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-39)</span>
```pony
primitive val ElapsedSince
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-39)</span>


```pony
new val create()
: ElapsedSince val^
```

#### Returns

* [ElapsedSince](mqtt-utilities-ElapsedSince.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-39)</span>


Content in the form of String val = 2023:08:05 10:57:00 [123456789:123456789]
s is seconds
ns is nanoseconds

returns String val = elpased seconds:elpased nanoseconds


```pony
fun box apply(
  sFinish: I64 val,
  nsFinish: I64 val,
  start: String val)
: String val
```
#### Parameters

*   sFinish: [I64](builtin-I64.md) val
*   nsFinish: [I64](builtin-I64.md) val
*   start: [String](builtin-String.md) val

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-39)</span>


```pony
fun box eq(
  that: ElapsedSince val)
: Bool val
```
#### Parameters

*   that: [ElapsedSince](mqtt-utilities-ElapsedSince.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-39)</span>


```pony
fun box ne(
  that: ElapsedSince val)
: Bool val
```
#### Parameters

*   that: [ElapsedSince](mqtt-utilities-ElapsedSince.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

