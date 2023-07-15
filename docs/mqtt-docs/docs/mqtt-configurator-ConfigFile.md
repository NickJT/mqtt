# ConfigFile
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-4)</span>
```pony
primitive val ConfigFile
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-4)</span>


```pony
new val create()
: ConfigFile val^
```

#### Returns

* [ConfigFile](mqtt-configurator-ConfigFile.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-4)</span>


The name of the config file - currently assumed to be in the main source directory


```pony
fun box apply()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-4)</span>


```pony
fun box eq(
  that: ConfigFile val)
: Bool val
```
#### Parameters

*   that: [ConfigFile](mqtt-configurator-ConfigFile.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-configurator/iniStrings.md#L-0-4)</span>


```pony
fun box ne(
  that: ConfigFile val)
: Bool val
```
#### Parameters

*   that: [ConfigFile](mqtt-configurator-ConfigFile.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

