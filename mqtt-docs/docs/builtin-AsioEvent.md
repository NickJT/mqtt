# AsioEvent
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-6)</span>

Functions for asynchronous event notification.


```pony
primitive val AsioEvent
```

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-6)</span>


```pony
new val create()
: AsioEvent val^
```

#### Returns

* [AsioEvent](builtin-AsioEvent.md) val^

---

## Public Functions

### none
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-10)</span>


An empty event.


```pony
fun box none()
: Pointer[AsioEvent val] tag
```

#### Returns

* [Pointer](builtin-Pointer.md)\[[AsioEvent](builtin-AsioEvent.md) val\] tag

---

### readable
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-16)</span>


Returns true if the flags contain the readable flag.


```pony
fun box readable(
  flags: U32 val)
: Bool val
```
#### Parameters

*   flags: [U32](builtin-U32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### writeable
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-22)</span>


Returns true if the flags contain the writeable flag.


```pony
fun box writeable(
  flags: U32 val)
: Bool val
```
#### Parameters

*   flags: [U32](builtin-U32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### disposable
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-28)</span>


Returns true if the event should be disposed of.


```pony
fun box disposable(
  flags: U32 val)
: Bool val
```
#### Parameters

*   flags: [U32](builtin-U32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### oneshotable
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-34)</span>


Returns true if the flags contain the oneshot flag.


```pony
fun box oneshotable(
  flags: U32 val)
: Bool val
```
#### Parameters

*   flags: [U32](builtin-U32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### dispose
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-40)</span>


```pony
fun box dispose()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### read
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-42)</span>


```pony
fun box read()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### write
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-44)</span>


```pony
fun box write()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### timer
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-46)</span>


```pony
fun box timer()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### signal
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-48)</span>


```pony
fun box signal()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### read_write
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-50)</span>


```pony
fun box read_write()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### oneshot
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-52)</span>


```pony
fun box oneshot()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### read_write_oneshot
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-54)</span>


```pony
fun box read_write_oneshot()
: U32 val
```

#### Returns

* [U32](builtin-U32.md) val

---

### eq
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-10)</span>


```pony
fun box eq(
  that: AsioEvent val)
: Bool val
```
#### Parameters

*   that: [AsioEvent](builtin-AsioEvent.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-10)</span>


```pony
fun box ne(
  that: AsioEvent val)
: Bool val
```
#### Parameters

*   that: [AsioEvent](builtin-AsioEvent.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

