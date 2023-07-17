# FullConfigParams
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-11)</span>
```pony
primitive val FullConfigParams
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-11)</span>


```pony
new val create()
: FullConfigParams val^
```

#### Returns

* [FullConfigParams](mqtt-configurator-FullConfigParams.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-11)</span>


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
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-11)</span>


```pony
fun box eq(
  that: FullConfigParams val)
: Bool val
```
#### Parameters

*   that: [FullConfigParams](mqtt-configurator-FullConfigParams.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-11)</span>


```pony
fun box ne(
  that: FullConfigParams val)
: Bool val
```
#### Parameters

*   that: [FullConfigParams](mqtt-configurator-FullConfigParams.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

