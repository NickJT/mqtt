# OutStream
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-16)</span>

Asnychronous access to some output stream.


```pony
interface tag OutStream
```

## Public Behaviours

### print
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-20)</span>


Print some bytes and insert a newline afterwards.


```pony
be print(
  data: (String val | Array[U8 val] val))
```
#### Parameters

*   data: ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)

---

### write
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-25)</span>


Print some bytes without inserting a newline afterwards.


```pony
be write(
  data: (String val | Array[U8 val] val))
```
#### Parameters

*   data: ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)

---

### printv
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-30)</span>


Print an iterable collection of ByteSeqs.


```pony
be printv(
  data: ByteSeqIter val)
```
#### Parameters

*   data: [ByteSeqIter](builtin-ByteSeqIter.md) val

---

### writev
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-35)</span>


Write an iterable collection of ByteSeqs.


```pony
be writev(
  data: ByteSeqIter val)
```
#### Parameters

*   data: [ByteSeqIter](builtin-ByteSeqIter.md) val

---

### flush
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-40)</span>


Flush the stream.


```pony
be flush()
```

---

