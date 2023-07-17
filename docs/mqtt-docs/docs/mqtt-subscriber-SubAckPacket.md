# SubAckPacket
<span class="source-link">[[Source]](src/mqtt-subscriber/subAckPacket.md#L-0-8)</span>

## SubAck ##
A SUBACK Packet is sent by the Server to the Client to confirm receipt and processing of a SUBSCRIBE
Packet. A SUBACK Packet contains a list of return codes that specify the maximum QoS level that was granted
in each Subscription that was requested by the SUBSCRIBE.

### Fixed header ###
B1  Control byte (must be 0b10010000)
B2  Remaining Length - This is the length of variable header (2 bytes) 
plus the length of the payload.   

### Variable header ###
B1 Packet id MSB
B2 Packet id LSB 

### Payload ### 
B1  Return Code - The payload contains a list of return codes. Each return
code corresponds to a Topic Filter in the SUBSCRIBE Packet being acknowledged.
The order of return codes in the SUBACK Packet will match the order of Topic 
Filters in the SUBSCRIBE Packet
Payload = 0x00 - Success - Maximum QoS 0
Payload = 0x01 - Success - Maximum QoS 1
Payload = 0x02 - Success - Maximum QoS 2
Payload = 0x80 - Failure

### Actions ### 
We're not implementing the multi-subscribe capability in the specification because 
the saving in a few sub/unsub messages is outweighed by:
1. losing the "one topic:one subscriber" model
2. the additional complexity of an intermediate routing step to decompose the SubAck
from the Broker into SubAcks for individual actors.

Note: The Broker cannot conflate multiple acks into one SubAck unlessthe client subscribes to
multiple topics in one subscribe message.


```pony
class ref SubAckPacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-subscriber/subAckPacket.md#L-0-48)</span>


```pony
new val create(
  basePacket: BasePacket val)
: SubAckPacket val^
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [SubAckPacket](mqtt-subscriber-SubAckPacket.md) val^

---

## Public Functions

### isValid
<span class="source-link">[[Source]](src/mqtt-subscriber/subAckPacket.md#L-0-78)</span>


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### approvedQos
<span class="source-link">[[Source]](src/mqtt-subscriber/subAckPacket.md#L-0-82)</span>


```pony
fun box approvedQos()
: (Qos0 val | Qos1 val | Qos2 val | 
    None val)
```

#### Returns

* ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val | 
    [None](builtin-None.md) val)

---

### id
<span class="source-link">[[Source]](src/mqtt-subscriber/subAckPacket.md#L-0-90)</span>


```pony
fun box id()
: U16 val
```

#### Returns

* [U16](builtin-U16.md) val

---

