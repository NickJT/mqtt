# U8ToQos
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-95)</span>
```pony
primitive val U8ToQos
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-95)</span>


```pony
new val create()
: U8ToQos val^
```

#### Returns

* [U8ToQos](mqtt-utilities-U8ToQos.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-95)</span>


Take a U8 and returns a Qos type from QoS0 to QoS2. Returns None for
any other value


```pony
fun box apply(
  value: U8 val)
: (Qos0 val | Qos1 val | Qos2 val | 
    None val)
```
#### Parameters

*   value: [U8](builtin-U8.md) val

#### Returns

* ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val | 
    [None](builtin-None.md) val)

---

### eq
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-95)</span>


```pony
fun box eq(
  that: U8ToQos val)
: Bool val
```
#### Parameters

*   that: [U8ToQos](mqtt-utilities-U8ToQos.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-utilities/functions.md#L-0-95)</span>


```pony
fun box ne(
  that: U8ToQos val)
: Bool val
```
#### Parameters

*   that: [U8ToQos](mqtt-utilities-U8ToQos.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

