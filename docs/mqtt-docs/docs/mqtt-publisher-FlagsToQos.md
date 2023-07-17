# FlagsToQos
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-3)</span>
```pony
primitive val FlagsToQos
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-3)</span>


```pony
new val create()
: FlagsToQos val^
```

#### Returns

* [FlagsToQos](mqtt-publisher-FlagsToQos.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-3)</span>


Takes an unmasked control byte and extracts the Qos from bits 1 and 2.
Return QoS0 for invalid flags
TODO - Combine with above once we have all the use cases surfaced


```pony
fun box apply(
  value: U8 val)
: (Qos0 val | Qos1 val | Qos2 val)
```
#### Parameters

*   value: [U8](builtin-U8.md) val

#### Returns

* ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val)

---

### eq
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-3)</span>


```pony
fun box eq(
  that: FlagsToQos val)
: Bool val
```
#### Parameters

*   that: [FlagsToQos](mqtt-publisher-FlagsToQos.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-publisher/flagFunctions.md#L-0-3)</span>


```pony
fun box ne(
  that: FlagsToQos val)
: Bool val
```
#### Parameters

*   that: [FlagsToQos](mqtt-publisher-FlagsToQos.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

