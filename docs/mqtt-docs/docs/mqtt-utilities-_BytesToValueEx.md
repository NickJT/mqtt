# _BytesToValueEx
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-221)</span>
```pony
class iso _BytesToValueEx is
  UnitTest ref
```

#### Implements

* [UnitTest](pony_test-UnitTest.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-221)</span>


```pony
new iso create()
: _BytesToValueEx iso^
```

#### Returns

* [_BytesToValueEx](mqtt-utilities-_BytesToValueEx.md) iso^

---

## Public fields

### let b: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-222)</span>



---

### let v: [U32](builtin-U32.md) val
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-223)</span>



---

## Public Functions

### name
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-224)</span>


```pony
fun box name()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-225)</span>


```pony
fun box apply(
  h: TestHelper val)
: None val
```
#### Parameters

*   h: [TestHelper](pony_test-TestHelper.md) val

#### Returns

* [None](builtin-None.md) val

---

### exclusion_group



```pony
fun box exclusion_group()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### timed_out



```pony
fun ref timed_out(
  h: TestHelper val)
: None val
```
#### Parameters

*   h: [TestHelper](pony_test-TestHelper.md) val

#### Returns

* [None](builtin-None.md) val

---

### set_up



```pony
fun ref set_up(
  h: TestHelper val)
: None val ?
```
#### Parameters

*   h: [TestHelper](pony_test-TestHelper.md) val

#### Returns

* [None](builtin-None.md) val ?

---

### tear_down



```pony
fun ref tear_down(
  h: TestHelper val)
: None val
```
#### Parameters

*   h: [TestHelper](pony_test-TestHelper.md) val

#### Returns

* [None](builtin-None.md) val

---

### label



```pony
fun box label()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

