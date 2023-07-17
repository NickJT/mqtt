# _GoodPkt6
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-525)</span>

Publish id 2: $SYS/broker/load/publish/sent/1min = 12.63


```pony
class iso _GoodPkt6 is
  UnitTest ref
```

#### Implements

* [UnitTest](pony_test-UnitTest.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-525)</span>


```pony
new iso create()
: _GoodPkt6 iso^
```

#### Returns

* [_GoodPkt6](mqtt-utilities-_GoodPkt6.md) iso^

---

## Public Functions

### name
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-529)</span>


```pony
fun box name()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/tests.md#L-0-530)</span>


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

