# Assembler
<span class="source-link">[[Source]](src/mqtt-assembler/assembler.md#L-0-8)</span>

Assembler accepts an array of bytes of arbitrary length received from the TCP buffer. It
assembles these into MQTT packets, wraps them in the BasePacket class and passess them
on the router.
Incomming TCP buffers may contain:
1.  one or more complete MQTT packets or 
2.  one or more complete MQTT packets followed by a partial packet
3.  the trailing end of a packet, followed by zero or more complete or partial packets

The only guarantee we assume is that the first buffer of data starts with the fixed 
header of a valid MQTT packet
 
I'm not using a ring buffer for packet assembly because:
- it implies copying on and copying off individual bytes
- packets would need to be assembled by appending every byte individually
- the value of the RL bytes would need to be either calculated on the fly (which is complex
 for an inner loop and would mean we have RL calculations in two places) or would mean
composing a five byte array to send to the primitive (more copying) 
- the split/chop approach provides a fast path for the 99.9?% of packets that arrive 
single and complete
TODO - Benchmark the two approaches  the performance release (maybe) 
Assembler should be the only actor that needs to deal with raw Array[U8], 
other than when router extracts the data in its send behaviour.


```pony
actor tag Assembler
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-assembler/assembler.md#L-0-38)</span>


```pony
new tag create(
  router: Router tag)
: Assembler tag^
```
#### Parameters

*   router: [Router](mqtt-Router.md) tag

#### Returns

* [Assembler](mqtt-assembler-Assembler.md) tag^

---

## Public fields

### var packets: [Array](builtin-Array.md)\[[Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val\] ref
<span class="source-link">[[Source]](src/mqtt-assembler/assembler.md#L-0-36)</span>



---

## Public Behaviours

### assemble
<span class="source-link">[[Source]](src/mqtt-assembler/assembler.md#L-0-43)</span>


```pony
be assemble(
  input: Array[U8 val] val)
```
#### Parameters

*   input: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

## Public Functions

### split
<span class="source-link">[[Source]](src/mqtt-assembler/assembler.md#L-0-68)</span>


```pony
fun ref split(
  input: Array[U8 val] val)
: Array[U8 val] val
```
#### Parameters

*   input: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

