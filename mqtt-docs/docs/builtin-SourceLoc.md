# SourceLoc
<span class="source-link">[[Source]](src/builtin/source_loc.md#L-0-1)</span>

Represents a location in a Pony source file, as reported by `__loc`.


```pony
interface val SourceLoc
```

## Public Functions

### file
<span class="source-link">[[Source]](src/builtin/source_loc.md#L-0-5)</span>


Name and path of source file.


```pony
fun box file()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### type_name
<span class="source-link">[[Source]](src/builtin/source_loc.md#L-0-10)</span>


Name of nearest class, actor, primitive, struct, interface, or trait.


```pony
fun box type_name()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### method_name
<span class="source-link">[[Source]](src/builtin/source_loc.md#L-0-15)</span>


Name of containing method.


```pony
fun box method_name()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### line
<span class="source-link">[[Source]](src/builtin/source_loc.md#L-0-20)</span>


Line number within file.
Line numbers start at 1.


```pony
fun box line()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### pos
<span class="source-link">[[Source]](src/builtin/source_loc.md#L-0-26)</span>


Character position on line.
Character positions start at 1.


```pony
fun box pos()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

