# ToQos
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-65)</span>
```pony
primitive val ToQos
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-65)</span>


```pony
new val create()
: ToQos val^
```

#### Returns

* [ToQos](mqtt-utilities-ToQos.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-65)</span>


Takes a string and matches it against the qos patterns. Anything that
doesn't match returns QOS0 ( = 0)


```pony
fun box apply(
  stg: String val)
: (Qos0 val | Qos1 val | Qos2 val)
```
#### Parameters

*   stg: [String](builtin-String.md) val

#### Returns

* ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val)

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-65)</span>


```pony
fun box eq(
  that: ToQos val)
: Bool val
```
#### Parameters

*   that: [ToQos](mqtt-utilities-ToQos.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-65)</span>


```pony
fun box ne(
  that: ToQos val)
: Bool val
```
#### Parameters

*   that: [ToQos](mqtt-utilities-ToQos.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

