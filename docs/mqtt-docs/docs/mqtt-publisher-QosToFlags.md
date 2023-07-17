# QosToFlags
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-16)</span>
```pony
primitive val QosToFlags
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-16)</span>


```pony
new val create()
: QosToFlags val^
```

#### Returns

* [QosToFlags](mqtt-publisher-QosToFlags.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-16)</span>


Take a Qos and return the Qos flags for bits 1 and 2 of the 
Publish Packet
Note - Combine with above once we have all the use cases surfaced


```pony
fun box apply(
  q: (Qos0 val | Qos1 val | Qos2 val))
: U8 val
```
#### Parameters

*   q: ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val)

#### Returns

* [U8](builtin-U8.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-16)</span>


```pony
fun box eq(
  that: QosToFlags val)
: Bool val
```
#### Parameters

*   that: [QosToFlags](mqtt-publisher-QosToFlags.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-16)</span>


```pony
fun box ne(
  that: QosToFlags val)
: Bool val
```
#### Parameters

*   that: [QosToFlags](mqtt-publisher-QosToFlags.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

