# _Publish3
<span class="source-link">[[Source]](src/mqtt-publisher/tests.md#L-0-53)</span>
```pony
class iso _Publish3 is
  UnitTest ref
```

#### Implements

* [UnitTest](pony_test-UnitTest.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/tests.md#L-0-53)</span>


```pony
new iso create()
: _Publish3 iso^
```

#### Returns

* [_Publish3](mqtt-publisher-_Publish3.md) iso^

---

## Public Functions

### name
<span class="source-link">[[Source]](src/mqtt-publisher/tests.md#L-0-54)</span>


```pony
fun box name()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### apply
<span class="source-link">[[Source]](src/mqtt-publisher/tests.md#L-0-55)</span>


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

