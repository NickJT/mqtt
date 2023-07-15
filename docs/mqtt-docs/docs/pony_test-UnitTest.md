# UnitTest
<span class="source-link">[[Source]](src/pony_test/unit_test.md#L-0-1)</span>

Each unit test class must provide this trait. Simple tests only need to
define the name() and apply() functions. The remaining functions specify
additional test options.


```pony
trait ref UnitTest
```

## Public Functions

### name
<span class="source-link">[[Source]](src/pony_test/unit_test.md#L-0-8)</span>


Report the test name, which is used when printing test results and on the
command line to select tests to run.


```pony
fun box name()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### exclusion_group
<span class="source-link">[[Source]](src/pony_test/unit_test.md#L-0-14)</span>


Report the test exclusion group, returning an empty string for none.
The default body returns an empty string.


```pony
fun box exclusion_group()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### apply
<span class="source-link">[[Source]](src/pony_test/unit_test.md#L-0-21)</span>


Run the test.
Raising an error is interpreted as a test failure.


```pony
fun ref apply(
  h: TestHelper val)
: None val ?
```
#### Parameters

*   h: [TestHelper](pony_test-TestHelper.md) val

#### Returns

* [None](builtin-None.md) val ?

---

### timed_out
<span class="source-link">[[Source]](src/pony_test/unit_test.md#L-0-27)</span>


Tear down a possibly hanging test.
Called when the timeout specified by to long_test() expires.
There is no need for this function to call complete(false).
tear_down() will still be called after this completes.
The default is to do nothing.


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
<span class="source-link">[[Source]](src/pony_test/unit_test.md#L-0-37)</span>


Set up the testing environment before a test method is called.
Default is to do nothing.


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
<span class="source-link">[[Source]](src/pony_test/unit_test.md#L-0-44)</span>


Tidy up after the test has completed.
Called for each run test, whether that test passed, succeeded or timed out.
The default is to do nothing.


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
<span class="source-link">[[Source]](src/pony_test/unit_test.md#L-0-52)</span>


Report the test label, returning an empty string for none.
It can be later use to filter tests which we want to run, by labels.


```pony
fun box label()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

