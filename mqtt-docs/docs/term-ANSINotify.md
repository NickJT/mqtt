# ANSINotify
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-1)</span>

Receive input from an ANSITerm.


```pony
interface ref ANSINotify
```

## Public Functions

### apply
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-5)</span>


```pony
fun ref apply(
  term: ANSITerm ref,
  input: U8 val)
: None val
```
#### Parameters

*   term: [ANSITerm](term-ANSITerm.md) ref
*   input: [U8](builtin-U8.md) val

#### Returns

* [None](builtin-None.md) val

---

### up
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-8)</span>


```pony
fun ref up(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### down
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-11)</span>


```pony
fun ref down(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### left
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-14)</span>


```pony
fun ref left(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### right
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-17)</span>


```pony
fun ref right(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### delete
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-20)</span>


```pony
fun ref delete(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### insert
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-23)</span>


```pony
fun ref insert(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### home
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-26)</span>


```pony
fun ref home(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### end_key
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-29)</span>


```pony
fun ref end_key(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### page_up
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-32)</span>


```pony
fun ref page_up(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### page_down
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-35)</span>


```pony
fun ref page_down(
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### fn_key
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-38)</span>


```pony
fun ref fn_key(
  i: U8 val,
  ctrl: Bool val,
  alt: Bool val,
  shift: Bool val)
: None val
```
#### Parameters

*   i: [U8](builtin-U8.md) val
*   ctrl: [Bool](builtin-Bool.md) val
*   alt: [Bool](builtin-Bool.md) val
*   shift: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### prompt
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-41)</span>


```pony
fun ref prompt(
  term: ANSITerm ref,
  value: String val)
: None val
```
#### Parameters

*   term: [ANSITerm](term-ANSITerm.md) ref
*   value: [String](builtin-String.md) val

#### Returns

* [None](builtin-None.md) val

---

### size
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-44)</span>


```pony
fun ref size(
  rows: U16 val,
  cols: U16 val)
: None val
```
#### Parameters

*   rows: [U16](builtin-U16.md) val
*   cols: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### closed
<span class="source-link">[[Source]](src/term/ansi_notify.md#L-0-47)</span>


```pony
fun ref closed()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

