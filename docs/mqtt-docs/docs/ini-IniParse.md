# IniParse
<span class="source-link">[[Source]](src/ini/ini_map.md#L-0-5)</span>

This is used to parse INI formatted text as a nested map of strings.


```pony
primitive val IniParse
```

## Constructors

### create
<span class="source-link">[[Source]](src/ini/ini_map.md#L-0-5)</span>


```pony
new val create()
: IniParse val^
```

#### Returns

* [IniParse](ini-IniParse.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/ini/ini_map.md#L-0-9)</span>


This accepts a string iterator and returns a nested map of strings. If
parsing fails, an error is raised.


```pony
fun box apply(
  lines: Iterator[String val] ref)
: HashMap[String val, HashMap[String val, String val, HashEq[String val] val] ref, HashEq[String val] val] ref^ ?
```
#### Parameters

*   lines: [Iterator](builtin-Iterator.md)\[[String](builtin-String.md) val\] ref

#### Returns

* [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] ref, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] ref^ ?

---

### eq
<span class="source-link">[[Source]](src/ini/ini_map.md#L-0-9)</span>


```pony
fun box eq(
  that: IniParse val)
: Bool val
```
#### Parameters

*   that: [IniParse](ini-IniParse.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/ini/ini_map.md#L-0-9)</span>


```pony
fun box ne(
  that: IniParse val)
: Bool val
```
#### Parameters

*   that: [IniParse](ini-IniParse.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

