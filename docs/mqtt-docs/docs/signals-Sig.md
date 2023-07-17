# Sig
<span class="source-link">[[Source]](src/signals/sig.md#L-0-1)</span>

Define the portable signal numbers. Other signals can be used, but they are
not guaranteed to be portable.


```pony
primitive val Sig
```

## Constructors

### create
<span class="source-link">[[Source]](src/signals/sig.md#L-0-1)</span>


```pony
new val create()
: Sig val^
```

#### Returns

* [Sig](signals-Sig.md) val^

---

## Public Functions

### hup
<span class="source-link">[[Source]](src/signals/sig.md#L-0-6)</span>


```pony
fun box hup()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### int
<span class="source-link">[[Source]](src/signals/sig.md#L-0-7)</span>


```pony
fun box int()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### quit
<span class="source-link">[[Source]](src/signals/sig.md#L-0-8)</span>


```pony
fun box quit()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### ill
<span class="source-link">[[Source]](src/signals/sig.md#L-0-10)</span>


```pony
fun box ill()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### trap
<span class="source-link">[[Source]](src/signals/sig.md#L-0-15)</span>


```pony
fun box trap()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### abrt
<span class="source-link">[[Source]](src/signals/sig.md#L-0-20)</span>


```pony
fun box abrt()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### emt
<span class="source-link">[[Source]](src/signals/sig.md#L-0-22)</span>


```pony
fun box emt()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### fpe
<span class="source-link">[[Source]](src/signals/sig.md#L-0-27)</span>


```pony
fun box fpe()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### kill
<span class="source-link">[[Source]](src/signals/sig.md#L-0-32)</span>


```pony
fun box kill()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### bus
<span class="source-link">[[Source]](src/signals/sig.md#L-0-34)</span>


```pony
fun box bus()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### segv
<span class="source-link">[[Source]](src/signals/sig.md#L-0-40)</span>


```pony
fun box segv()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### sys
<span class="source-link">[[Source]](src/signals/sig.md#L-0-45)</span>


```pony
fun box sys()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### pipe
<span class="source-link">[[Source]](src/signals/sig.md#L-0-51)</span>


```pony
fun box pipe()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### alrm
<span class="source-link">[[Source]](src/signals/sig.md#L-0-56)</span>


```pony
fun box alrm()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### term
<span class="source-link">[[Source]](src/signals/sig.md#L-0-57)</span>


```pony
fun box term()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### urg
<span class="source-link">[[Source]](src/signals/sig.md#L-0-59)</span>


```pony
fun box urg()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### stkflt
<span class="source-link">[[Source]](src/signals/sig.md#L-0-65)</span>


```pony
fun box stkflt()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### stop
<span class="source-link">[[Source]](src/signals/sig.md#L-0-70)</span>


```pony
fun box stop()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### tstp
<span class="source-link">[[Source]](src/signals/sig.md#L-0-76)</span>


```pony
fun box tstp()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### cont
<span class="source-link">[[Source]](src/signals/sig.md#L-0-82)</span>


```pony
fun box cont()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### chld
<span class="source-link">[[Source]](src/signals/sig.md#L-0-88)</span>


```pony
fun box chld()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### ttin
<span class="source-link">[[Source]](src/signals/sig.md#L-0-94)</span>


```pony
fun box ttin()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### ttou
<span class="source-link">[[Source]](src/signals/sig.md#L-0-99)</span>


```pony
fun box ttou()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### io
<span class="source-link">[[Source]](src/signals/sig.md#L-0-104)</span>


```pony
fun box io()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### xcpu
<span class="source-link">[[Source]](src/signals/sig.md#L-0-110)</span>


```pony
fun box xcpu()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### xfsz
<span class="source-link">[[Source]](src/signals/sig.md#L-0-115)</span>


```pony
fun box xfsz()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### vtalrm
<span class="source-link">[[Source]](src/signals/sig.md#L-0-120)</span>


```pony
fun box vtalrm()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### prof
<span class="source-link">[[Source]](src/signals/sig.md#L-0-125)</span>


```pony
fun box prof()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### winch
<span class="source-link">[[Source]](src/signals/sig.md#L-0-130)</span>


```pony
fun box winch()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### info
<span class="source-link">[[Source]](src/signals/sig.md#L-0-135)</span>


```pony
fun box info()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### pwr
<span class="source-link">[[Source]](src/signals/sig.md#L-0-140)</span>


```pony
fun box pwr()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### usr1
<span class="source-link">[[Source]](src/signals/sig.md#L-0-145)</span>


```pony
fun box usr1()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### usr2
<span class="source-link">[[Source]](src/signals/sig.md#L-0-151)</span>


```pony
fun box usr2()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### rt
<span class="source-link">[[Source]](src/signals/sig.md#L-0-165)</span>


```pony
fun box rt(
  n: U32 val)
: U32 val ?
```
#### Parameters

*   n: [U32](builtin-U32.md) val

#### Returns

* [U32](builtin-U32.md) val ?

---

### eq
<span class="source-link">[[Source]](src/signals/sig.md#L-0-6)</span>


```pony
fun box eq(
  that: Sig val)
: Bool val
```
#### Parameters

*   that: [Sig](signals-Sig.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/signals/sig.md#L-0-6)</span>


```pony
fun box ne(
  that: Sig val)
: Bool val
```
#### Parameters

*   that: [Sig](signals-Sig.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

