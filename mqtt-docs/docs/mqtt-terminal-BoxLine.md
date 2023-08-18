# BoxLine
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-34)</span>
```pony
class ref BoxLine
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-42)</span>


```pony
new ref create(
  topic: String val,
  content': String val)
: BoxLine ref^
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   content': [String](builtin-String.md) val

#### Returns

* [BoxLine](mqtt-terminal-BoxLine.md) ref^

---

## Public Functions

### paint
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-48)</span>


```pony
fun box paint()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### deadline
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-49)</span>


```pony
fun ref deadline(
  seconds: I64 val)
: None val
```
#### Parameters

*   seconds: [I64](builtin-I64.md) val

#### Returns

* [None](builtin-None.md) val

---

### update
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-55)</span>


```pony
fun ref update(
  content': String val)
: None val
```
#### Parameters

*   content': [String](builtin-String.md) val

#### Returns

* [None](builtin-None.md) val

---

### ansi
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-71)</span>


```pony
fun ref ansi(
  left: U32 val,
  right: U32 val,
  y: U32 val)
: String val
```
#### Parameters

*   left: [U32](builtin-U32.md) val
*   right: [U32](builtin-U32.md) val
*   y: [U32](builtin-U32.md) val

#### Returns

* [String](builtin-String.md) val

---

