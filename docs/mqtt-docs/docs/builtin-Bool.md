# Bool
<span class="source-link">[[Source]](src/builtin/bool.md#L-0-1)</span>
```pony
primitive val Bool is
  Stringable box
```

#### Implements

* [Stringable](builtin-Stringable.md) box

---

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/bool.md#L-0-2)</span>


```pony
new val create(
  from: Bool val)
: Bool val^
```
#### Parameters

*   from: [Bool](builtin-Bool.md) val

#### Returns

* [Bool](builtin-Bool.md) val^

---

## Public Functions

### eq
<span class="source-link">[[Source]](src/builtin/bool.md#L-0-4)</span>


```pony
fun box eq(
  y: Bool val)
: Bool val
```
#### Parameters

*   y: [Bool](builtin-Bool.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/builtin/bool.md#L-0-5)</span>


```pony
fun box ne(
  y: Bool val)
: Bool val
```
#### Parameters

*   y: [Bool](builtin-Bool.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### op_and
<span class="source-link">[[Source]](src/builtin/bool.md#L-0-6)</span>


```pony
fun box op_and(
  y: Bool val)
: Bool val
```
#### Parameters

*   y: [Bool](builtin-Bool.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### op_or
<span class="source-link">[[Source]](src/builtin/bool.md#L-0-7)</span>


```pony
fun box op_or(
  y: Bool val)
: Bool val
```
#### Parameters

*   y: [Bool](builtin-Bool.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### op_xor
<span class="source-link">[[Source]](src/builtin/bool.md#L-0-8)</span>


```pony
fun box op_xor(
  y: Bool val)
: Bool val
```
#### Parameters

*   y: [Bool](builtin-Bool.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### op_not
<span class="source-link">[[Source]](src/builtin/bool.md#L-0-9)</span>


```pony
fun box op_not()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### string
<span class="source-link">[[Source]](src/builtin/bool.md#L-0-11)</span>


```pony
fun box string()
: String iso^
```

#### Returns

* [String](builtin-String.md) iso^

---

