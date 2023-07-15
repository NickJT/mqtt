# MinConfigParams
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-20)</span>
```pony
primitive val MinConfigParams
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-20)</span>


```pony
new val create()
: MinConfigParams val^
```

#### Returns

* [MinConfigParams](mqtt-configurator-MinConfigParams.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-20)</span>


Add strings to this literal array to read them from an ini file. Any strings 
added here which are not represented as non-zero length strings in the ini
file will cause the overall ini read to fail (by design).


```pony
fun box apply()
: Array[String val] val
```

#### Returns

* [Array](builtin-Array.md)\[[String](builtin-String.md) val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-20)</span>


```pony
fun box eq(
  that: MinConfigParams val)
: Bool val
```
#### Parameters

*   that: [MinConfigParams](mqtt-configurator-MinConfigParams.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-20)</span>


```pony
fun box ne(
  that: MinConfigParams val)
: Bool val
```
#### Parameters

*   that: [MinConfigParams](mqtt-configurator-MinConfigParams.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

