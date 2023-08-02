# Handler
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-31)</span>

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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-41)</span>


```pony
new ref create(
  env: Env val,
  reg: Registrar tag,
  exitCall: {(U8)} iso)
: Handler ref^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   exitCall: {(U8)} iso

#### Returns

* [Handler](mqtt-terminal-Handler.md) ref^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-46)</span>


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

### fn_key
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-54)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-74)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-79)</span>


```pony
fun ref close()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### dispose
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-83)</span>


```pony
fun ref dispose()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### prompt
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-87)</span>


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

### home
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-90)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-93)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-96)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-99)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-102)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-105)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-108)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-111)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-114)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-117)</span>


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

