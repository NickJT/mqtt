# Main
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-48)</span>
```pony
actor tag Main
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-63)</span>


```pony
new tag create(
  env: Env val)
: Main tag^
```
#### Parameters

*   env: [Env](builtin-Env.md) val

#### Returns

* [Main](mqtt-Main.md) tag^

---

## Public Behaviours

### onExit
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-111)</span>


Only called when we are exiting the program and all of the actors need to
be cleanly terminated


```pony
be onExit(
  code: U8 val)
```
#### Parameters

*   code: [U8](builtin-U8.md) val

---

## Public Functions

### cleanup
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-120)</span>


```pony
fun ref cleanup()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### runtime_override_defaults
<span class="source-link">[[Source]](src/mqtt/main.md#L-0-48)</span>


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

