# Display
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-80)</span>
```pony
actor tag Display
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-108)</span>


```pony
new tag create(
  env: Env val)
: Display tag^
```
#### Parameters

*   env: [Env](builtin-Env.md) val

#### Returns

* [Display](mqtt-terminal-Display.md) tag^

---

## Public Behaviours

### message
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-120)</span>


```pony
be message(
  topic: String val,
  content: String val)
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   content: [String](builtin-String.md) val

---

### status
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-129)</span>


```pony
be status(
  content: String val)
```
#### Parameters

*   content: [String](builtin-String.md) val

---

### clear
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-137)</span>


```pony
be clear()
```

---

### size
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-145)</span>


Called by ANSINotify to report the cmd window size


```pony
be size(
  rows: U16 val,
  cols: U16 val)
```
#### Parameters

*   rows: [U16](builtin-U16.md) val
*   cols: [U16](builtin-U16.md) val

---

### onTick
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-151)</span>


```pony
be onTick(
  seconds: I64 val)
```
#### Parameters

*   seconds: [I64](builtin-I64.md) val

---

### onExit
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-155)</span>


```pony
be onExit(
  code: U8 val)
```
#### Parameters

*   code: [U8](builtin-U8.md) val

---

## Public Functions

### paint
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-160)</span>


```pony
fun ref paint()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### clearScreen
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-164)</span>


```pony
fun ref clearScreen()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### composite
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-168)</span>


```pony
fun ref composite()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### windowSize
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-192)</span>


```pony
fun box windowSize(
  w: U32 val,
  h: U32 val)
: String val
```
#### Parameters

*   w: [U32](builtin-U32.md) val
*   h: [U32](builtin-U32.md) val

#### Returns

* [String](builtin-String.md) val

---

### cmdString
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-195)</span>


```pony
fun box cmdString()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### boxString
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-197)</span>


```pony
fun ref boxString()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### statusString
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-210)</span>


```pony
fun ref statusString()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### separatorLine
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-219)</span>


```pony
fun box separatorLine(
  y: U32 val,
  width: U32 val)
: String val
```
#### Parameters

*   y: [U32](builtin-U32.md) val
*   width: [U32](builtin-U32.md) val

#### Returns

* [String](builtin-String.md) val

---

### separator
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-222)</span>


```pony
fun box separator(
  width: U32 val)
: String val
```
#### Parameters

*   width: [U32](builtin-U32.md) val

#### Returns

* [String](builtin-String.md) val

---

### border
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-233)</span>


```pony
fun box border(
  x: U32 val)
: String val
```
#### Parameters

*   x: [U32](builtin-U32.md) val

#### Returns

* [String](builtin-String.md) val

---

### timeout
<span class="source-link">[[Source]](src/mqtt-terminal/display.md#L-0-242)</span>


```pony
fun ref timeout(
  seconds: I64 val)
: None val
```
#### Parameters

*   seconds: [I64](builtin-I64.md) val

#### Returns

* [None](builtin-None.md) val

---

