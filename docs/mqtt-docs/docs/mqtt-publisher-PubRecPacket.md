# PubRecPacket
<span class="source-link">[[Source]](src/mqtt-publisher/pubRecPacket.md#L-0-7)</span>

A PUBREC Packet is the response to a PUBLISH Packet with QoS 2. It is the
 second packet of the QoS 2 protocol exchange

Fixed header
B1  Control byte (must be 0b01010000)
B2  Remaining Length - This is a single byte containing 0x02   

Variable header
B1 Packet id MSB
B2 Packet id LSB 

Payload
PubRec has no payload


```pony
class ref PubRecPacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/pubRecPacket.md#L-0-26)</span>


```pony
new ref create()
: PubRecPacket ref^
```

#### Returns

* [PubRecPacket](mqtt-publisher-PubRecPacket.md) ref^

---

### createFromPacket
<span class="source-link">[[Source]](src/mqtt-publisher/pubRecPacket.md#L-0-29)</span>


```pony
new val createFromPacket(
  pkt: BasePacket val)
: PubRecPacket val^
```
#### Parameters

*   pkt: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [PubRecPacket](mqtt-publisher-PubRecPacket.md) val^

---

## Public Functions

### id
<span class="source-link">[[Source]](src/mqtt-publisher/pubRecPacket.md#L-0-38)</span>


A public function to retrieve the id. isValid is false if id == 0


```pony
fun box id()
: U16 val
```

#### Returns

* [U16](builtin-U16.md) val

---

### isValid
<span class="source-link">[[Source]](src/mqtt-publisher/pubRecPacket.md#L-0-45)</span>


Returns true if the packet was fully constructed and _id is not zero


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### compose
<span class="source-link">[[Source]](src/mqtt-publisher/pubRecPacket.md#L-0-52)</span>


Compose a PubAckPacket for a give id and return directly as a ArrayVal 
TODO - Once all the ack packets are done, check for consistency.


```pony
fun box compose(
  id': U16 val)
: Array[U8 val] val
```
#### Parameters

*   id': [U16](builtin-U16.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

