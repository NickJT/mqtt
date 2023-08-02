# StatusLine
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-16)</span>
```pony
class ref StatusLine
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-20)</span>


```pony
new ref create(
  content': String val)
: StatusLine ref^
```
#### Parameters

*   content': [String](builtin-String.md) val

#### Returns

* [StatusLine](mqtt-terminal-StatusLine.md) ref^

---

## Public Functions

### paint
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-24)</span>


```pony
fun box paint()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### ansi
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-26)</span>


```pony
fun box ansi(
  left: U32 val,
  y: U32 val)
: String val
```
#### Parameters

*   left: [U32](builtin-U32.md) val
*   y: [U32](builtin-U32.md) val

#### Returns

* [String](builtin-String.md) val

---

### string
<span class="source-link">[[Source]](src/mqtt-terminal/terminal.md#L-0-30)</span>


```pony
fun box string()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

