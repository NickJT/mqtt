# _Group
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-1)</span>

Test exclusion is achieved by organising tests into groups. Each group can be
exclusive, ie only one test is run at a time, or simultaneous, ie all tests
are run concurrently.


```pony
trait tag _Group
```

## Public Behaviours

### apply
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-8)</span>


Run the given test, or queue it and run later, as appropriate.


```pony
be apply(
  runner: _TestRunner tag)
```
#### Parameters

*   runner: [_TestRunner](pony_test-_TestRunner.md) tag

---

## Private Behaviours

### _test_complete
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-13)</span>


The specified test has completed.


```pony
be _test_complete(
  runner: _TestRunner tag)
```
#### Parameters

*   runner: [_TestRunner](pony_test-_TestRunner.md) tag

---

