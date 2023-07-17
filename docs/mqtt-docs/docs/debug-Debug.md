# Debug
<span class="source-link">[[Source]](src/debug/debug.md#L-0-30)</span>

This is a debug only print utility.


```pony
primitive val Debug
```

## Constructors

### create
<span class="source-link">[[Source]](src/debug/debug.md#L-0-30)</span>


```pony
new val create()
: Debug val^
```

#### Returns

* [Debug](debug-Debug.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/debug/debug.md#L-0-34)</span>


If platform is debug configured, print either a single stringable or a
sequence of stringables. The default separator is ", ", and the default
output stream is stdout.


```pony
fun box apply(
  msg: (Stringable box | ReadSeq[Stringable box] box),
  sep: String val = ", ",
  stream: (DebugOut val | DebugErr val) = reference)
: None val
```
#### Parameters

*   msg: ([Stringable](builtin-Stringable.md) box | [ReadSeq](builtin-ReadSeq.md)\[[Stringable](builtin-Stringable.md) box\] box)
*   sep: [String](builtin-String.md) val = ", "
*   stream: ([DebugOut](debug-DebugOut.md) val | [DebugErr](debug-DebugErr.md) val) = reference

#### Returns

* [None](builtin-None.md) val

---

### out
<span class="source-link">[[Source]](src/debug/debug.md#L-0-53)</span>


If platform is debug configured, print message to standard output


```pony
fun box out(
  msg: Stringable box = "")
: None val
```
#### Parameters

*   msg: [Stringable](builtin-Stringable.md) box = ""

#### Returns

* [None](builtin-None.md) val

---

### err
<span class="source-link">[[Source]](src/debug/debug.md#L-0-59)</span>


If platform is debug configured, print message to standard error


```pony
fun box err(
  msg: Stringable box = "")
: None val
```
#### Parameters

*   msg: [Stringable](builtin-Stringable.md) box = ""

#### Returns

* [None](builtin-None.md) val

---

### eq
<span class="source-link">[[Source]](src/debug/debug.md#L-0-34)</span>


```pony
fun box eq(
  that: Debug val)
: Bool val
```
#### Parameters

*   that: [Debug](debug-Debug.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/debug/debug.md#L-0-34)</span>


```pony
fun box ne(
  that: Debug val)
: Bool val
```
#### Parameters

*   that: [Debug](debug-Debug.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

## Private Functions

### _print
<span class="source-link">[[Source]](src/debug/debug.md#L-0-65)</span>


```pony
fun box _print(
  msg: String val,
  stream: (DebugOut val | DebugErr val))
: None val
```
#### Parameters

*   msg: [String](builtin-String.md) val
*   stream: ([DebugOut](debug-DebugOut.md) val | [DebugErr](debug-DebugErr.md) val)

#### Returns

* [None](builtin-None.md) val

---

### _stream
<span class="source-link">[[Source]](src/debug/debug.md#L-0-70)</span>


```pony
fun box _stream(
  stream: (DebugOut val | DebugErr val))
: Pointer[U8 val] ref
```
#### Parameters

*   stream: ([DebugOut](debug-DebugOut.md) val | [DebugErr](debug-DebugErr.md) val)

#### Returns

* [Pointer](builtin-Pointer.md)\[[U8](builtin-U8.md) val\] ref

---

