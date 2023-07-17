# _OKMini
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-104)</span>
```pony
class iso _OKMini is
  UnitTest ref
```

#### Implements

* [UnitTest](pony_test-UnitTest.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-104)</span>


```pony
new iso create()
: _OKMini iso^
```

#### Returns

* [_OKMini](mqtt-configurator-_OKMini.md) iso^

---

## Public Functions

### name
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-105)</span>


```pony
fun box name()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### apply
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-106)</span>


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

