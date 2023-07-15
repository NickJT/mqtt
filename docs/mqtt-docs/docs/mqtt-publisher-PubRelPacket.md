# PubRelPacket
<span class="source-link">[[Source]](src/mqtt-publisher/pubRelPacket.md#L-0-7)</span>

A PUBREL Packet is the response to a PUBREC Packet. It is the third packet of the QoS 2 protocol 
exchange

Fixed header
B1  Control byte (must be 0b01100010)
B2  Remaining Length - This is a single byte containing 0x02   

Variable header - Always bytes 2 and 3 of the packet
B1 Packet id MSB
B2 Packet id LSB 

Payload
PubRel has no payload

Create a PubRel packet from a passed BasePacket and provide a public function to
retrieve the id.
TODO - Once all the ack packets are done, check for consistency. It may be better to 
simply check for a valid packet and return the id, or zero if not valid


```pony
class ref PubRelPacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/pubRelPacket.md#L-0-31)</span>


```pony
new ref create()
: PubRelPacket ref^
```

#### Returns

* [PubRelPacket](mqtt-publisher-PubRelPacket.md) ref^

---

### createFromPacket
<span class="source-link">[[Source]](src/mqtt-publisher/pubRelPacket.md#L-0-34)</span>


```pony
new val createFromPacket(
  pkt: BasePacket val)
: PubRelPacket val^
```
#### Parameters

*   pkt: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [PubRelPacket](mqtt-publisher-PubRelPacket.md) val^

---

## Public Functions

### id
<span class="source-link">[[Source]](src/mqtt-publisher/pubRelPacket.md#L-0-43)</span>


A public function to retrieve the id. isValid is false if id == 0


```pony
fun box id()
: U16 val
```

#### Returns

* [U16](builtin-U16.md) val

---

### isValid
<span class="source-link">[[Source]](src/mqtt-publisher/pubRelPacket.md#L-0-50)</span>


Returns true if the packet was fully constructed and _id is not zero


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### compose
<span class="source-link">[[Source]](src/mqtt-publisher/pubRelPacket.md#L-0-57)</span>


Compose a PubRel packet for a give id and return directly as a ArrayVal 
TODO - Once all the ack packets are done, check for consistency. Do we need a
id != 0 check?


```pony
fun box compose(
  pktId: U16 val)
: Array[U8 val] val
```
#### Parameters

*   pktId: [U16](builtin-U16.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

