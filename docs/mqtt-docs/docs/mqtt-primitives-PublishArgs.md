# PublishArgs
<span class="source-link">[[Source]](src/mqtt-primitives/publishArgs.md#L-0-2)</span>

A simple class to enable a set of args for a publish behaviour to be grouped 
and stored in an array


```pony
class ref PublishArgs
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/publishArgs.md#L-0-14)</span>


```pony
new val create(
  topic': String val,
  payload': Array[U8 val] val,
  qos': (Qos0 val | Qos1 val | Qos2 val) = reference,
  d': Bool val = false,
  r': Bool val = false,
  cid': U16 val = 0)
: PublishArgs val^
```
#### Parameters

*   topic': [String](builtin-String.md) val
*   payload': [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val
*   qos': ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val) = reference
*   d': [Bool](builtin-Bool.md) val = false
*   r': [Bool](builtin-Bool.md) val = false
*   cid': [U16](builtin-U16.md) val = 0

#### Returns

* [PublishArgs](mqtt-primitives-PublishArgs.md) val^

---

### createWithId
<span class="source-link">[[Source]](src/mqtt-primitives/publishArgs.md#L-0-29)</span>


```pony
new val createWithId(
  args: PublishArgs val,
  newId: U16 val)
: PublishArgs val^
```
#### Parameters

*   args: [PublishArgs](mqtt-primitives-PublishArgs.md) val
*   newId: [U16](builtin-U16.md) val

#### Returns

* [PublishArgs](mqtt-primitives-PublishArgs.md) val^

---

## Public fields

### var cid: [U16](builtin-U16.md) val
<span class="source-link">[[Source]](src/mqtt-primitives/publishArgs.md#L-0-7)</span>



---

### let topic: [String](builtin-String.md) val
<span class="source-link">[[Source]](src/mqtt-primitives/publishArgs.md#L-0-8)</span>



---

### let payload: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val
<span class="source-link">[[Source]](src/mqtt-primitives/publishArgs.md#L-0-9)</span>



---

### let qos: ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val)
<span class="source-link">[[Source]](src/mqtt-primitives/publishArgs.md#L-0-10)</span>



---

### let retain: [Bool](builtin-Bool.md) val
<span class="source-link">[[Source]](src/mqtt-primitives/publishArgs.md#L-0-11)</span>



---

### let dup: [Bool](builtin-Bool.md) val
<span class="source-link">[[Source]](src/mqtt-primitives/publishArgs.md#L-0-12)</span>



---

