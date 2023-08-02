# Aclass
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-12)</span>

InputNotify is the outer wrapper notifier. Apply is called by env.input when data is 
available from the input stream. Apply then calls the ANSI terminal so that the data 
can be interpreted 


```pony
class ref Aclass is
  InputNotify ref
```

#### Implements

* [InputNotify](builtin-InputNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-20)</span>


```pony
new ref create(
  env: Env val,
  term: ANSITerm tag)
: Aclass ref^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   term: [ANSITerm](term-ANSITerm.md) tag

#### Returns

* [Aclass](mqtt-terminal-Aclass.md) ref^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-24)</span>


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
<span class="source-link">[[Source]](src/mqtt-terminal/handler.md#L-0-27)</span>


```pony
fun ref dispose()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

