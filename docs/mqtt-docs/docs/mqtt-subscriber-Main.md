# Main
<span class="source-link">[[Source]](src/mqtt-subscriber/tests.md#L-0-8)</span>
```pony
actor tag Main is
  TestList ref
```

#### Implements

* [TestList](pony_test-TestList.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-subscriber/tests.md#L-0-10)</span>


```pony
new tag create(
  env: Env val)
: Main tag^
```
#### Parameters

*   env: [Env](builtin-Env.md) val

#### Returns

* [Main](mqtt-subscriber-Main.md) tag^

---

### make
<span class="source-link">[[Source]](src/mqtt-subscriber/tests.md#L-0-13)</span>


```pony
new tag make()
: Main tag^
```

#### Returns

* [Main](mqtt-subscriber-Main.md) tag^

---

## Public Functions

### tests
<span class="source-link">[[Source]](src/mqtt-subscriber/tests.md#L-0-16)</span>


```pony
fun tag tests(
  test: PonyTest tag)
: None val
```
#### Parameters

*   test: [PonyTest](pony_test-PonyTest.md) tag

#### Returns

* [None](builtin-None.md) val

---

### runtime_override_defaults
<span class="source-link">[[Source]](src/mqtt-subscriber/tests.md#L-0-8)</span>


```pony
fun runtime_override_defaults(
  rto: RuntimeOptions ref)
: None val
```
#### Parameters

*   rto: [RuntimeOptions](builtin-RuntimeOptions.md) ref

#### Returns

* [None](builtin-None.md) val

---

