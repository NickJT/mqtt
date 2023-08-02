# IniReader
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-145)</span>

Called once for each line in the .ini file. Currently written to terminate on the first error.
Uses primitive SupportedQos to determine whether subscriptions are valild


```pony
class ref IniReader is
  IniNotify ref
```

#### Implements

* [IniNotify](ini-IniNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-159)</span>


```pony
new ref create(
  params: Array[String val] val)
: IniReader ref^
```
#### Parameters

*   params: [Array](builtin-Array.md)\[[String](builtin-String.md) val\] val

#### Returns

* [IniReader](mqtt-configurator-IniReader.md) ref^

---

## Public Functions

### getConfig
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-170)</span>


Destructive read on new (unpopulated) map should return the old (populated) map
but I can't get this to work, so resorting to copying


```pony
fun box getConfig()
: HashMap[String val, String val, HashEq[String val] val] val
```

#### Returns

* [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

---

### getSubs
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-182)</span>


Destructive read on new (unpopulated) map should return the old (populated) map


```pony
fun box getSubs()
: HashMap[String val, String val, HashEq[String val] val] val
```

#### Returns

* [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

---

### apply
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-193)</span>


```pony
fun ref apply(
  section: String val,
  key: String val,
  value: String val)
: Bool val
```
#### Parameters

*   section: [String](builtin-String.md) val
*   key: [String](builtin-String.md) val
*   value: [String](builtin-String.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### add_section
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-244)</span>


Part of the interface but we don't need it here


```pony
fun box add_section(
  section: String val)
: Bool val
```
#### Parameters

*   section: [String](builtin-String.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### errors
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-252)</span>


This is called for each error encountered. Returns false to halt processing.


```pony
fun ref errors(
  line: USize val,
  err: (IniIncompleteSection val | IniNoDelimiter val))
: Bool val
```
#### Parameters

*   line: [USize](builtin-USize.md) val
*   err: ([IniIncompleteSection](ini-IniIncompleteSection.md) val | [IniNoDelimiter](ini-IniNoDelimiter.md) val)

#### Returns

* [Bool](builtin-Bool.md) val

---

## Private Functions

### _isValidParam
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-226)</span>


The validator for parameters. Checks that the key is in our list of 
key strings and that the value is a non-empty string


```pony
fun box _isValidParam(
  p: String val,
  v: String val)
: Bool val
```
#### Parameters

*   p: [String](builtin-String.md) val
*   v: [String](builtin-String.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### _isValidSub
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-235)</span>


The subscription validator function that checks a topic of a topic:
qos pair for a topic length of least one character (size in bytes so UTF-8 only) 


```pony
fun ref _isValidSub(
  sub: String val,
  qos: String val)
: Bool val
```
#### Parameters

*   sub: [String](builtin-String.md) val
*   qos: [String](builtin-String.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

