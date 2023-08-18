# StdStream
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-45)</span>

Asynchronous access to stdout and stderr. The constructors are private to
ensure that access is provided only via an environment.


```pony
actor tag StdStream
```

## Constructors

### _out
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-52)</span>


Create an async stream for stdout.


```pony
new tag _out()
: StdStream tag^
```

#### Returns

* [StdStream](builtin-StdStream.md) tag^

---

### _err
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-58)</span>


Create an async stream for stderr.


```pony
new tag _err()
: StdStream tag^
```

#### Returns

* [StdStream](builtin-StdStream.md) tag^

---

## Public Behaviours

### print
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-64)</span>


Print some bytes and insert a newline afterwards.


```pony
be print(
  data: (String val | Array[U8 val] val))
```
#### Parameters

*   data: ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)

---

### write
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-70)</span>


Print some bytes without inserting a newline afterwards.


```pony
be write(
  data: (String val | Array[U8 val] val))
```
#### Parameters

*   data: ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)

---

### printv
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-76)</span>


Print an iterable collection of ByteSeqs.


```pony
be printv(
  data: ByteSeqIter val)
```
#### Parameters

*   data: [ByteSeqIter](builtin-ByteSeqIter.md) val

---

### writev
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-84)</span>


Write an iterable collection of ByteSeqs.


```pony
be writev(
  data: ByteSeqIter val)
```
#### Parameters

*   data: [ByteSeqIter](builtin-ByteSeqIter.md) val

---

### flush
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-92)</span>


Flush any data out to the os (ignoring failures).


```pony
be flush()
```

---

## Private Functions

### _write
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-98)</span>


Write the bytes without explicitly flushing.


```pony
fun ref _write(
  data: (String val | Array[U8 val] val))
: None val
```
#### Parameters

*   data: ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)

#### Returns

* [None](builtin-None.md) val

---

### _print
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-104)</span>


Write the bytes and a newline without explicitly flushing.


```pony
fun ref _print(
  data: (String val | Array[U8 val] val))
: None val
```
#### Parameters

*   data: ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)

#### Returns

* [None](builtin-None.md) val

---

