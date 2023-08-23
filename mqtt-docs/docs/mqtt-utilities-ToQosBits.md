# ToQosBits
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-81)</span>
```pony
primitive val ToQosBits
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-81)</span>


```pony
new val create()
: ToQosBits val^
```

#### Returns

* [ToQosBits](mqtt-utilities-ToQosBits.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-81)</span>


Returns the bit pattern for the passed Qos


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
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-81)</span>


```pony
fun box eq(
  that: ToQosBits val)
: Bool val
```
#### Parameters

*   that: [ToQosBits](mqtt-utilities-ToQosBits.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-81)</span>


```pony
fun box ne(
  that: ToQosBits val)
: Bool val
```
#### Parameters

*   that: [ToQosBits](mqtt-utilities-ToQosBits.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

