# Handler
<span class="source-link">[[Source]](src/mqtt/handler.md#L-0-6)</span>
```pony
class ref Handler is
  ReadlineNotify ref
```

#### Implements

* [ReadlineNotify](term-ReadlineNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt/handler.md#L-0-17)</span>


```pony
new ref create(
  env: Env val)
: Handler ref^
```
#### Parameters

*   env: [Env](builtin-Env.md) val

#### Returns

* [Handler](mqtt-Handler.md) ref^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt/handler.md#L-0-28)</span>


If quit was entered then terminate by rejecting the promise otherwise, update the 
prompt and add the line to the command buffer


```pony
fun ref apply(
  line: String val,
  prompt: Promise[String val] tag)
: None val
```
#### Parameters

*   line: [String](builtin-String.md) val
*   prompt: [Promise](promises-Promise.md)\[[String](builtin-String.md) val\] tag

#### Returns

* [None](builtin-None.md) val

---

### process
<span class="source-link">[[Source]](src/mqtt/handler.md#L-0-43)</span>


```pony
fun ref process(
  line: String val)
: None val
```
#### Parameters

*   line: [String](builtin-String.md) val

#### Returns

* [None](builtin-None.md) val

---

### splash
<span class="source-link">[[Source]](src/mqtt/handler.md#L-0-58)</span>


```pony
fun box splash(
  stg: String val)
: None val
```
#### Parameters

*   stg: [String](builtin-String.md) val

#### Returns

* [None](builtin-None.md) val

---

### tab
<span class="source-link">[[Source]](src/mqtt/handler.md#L-0-80)</span>


If tab is entered then return all the commands that have the same prefix
as the line entered before the tab


```pony
fun ref tab(
  line: String val)
: Seq[String val] box
```
#### Parameters

*   line: [String](builtin-String.md) val

#### Returns

* [Seq](builtin-Seq.md)\[[String](builtin-String.md) val\] box

---

## Private Functions

### _update_commands
<span class="source-link">[[Source]](src/mqtt/handler.md#L-0-67)</span>


if line (the last string passed) is a substring of a command already in the 
command buffer then return without adding it, else add the line to the command buffer/
This gives a history of commands entered


```pony
fun ref _update_commands(
  line: String val)
: None val
```
#### Parameters

*   line: [String](builtin-String.md) val

#### Returns

* [None](builtin-None.md) val

---

