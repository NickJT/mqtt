# _PromiseFulFill\[A: [Any](builtin-Any.md) #share, B: [Any](builtin-Any.md) #share\]
<span class="source-link">[[Source]](src/promises/promise.md#L-0-424)</span>

Fulfill discarding its input value of `A` and returning a promise of type `B`.


```pony
class iso _PromiseFulFill[A: Any #share, B: Any #share] is
  Fulfill[A, Promise[B] tag] iso
```

#### Implements

* [Fulfill](promises-Fulfill.md)\[A, [Promise](promises-Promise.md)\[B\] tag\] iso

---

## Constructors

### create
<span class="source-link">[[Source]](src/promises/promise.md#L-0-428)</span>


```pony
new iso create()
: _PromiseFulFill[A, B] iso^
```

#### Returns

* [_PromiseFulFill](promises-_PromiseFulFill.md)\[A, B\] iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/promises/promise.md#L-0-429)</span>


```pony
fun ref apply(
  value: A)
: Promise[B] tag
```
#### Parameters

*   value: A

#### Returns

* [Promise](promises-Promise.md)\[B\] tag

---

