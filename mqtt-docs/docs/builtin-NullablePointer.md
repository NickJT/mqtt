# NullablePointer\[A: A\]
<span class="source-link">[[Source]](src/builtin/nullable_pointer.md#L-0-1)</span>

A NullablePointer[A] is used to encode a possibly-null type. It should
_only_ be used for structs that need to be passed to and from the C FFI.

An optional type for anything that isn't a struct should be encoded as a
union type, for example (A | None).


```pony
struct ref NullablePointer[A: A]
```

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/nullable_pointer.md#L-0-9)</span>


This re-encodes the type of `that` from A to NullablePointer[A], allowing
`that` to be assigned to a field or variable of type NullablePointer[A]. It
doesn't allocate a wrapper object: there is no containing object for `that`.


```pony
new ref create(
  that: A)
: NullablePointer[A] ref^
```
#### Parameters

*   that: A

#### Returns

* [NullablePointer](builtin-NullablePointer.md)\[A\] ref^

---

### none
<span class="source-link">[[Source]](src/builtin/nullable_pointer.md#L-0-17)</span>


This returns a null pointer typed as a NullablePointer[A].


```pony
new ref none()
: NullablePointer[A] ref^
```

#### Returns

* [NullablePointer](builtin-NullablePointer.md)\[A\] ref^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/builtin/nullable_pointer.md#L-0-23)</span>


This re-encodes the type of `this` from NullablePointer[A] to A, allowing
`this` to be assigned to a field of variable of type A. If `this` is a null
pointer, an error is raised.


```pony
fun box apply()
: this->A ?
```

#### Returns

* this->A ?

---

### is_none
<span class="source-link">[[Source]](src/builtin/nullable_pointer.md#L-0-31)</span>


Returns true if `this` is null (ie apply would raise an error).


```pony
fun box is_none()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

