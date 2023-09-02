# TerminalColour
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-3)</span>
```pony
primitive val TerminalColour
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-3)</span>


```pony
new val create()
: TerminalColour val^
```

#### Returns

* [TerminalColour](mqtt-terminal-TerminalColour.md) val^

---

## Public Functions

### border
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-4)</span>


```pony
fun box border()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### separator
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-5)</span>


```pony
fun box separator()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### cmd
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-6)</span>


```pony
fun box cmd()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### boxDormant
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-7)</span>


```pony
fun box boxDormant()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### boxNormal
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-8)</span>


```pony
fun box boxNormal()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### boxChange
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-9)</span>


```pony
fun box boxChange()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### status
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-10)</span>


```pony
fun box status()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-4)</span>


```pony
fun box eq(
  that: TerminalColour val)
: Bool val
```
#### Parameters

*   that: [TerminalColour](mqtt-terminal-TerminalColour.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-terminal/colours.md#L-0-4)</span>


```pony
fun box ne(
  that: TerminalColour val)
: Bool val
```
#### Parameters

*   that: [TerminalColour](mqtt-terminal-TerminalColour.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

