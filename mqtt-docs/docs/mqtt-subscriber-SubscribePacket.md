# SubscribePacket
<span class="source-link">[[Source]](src/mqtt-subscriber/subscribePacket.md#L-0-5)</span>

Fixed header
B1  Control byte (must be 0b10000010 = Control Packet Type & 0b00000010)
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
B.. Requested Qos (0b000000xx) 0, 1 or 2

    if topic is "$SYS/#" = qos0
    Packet =  130, 11, 0, 1, 0, 6, 36, 83, 89, 83, 47, 35, 0


```pony
class ref SubscribePacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-subscriber/subscribePacket.md#L-0-32)</span>


Only intended to enable SubscribePacket.compose(<<args>>) 


```pony
new ref create()
: SubscribePacket ref^
```

#### Returns

* [SubscribePacket](mqtt-subscriber-SubscribePacket.md) ref^

---

### createFromPacket
<span class="source-link">[[Source]](src/mqtt-subscriber/subscribePacket.md#L-0-38)</span>


Creates a Subscribe Packet with the fields set from the passed BasePacket. Only
used for Mock Broker 


```pony
new val createFromPacket(
  basePacket: BasePacket val)
: SubscribePacket val^
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [SubscribePacket](mqtt-subscriber-SubscribePacket.md) val^

---

## Public Functions

### isValid
<span class="source-link">[[Source]](src/mqtt-subscriber/subscribePacket.md#L-0-52)</span>


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### id
<span class="source-link">[[Source]](src/mqtt-subscriber/subscribePacket.md#L-0-57)</span>


```pony
fun box id()
: (U16 val | None val)
```

#### Returns

* ([U16](builtin-U16.md) val | [None](builtin-None.md) val)

---

### compose
<span class="source-link">[[Source]](src/mqtt-subscriber/subscribePacket.md#L-0-63)</span>


Return a subscribe packet ready to send to the broker


```pony
fun ref compose(
  id': U16 val,
  topic: String val,
  qosString: String val)
: Array[U8 val] val
```
#### Parameters

*   id': [U16](builtin-U16.md) val
*   topic: [String](builtin-String.md) val
*   qosString: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

