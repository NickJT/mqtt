# ByteSeqIter
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-10)</span>

Accept an iterable collection of String or Array[U8] val.


```pony
interface val ByteSeqIter
```

## Public Functions

### values
<span class="source-link">[[Source]](src/builtin/std_stream.md#L-0-14)</span>


```pony
fun box values()
: Iterator[(this->String box | this->Array[U8 val] box)] ref
```

#### Returns

* [Iterator](builtin-Iterator.md)\[(this->[String](builtin-String.md) box | this->[Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] box)\] ref

---

