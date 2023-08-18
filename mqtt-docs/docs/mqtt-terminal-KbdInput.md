# KbdInput
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-14)</span>

InputNotify is the outer wrapper notifier. Apply is called by env.input when data is 
available from the input stream. Apply then calls the ANSI terminal so that the data 
can be interpreted 


```pony
class ref KbdInput is
  InputNotify ref
```

#### Implements

* [InputNotify](builtin-InputNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-22)</span>


```pony
new ref create(
  env: Env val,
  ansiTerm: ANSITerm tag)
: KbdInput ref^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   ansiTerm: [ANSITerm](term-ANSITerm.md) tag

#### Returns

* [KbdInput](mqtt-terminal-KbdInput.md) ref^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-26)</span>


```pony
fun ref apply(
  data: Array[U8 val] iso)
: None val
```
#### Parameters

*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] iso

#### Returns

* [None](builtin-None.md) val

---

### dispose
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-29)</span>


```pony
fun ref dispose()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

