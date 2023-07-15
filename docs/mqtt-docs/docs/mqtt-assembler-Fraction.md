# Fraction
<span class="source-link">[[Source]](src/mqtt-assembler/tests.md#L-0-19)</span>
```pony
primitive val Fraction
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-assembler/tests.md#L-0-19)</span>


```pony
new val create()
: Fraction val^
```

#### Returns

* [Fraction](mqtt-assembler-Fraction.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-assembler/tests.md#L-0-19)</span>


```pony
fun box apply()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-assembler/tests.md#L-0-19)</span>


```pony
fun box eq(
  that: Fraction val)
: Bool val
```
#### Parameters

*   that: [Fraction](mqtt-assembler-Fraction.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-assembler/tests.md#L-0-19)</span>


```pony
fun box ne(
  that: Fraction val)
: Bool val
```
#### Parameters

*   that: [Fraction](mqtt-assembler-Fraction.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

