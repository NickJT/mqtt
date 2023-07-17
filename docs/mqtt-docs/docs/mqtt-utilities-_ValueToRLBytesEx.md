# _ValueToRLBytesEx
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-322)</span>
```pony
class iso _ValueToRLBytesEx is
  UnitTest ref
```

#### Implements

* [UnitTest](pony_test-UnitTest.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-322)</span>


```pony
new iso create()
: _ValueToRLBytesEx iso^
```

#### Returns

* [_ValueToRLBytesEx](mqtt-utilities-_ValueToRLBytesEx.md) iso^

---

## Public fields

### let b: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-323)</span>



---

### let v: [USize](builtin-USize.md) val
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-324)</span>



---

## Public Functions

### name
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-325)</span>


```pony
fun box name()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-327)</span>


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

