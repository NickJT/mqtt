# Ini
<span class="source-link">[[Source]](src/ini/ini.md#L-0-63)</span>

A streaming parser for INI formatted lines of test.


```pony
primitive val Ini
```

## Constructors

### create
<span class="source-link">[[Source]](src/ini/ini.md#L-0-63)</span>


```pony
new val create()
: Ini val^
```

#### Returns

* [Ini](ini-Ini.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/ini/ini.md#L-0-67)</span>


This accepts a string iterator and calls the IniNotify for each new entry.
If any errors are encountered, this will return false. Otherwise, it
returns true.


```pony
fun box apply(
  lines: Iterator[String box] ref,
  f: IniNotify ref)
: Bool val
```
#### Parameters

*   lines: [Iterator](builtin-Iterator.md)\[[String](builtin-String.md) box\] ref
*   f: [IniNotify](ini-IniNotify.md) ref

#### Returns

* [Bool](builtin-Bool.md) val

---

### eq
<span class="source-link">[[Source]](src/ini/ini.md#L-0-67)</span>


```pony
fun box eq(
  that: Ini val)
: Bool val
```
#### Parameters

*   that: [Ini](ini-Ini.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/ini/ini.md#L-0-67)</span>


```pony
fun box ne(
  that: Ini val)
: Bool val
```
#### Parameters

*   that: [Ini](ini-Ini.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

