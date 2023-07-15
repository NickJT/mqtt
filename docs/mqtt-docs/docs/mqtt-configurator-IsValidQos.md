# IsValidQos
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-43)</span>
```pony
primitive val IsValidQos
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-43)</span>


```pony
new val create()
: IsValidQos val^
```

#### Returns

* [IsValidQos](mqtt-configurator-IsValidQos.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-43)</span>


The subscription validator function that checks the qos field


```pony
fun box apply(
  qosString: String val)
: Bool val
```
#### Parameters

*   qosString: [String](builtin-String.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-43)</span>


```pony
fun box eq(
  that: IsValidQos val)
: Bool val
```
#### Parameters

*   that: [IsValidQos](mqtt-configurator-IsValidQos.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-43)</span>


```pony
fun box ne(
  that: IsValidQos val)
: Bool val
```
#### Parameters

*   that: [IsValidQos](mqtt-configurator-IsValidQos.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

