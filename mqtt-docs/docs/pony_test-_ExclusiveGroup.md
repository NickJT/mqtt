# _ExclusiveGroup
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-18)</span>

Test group in which we only ever have one test running at a time.


```pony
actor tag _ExclusiveGroup is
  _Group tag
```

#### Implements

* [_Group](pony_test-_Group.md) tag

---

## Constructors

### create
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-18)</span>


```pony
new tag create()
: _ExclusiveGroup tag^
```

#### Returns

* [_ExclusiveGroup](pony_test-_ExclusiveGroup.md) tag^

---

## Public Behaviours

### apply
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-27)</span>


```pony
be apply(
  runner: _TestRunner tag)
```
#### Parameters

*   runner: [_TestRunner](pony_test-_TestRunner.md) tag

---

## Private Behaviours

### _test_complete
<span class="source-link">[[Source]](src/pony_test/_group.md#L-0-37)</span>


```pony
be _test_complete(
  runner: _TestRunner tag)
```
#### Parameters

*   runner: [_TestRunner](pony_test-_TestRunner.md) tag

---

