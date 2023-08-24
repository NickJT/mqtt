# Registrar
<span class="source-link">[[Source]](src/bureaucracy/registrar.md#L-0-4)</span>

A Registrar keeps a map of lookup string to anything. Generally, this is used
to keep a directory of long-lived service-providing actors that can be
looked up name.


```pony
actor tag Registrar
```

## Constructors

### create
<span class="source-link">[[Source]](src/bureaucracy/registrar.md#L-0-4)</span>


```pony
new tag create()
: Registrar tag^
```

#### Returns

* [Registrar](bureaucracy-Registrar.md) tag^

---

## Public Behaviours

### update
<span class="source-link">[[Source]](src/bureaucracy/registrar.md#L-0-12)</span>


Add, or change, a lookup mapping.


```pony
be update(
  key: String val,
  value: Any tag)
```
#### Parameters

*   key: [String](builtin-String.md) val
*   value: [Any](builtin-Any.md) tag

---

### remove
<span class="source-link">[[Source]](src/bureaucracy/registrar.md#L-0-18)</span>


Remove a mapping. This only takes effect if provided key currently maps to
the provided value. If the key maps to some other value (perhaps after
updating), the mapping won't be removed.


```pony
be remove(
  key: String val,
  value: Any tag)
```
#### Parameters

*   key: [String](builtin-String.md) val
*   value: [Any](builtin-Any.md) tag

---

## Public Functions

### apply\[optional A: [Any](builtin-Any.md) tag\]
<span class="source-link">[[Source]](src/bureaucracy/registrar.md#L-0-30)</span>


Lookup by name. Returns a promise that will be fulfilled with the mapped
value if it exists and is a subtype of A. Otherwise, the promise will be
rejected.


```pony
fun tag apply[optional A: Any tag](
  key: String val)
: Promise[A] tag
```
#### Parameters

*   key: [String](builtin-String.md) val

#### Returns

* [Promise](promises-Promise.md)\[A\] tag

---

## Private Behaviours

### _fetch\[A: [Any](builtin-Any.md) tag\]
<span class="source-link">[[Source]](src/bureaucracy/registrar.md#L-0-40)</span>


Fulfills or rejects the promise.


```pony
be _fetch[A: Any tag](
  key: String val,
  promise: Promise[A] tag)
```
#### Parameters

*   key: [String](builtin-String.md) val
*   promise: [Promise](promises-Promise.md)\[A\] tag

---

