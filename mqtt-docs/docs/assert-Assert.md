# Assert
<span class="source-link">[[Source]](src/assert/assert.md#L-0-12)</span>

This is a debug only assertion. If the test is false, it will print any
supplied error message to stderr and raise an error.


```pony
primitive val Assert
```

## Constructors

### create
<span class="source-link">[[Source]](src/assert/assert.md#L-0-12)</span>


```pony
new val create()
: Assert val^
```

#### Returns

* [Assert](assert-Assert.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/assert/assert.md#L-0-17)</span>


```pony
fun box apply(
  test: Bool val,
  msg: String val = "")
: None val ?
```
#### Parameters

*   test: [Bool](builtin-Bool.md) val
*   msg: [String](builtin-String.md) val = ""

#### Returns

* [None](builtin-None.md) val ?

---

### eq
<span class="source-link">[[Source]](src/assert/assert.md#L-0-17)</span>


```pony
fun box eq(
  that: Assert val)
: Bool val
```
#### Parameters

*   that: [Assert](assert-Assert.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/assert/assert.md#L-0-17)</span>


```pony
fun box ne(
  that: Assert val)
: Bool val
```
#### Parameters

*   that: [Assert](assert-Assert.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

