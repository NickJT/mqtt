# UnsubscribePacket
<span class="source-link">[[Source]](src/mqtt-subscriber/unsubscribePacket.md#L-0-5)</span>

Fixed header
B1  Control byte (must be 0b10100010 = Control Packet Type & 0b00000010)
B2  Remaining Length - This is the length of variable header (2 bytes) 
plus the length of the payload.   

Variable header
B1 Packet id MSB
B2 Packet id LSB 

Payload
B1  Payload Length MSB
B2  Payload Length LSB

String representation of topic name (length is NOT encoded as remaining length)
B3  Length of topic filter in bytes - MSB  
B4  Length of topic filter in bytes - LSB
B.. Characters of topic filter '$SYS/broker/load/bytes/sent/1min'



```pony
class ref UnsubscribePacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-subscriber/unsubscribePacket.md#L-0-29)</span>


Only intended to enable UnsubscribePacket.compose(<<args>>) 


```pony
new ref create()
: UnsubscribePacket ref^
```

#### Returns

* [UnsubscribePacket](mqtt-subscriber-UnsubscribePacket.md) ref^

---

### createFromPacket
<span class="source-link">[[Source]](src/mqtt-subscriber/unsubscribePacket.md#L-0-35)</span>


Creates an Unsubscribe Packet with the fields set from the passed BasePacket. Only
used for Mock Broker 


```pony
new val createFromPacket(
  basePacket: BasePacket val)
: UnsubscribePacket val^
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [UnsubscribePacket](mqtt-subscriber-UnsubscribePacket.md) val^

---

## Public Functions

### isValid
<span class="source-link">[[Source]](src/mqtt-subscriber/unsubscribePacket.md#L-0-49)</span>


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### id
<span class="source-link">[[Source]](src/mqtt-subscriber/unsubscribePacket.md#L-0-54)</span>


```pony
fun box id()
: (U16 val | None val)
```

#### Returns

* ([U16](builtin-U16.md) val | [None](builtin-None.md) val)

---

### compose
<span class="source-link">[[Source]](src/mqtt-subscriber/unsubscribePacket.md#L-0-60)</span>


Build an unsubscribe packet based on the passed arguments


```pony
fun ref compose(
  id': U16 val,
  topic: String val)
: Array[U8 val] val
```
#### Parameters

*   id': [U16](builtin-U16.md) val
*   topic: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

