# Assembler
<span class="source-link">[[Source]](src/mqtt-assembler/assembler.md#L-0-9)</span>

We're using a ring buffer for packet assembly because:
- it implies copying on and copying off individual bytes
- packets would need to be assembled by appending every byte individually
- the value of the RL bytes would need to be either calculated on the fly (which is complex
 for an inner loop and would mean we have RL calculations in two places) or would mean
composing a five byte array to send to the primitive (more copying) 
- the _split/chop approach provides a fast path for the 99.9?% of packets that arrive 
single and complete
TODO - Benchmark the two approaches  the performance release (maybe) 
Assembler should be the only actor that needs to deal with raw Array[U8], 
other than when router extracts the data in its send behaviour.


```pony
actor tag Assembler
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-assembler/assembler.md#L-0-28)</span>


```pony
new tag create(
  router: Router tag)
: Assembler tag^
```
#### Parameters

*   router: [Router](mqtt-router-Router.md) tag

#### Returns

* [Assembler](mqtt-assembler-Assembler.md) tag^

---

## Public Behaviours

### assemble
<span class="source-link">[[Source]](src/mqtt-assembler/assembler.md#L-0-32)</span>


We need to handle the case where we receive only the first byte of the packet OR
where we don't have enough data to calculate the packet length.  
If byte n has bit 7 set then byte n+1 is also a remaining length byte so the minimum 
viable fixed header is control byte + bytes until we get to a byte with bit 7 == 0


```pony
be assemble(
  input: Array[U8 val] val)
```
#### Parameters

*   input: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

## Private Functions

### _split
<span class="source-link">[[Source]](src/mqtt-assembler/assembler.md#L-0-64)</span>


```pony
fun ref _split(
  input: Array[U8 val] val)
: Array[U8 val] val
```
#### Parameters

*   input: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

