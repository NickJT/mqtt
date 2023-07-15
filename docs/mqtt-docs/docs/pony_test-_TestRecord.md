# _TestRecord
<span class="source-link">[[Source]](src/pony_test/_test_record.md#L-0-1)</span>

Store and report the result and log from a single test.


```pony
class ref _TestRecord
```

## Constructors

### create
<span class="source-link">[[Source]](src/pony_test/_test_record.md#L-0-11)</span>


```pony
new ref create(
  env: Env val,
  name': String val)
: _TestRecord ref^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   name': [String](builtin-String.md) val

#### Returns

* [_TestRecord](pony_test-_TestRecord.md) ref^

---

## Public fields

### let name: [String](builtin-String.md) val
<span class="source-link">[[Source]](src/pony_test/_test_record.md#L-0-7)</span>



---

## Private Functions

### _result
<span class="source-link">[[Source]](src/pony_test/_test_record.md#L-0-15)</span>


Our test has completed, store the result.


```pony
fun ref _result(
  pass: Bool val,
  log: Array[String val] val)
: None val
```
#### Parameters

*   pass: [Bool](builtin-Bool.md) val
*   log: [Array](builtin-Array.md)\[[String](builtin-String.md) val\] val

#### Returns

* [None](builtin-None.md) val

---

### _report
<span class="source-link">[[Source]](src/pony_test/_test_record.md#L-0-22)</span>


Print our test summary, including the log if appropriate.
The log_all parameter indicates whether we've been told to print logs for
all tests. The default is to only print logs for tests that fail.
Returns our pass / fail status.


```pony
fun box _report(
  log_all: Bool val)
: Bool val
```
#### Parameters

*   log_all: [Bool](builtin-Bool.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### _list_failed
<span class="source-link">[[Source]](src/pony_test/_test_record.md#L-0-50)</span>


Print our test name out in the list of failed test, if we failed.


```pony
fun box _list_failed()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

