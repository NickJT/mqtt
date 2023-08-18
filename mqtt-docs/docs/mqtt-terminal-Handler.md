# Handler
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-33)</span>

ANSINotify is the inner wrapper notifier. Apply is called by the ANSITerm when input
is available. Closed is called when the window is closed.


```pony
class ref Handler is
  ANSINotify ref
```

#### Implements

* [ANSINotify](term-ANSINotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-42)</span>


```pony
new ref create(
  env: Env val,
  terminal: Terminal tag)
: Handler ref^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   terminal: [Terminal](mqtt-terminal-Terminal.md) tag

#### Returns

* [Handler](mqtt-terminal-Handler.md) ref^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-46)</span>


```pony
fun ref apply(
  ansiTerm: ANSITerm ref,
  input: U8 val)
: None val
```
#### Parameters

*   ansiTerm: [ANSITerm](term-ANSITerm.md) ref
*   input: [U8](builtin-U8.md) val

#### Returns

* [None](builtin-None.md) val

---

### fn_key
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-50)</span>


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

### size
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-62)</span>


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

### close
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-67)</span>


```pony
fun ref close()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### prompt
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-72)</span>


```pony
fun ref prompt(
  ansiTerm: ANSITerm ref,
  value: String val)
: None val
```
#### Parameters

*   ansiTerm: [ANSITerm](term-ANSITerm.md) ref
*   value: [String](builtin-String.md) val

#### Returns

* [None](builtin-None.md) val

---

### home
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-75)</span>


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

### up
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-78)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-81)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-84)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-87)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-90)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-93)</span>


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

### end_key
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-96)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-99)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-102)</span>


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

### closed



```pony
fun ref closed()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

