# IniNotify
<span class="source-link">[[Source]](src/ini/ini.md#L-0-39)</span>

Notifications for INI parsing.


```pony
interface ref IniNotify
```

## Public Functions

### apply
<span class="source-link">[[Source]](src/ini/ini.md#L-0-43)</span>


This is called for every valid entry in the INI file. If key/value pairs
occur before a section name, the section can be an empty string. Return
false to halt processing.


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
<span class="source-link">[[Source]](src/ini/ini.md#L-0-50)</span>


This is called for every valid section in the INI file. Return false
to halt processing.


```pony
fun ref add_section(
  section: String val)
: Bool val
```
#### Parameters

*   section: [String](builtin-String.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### errors
<span class="source-link">[[Source]](src/ini/ini.md#L-0-57)</span>


This is called for each error encountered. Return false to halt processing.


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

