# ANSI
<span class="source-link">[[Source]](src/term/ansi.md#L-0-1)</span>

These strings can be embedded in text when writing to a StdStream to create
a text-based UI.


```pony
primitive val ANSI
```

## Constructors

### create
<span class="source-link">[[Source]](src/term/ansi.md#L-0-1)</span>


```pony
new val create()
: ANSI val^
```

#### Returns

* [ANSI](term-ANSI.md) val^

---

## Public Functions

### up
<span class="source-link">[[Source]](src/term/ansi.md#L-0-6)</span>


Move the cursor up n lines. 0 is the same as 1.


```pony
fun box up(
  n: U32 val = 0)
: String val
```
#### Parameters

*   n: [U32](builtin-U32.md) val = 0

#### Returns

* [String](builtin-String.md) val

---

### down
<span class="source-link">[[Source]](src/term/ansi.md#L-0-16)</span>


Move the cursor down n lines. 0 is the same as 1.


```pony
fun box down(
  n: U32 val = 0)
: String val
```
#### Parameters

*   n: [U32](builtin-U32.md) val = 0

#### Returns

* [String](builtin-String.md) val

---

### right
<span class="source-link">[[Source]](src/term/ansi.md#L-0-26)</span>


Move the cursor right n columns. 0 is the same as 1.


```pony
fun box right(
  n: U32 val = 0)
: String val
```
#### Parameters

*   n: [U32](builtin-U32.md) val = 0

#### Returns

* [String](builtin-String.md) val

---

### left
<span class="source-link">[[Source]](src/term/ansi.md#L-0-36)</span>


Move the cursor left n columns. 0 is the same as 1.


```pony
fun box left(
  n: U32 val = 0)
: String val
```
#### Parameters

*   n: [U32](builtin-U32.md) val = 0

#### Returns

* [String](builtin-String.md) val

---

### cursor
<span class="source-link">[[Source]](src/term/ansi.md#L-0-46)</span>


Move the cursor to line y, column x. 0 is the same as 1. This indexes from
the top left corner of the screen.


```pony
fun box cursor(
  x: U32 val = 0,
  y: U32 val = 0)
: String val
```
#### Parameters

*   x: [U32](builtin-U32.md) val = 0
*   y: [U32](builtin-U32.md) val = 0

#### Returns

* [String](builtin-String.md) val

---

### clear
<span class="source-link">[[Source]](src/term/ansi.md#L-0-57)</span>


Clear the screen and move the cursor to the top left corner.


```pony
fun box clear()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### erase
<span class="source-link">[[Source]](src/term/ansi.md#L-0-63)</span>


Erases content. The direction to erase is dictated by the `direction`
parameter. Use `EraseLeft` to erase everything from the cursor to the
beginning of the line. Use `EraseLine` to erase the entire line. Use
`EraseRight` to erase everything from the cursor to the end of the line.
The default direction is `EraseRight`.


```pony
fun box erase(
  direction: (EraseLeft val | EraseLine val | EraseRight val) = reference)
: String val
```
#### Parameters

*   direction: ([EraseLeft](term-EraseLeft.md) val | [EraseLine](term-EraseLine.md) val | [EraseRight](term-EraseRight.md) val) = reference

#### Returns

* [String](builtin-String.md) val

---

### reset
<span class="source-link">[[Source]](src/term/ansi.md#L-0-77)</span>


Resets all colours and text styles to the default.


```pony
fun box reset()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bold
<span class="source-link">[[Source]](src/term/ansi.md#L-0-83)</span>


Bold text. Does nothing on Windows.


```pony
fun box bold(
  state: Bool val = true)
: String val
```
#### Parameters

*   state: [Bool](builtin-Bool.md) val = true

#### Returns

* [String](builtin-String.md) val

---

### underline
<span class="source-link">[[Source]](src/term/ansi.md#L-0-89)</span>


Underlined text. Does nothing on Windows.


```pony
fun box underline(
  state: Bool val = true)
: String val
```
#### Parameters

*   state: [Bool](builtin-Bool.md) val = true

#### Returns

* [String](builtin-String.md) val

---

### blink
<span class="source-link">[[Source]](src/term/ansi.md#L-0-95)</span>


Blinking text. Does nothing on Windows.


```pony
fun box blink(
  state: Bool val = true)
: String val
```
#### Parameters

*   state: [Bool](builtin-Bool.md) val = true

#### Returns

* [String](builtin-String.md) val

---

### reverse
<span class="source-link">[[Source]](src/term/ansi.md#L-0-101)</span>


Swap foreground and background colour.


```pony
fun box reverse(
  state: Bool val = true)
: String val
```
#### Parameters

*   state: [Bool](builtin-Bool.md) val = true

#### Returns

* [String](builtin-String.md) val

---

### black
<span class="source-link">[[Source]](src/term/ansi.md#L-0-107)</span>


Black text.


```pony
fun box black()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### red
<span class="source-link">[[Source]](src/term/ansi.md#L-0-113)</span>


Red text.


```pony
fun box red()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### green
<span class="source-link">[[Source]](src/term/ansi.md#L-0-119)</span>


Green text.


```pony
fun box green()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### yellow
<span class="source-link">[[Source]](src/term/ansi.md#L-0-125)</span>


Yellow text.


```pony
fun box yellow()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### blue
<span class="source-link">[[Source]](src/term/ansi.md#L-0-131)</span>


Blue text.


```pony
fun box blue()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### magenta
<span class="source-link">[[Source]](src/term/ansi.md#L-0-137)</span>


Magenta text.


```pony
fun box magenta()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### cyan
<span class="source-link">[[Source]](src/term/ansi.md#L-0-143)</span>


Cyan text.


```pony
fun box cyan()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### grey
<span class="source-link">[[Source]](src/term/ansi.md#L-0-149)</span>


Grey text.


```pony
fun box grey()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### white
<span class="source-link">[[Source]](src/term/ansi.md#L-0-155)</span>


White text.


```pony
fun box white()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_red
<span class="source-link">[[Source]](src/term/ansi.md#L-0-161)</span>


Bright red text.


```pony
fun box bright_red()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_green
<span class="source-link">[[Source]](src/term/ansi.md#L-0-167)</span>


Bright green text.


```pony
fun box bright_green()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_yellow
<span class="source-link">[[Source]](src/term/ansi.md#L-0-173)</span>


Bright yellow text.


```pony
fun box bright_yellow()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_blue
<span class="source-link">[[Source]](src/term/ansi.md#L-0-179)</span>


Bright blue text.


```pony
fun box bright_blue()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_magenta
<span class="source-link">[[Source]](src/term/ansi.md#L-0-185)</span>


Bright magenta text.


```pony
fun box bright_magenta()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_cyan
<span class="source-link">[[Source]](src/term/ansi.md#L-0-191)</span>


Bright cyan text.


```pony
fun box bright_cyan()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_grey
<span class="source-link">[[Source]](src/term/ansi.md#L-0-197)</span>


Bright grey text.


```pony
fun box bright_grey()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### black_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-203)</span>


Black background.


```pony
fun box black_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### red_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-209)</span>


Red background.


```pony
fun box red_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### green_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-215)</span>


Green background.


```pony
fun box green_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### yellow_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-221)</span>


Yellow background.


```pony
fun box yellow_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### blue_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-227)</span>


Blue background.


```pony
fun box blue_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### magenta_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-233)</span>


Magenta background.


```pony
fun box magenta_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### cyan_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-239)</span>


Cyan background.


```pony
fun box cyan_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### grey_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-245)</span>


Grey background.


```pony
fun box grey_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### white_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-251)</span>


White background.


```pony
fun box white_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_red_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-257)</span>


Bright red background.


```pony
fun box bright_red_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_green_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-263)</span>


Bright green background.


```pony
fun box bright_green_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_yellow_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-269)</span>


Bright yellow background.


```pony
fun box bright_yellow_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_blue_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-275)</span>


Bright blue background.


```pony
fun box bright_blue_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_magenta_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-281)</span>


Bright magenta background.


```pony
fun box bright_magenta_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_cyan_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-287)</span>


Bright cyan background.


```pony
fun box bright_cyan_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### bright_grey_bg
<span class="source-link">[[Source]](src/term/ansi.md#L-0-293)</span>


Bright grey background.


```pony
fun box bright_grey_bg()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/term/ansi.md#L-0-6)</span>


```pony
fun box eq(
  that: ANSI val)
: Bool val
```
#### Parameters

*   that: [ANSI](term-ANSI.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/term/ansi.md#L-0-6)</span>


```pony
fun box ne(
  that: ANSI val)
: Bool val
```
#### Parameters

*   that: [ANSI](term-ANSI.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

