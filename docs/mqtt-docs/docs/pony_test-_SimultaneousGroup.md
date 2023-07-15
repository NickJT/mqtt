# _SimultaneousGroup
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-51)</span>

Test group in which all tests can run concurrently.


```pony
actor tag _SimultaneousGroup is
  _Group tag
```

#### Implements

* [_Group](pony_test-_Group.md) tag

---

## Constructors

### create
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-51)</span>


```pony
new tag create()
: _SimultaneousGroup tag^
```

#### Returns

* [_SimultaneousGroup](pony_test-_SimultaneousGroup.md) tag^

---

## Public Behaviours

### apply
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-56)</span>


```pony
be apply(
  runner: _TestRunner tag)
```
#### Parameters

*   runner: [_TestRunner](pony_test-_TestRunner.md) tag

---

## Private Behaviours

### _test_complete
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-60)</span>


```pony
be _test_complete(
  runner: _TestRunner tag)
```
#### Parameters

*   runner: [_TestRunner](pony_test-_TestRunner.md) tag

---

