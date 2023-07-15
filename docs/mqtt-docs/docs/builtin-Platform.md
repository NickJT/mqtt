# Platform
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-1)</span>
```pony
primitive val Platform
```

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-1)</span>


```pony
new val create()
: Platform val^
```

#### Returns

* [Platform](builtin-Platform.md) val^

---

## Public Functions

### bsd
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-2)</span>


```pony
fun box bsd()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### freebsd
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-3)</span>


```pony
fun box freebsd()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### dragonfly
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-4)</span>


```pony
fun box dragonfly()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### openbsd
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-5)</span>


```pony
fun box openbsd()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### linux
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-6)</span>


```pony
fun box linux()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### osx
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-7)</span>


```pony
fun box osx()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### posix
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-8)</span>


```pony
fun box posix()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### windows
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-9)</span>


```pony
fun box windows()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### x86
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-11)</span>


```pony
fun box x86()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### arm
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-12)</span>


```pony
fun box arm()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### riscv
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-13)</span>


```pony
fun box riscv()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### lp64
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-15)</span>


```pony
fun box lp64()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### llp64
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-16)</span>


```pony
fun box llp64()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### ilp32
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-17)</span>


```pony
fun box ilp32()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### bigendian
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-19)</span>


```pony
fun box bigendian()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### littleendian
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-20)</span>


```pony
fun box littleendian()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### native128
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-22)</span>


```pony
fun box native128()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### debug
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-23)</span>


```pony
fun box debug()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### runtimestats
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-24)</span>


```pony
fun box runtimestats()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### runtimestatsmessages
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-25)</span>


```pony
fun box runtimestatsmessages()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### eq
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-2)</span>


```pony
fun box eq(
  that: Platform val)
: Bool val
```
#### Parameters

*   that: [Platform](builtin-Platform.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/builtin/platform.md#L-0-2)</span>


```pony
fun box ne(
  that: Platform val)
: Bool val
```
#### Parameters

*   that: [Platform](builtin-Platform.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

