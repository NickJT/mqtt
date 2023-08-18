# PublishPacket
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-7)</span>

## Packet Format ##
### Fixed header ###
B1  Control byte - must be 0b0011DQQR where D:DUP flag, QQ is QOS and R is Retain
B2. Remaining Length - This is the length of variable header plus the length of 
the payload. The remaining length field can include 1 to 4 bytes.

DUP - If the DUP flag is set to 0, it indicates that this is the first occasion that
the Client or Server has attempted to send this MQTT PUBLISH Packet. If the DUP flag
is set to 1, it indicates that this might be re-delivery of an earlier attempt to
send the Packet. The recipient of a Control Packet that contains the DUP flag set to
1 cannot assume that it has seen an earlier copy of this packet.

***QOS - The Packet Identifier field is only present in PUBLISH Packets where the QoS
level is 1 or 2.***

Retain - When sending a PUBLISH Packet to a Client the Server MUST set the RETAIN flag
to 1 if a message is sent as a result of a new subscription being made by a Client. It
MUST set the RETAIN flag to 0 when a PUBLISH Packet is sent to a Client because it
matches an established subscription regardless of how the flag was set in the message
it received.  
If the RETAIN flag is set to 1, in a PUBLISH Packet sent by a CLIENT to a 
SERVER, the Server MUST store the Application Message and its QoS, so that it can
be delivered to future subscribers whose subscriptions match its topic name.

### Variable header ###
Topic name
B1 - Length MSB
B2 - Length LSB
B3-> Topic Characters

Packet Id
Only present in PUBLISH Packets where the QoS level is 1 or 2.
Bn    Packet id MSB
Bn+1  Packet id LSB 

### Payload ###
The Payload contains the Application Message that is being published. 
The content and format of the data is application specific. The length of the
payload can be calculated by subtracting the length of the variable header from
the Remaining Length field that is in the Fixed Header.  
It is valid for a PUBLISH Packet to contain a zero length payload.

## Response ##
The receiver of a PUBLISH Packet MUST respond as follows:
- QoS   None
- QoS 1 PUBACK Packet
- QoS 2 PUBREC Packet


```pony
class ref PublishPacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-67)</span>


This creates a default initialised PublishPacket that can be used as a receiver for calls to compose. Not intended
to be used to create PublishPackets. Use CreateFromPacket(BasePacket) to create PublishPackets.


```pony
new ref create()
: PublishPacket ref^
```

#### Returns

* [PublishPacket](mqtt-publisher-PublishPacket.md) ref^

---

### createFromPacket
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-74)</span>


Creates a PublishPacket with the fields set from the passed BasePacket


```pony
new val createFromPacket(
  basePacket: BasePacket val)
: PublishPacket val^
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [PublishPacket](mqtt-publisher-PublishPacket.md) val^

---

## Public Functions

### compose
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-161)</span>


Returns a publish packet ready to send to the broker. 


```pony
fun box compose(
  args: PublishArgs val)
: Array[U8 val] val
```
#### Parameters

*   args: [PublishArgs](mqtt-primitives-PublishArgs.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### isValid
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-196)</span>


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### id
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-201)</span>


```pony
fun box id()
: (U16 val | None val)
```

#### Returns

* ([U16](builtin-U16.md) val | [None](builtin-None.md) val)

---

### qos
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-207)</span>


```pony
fun box qos()
: (Qos0 val | Qos1 val | Qos2 val)
```

#### Returns

* ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val)

---

### topic
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-212)</span>


```pony
fun box topic()
: (String val | None val)
```

#### Returns

* ([String](builtin-String.md) val | [None](builtin-None.md) val)

---

### payload
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-220)</span>


```pony
fun box payload()
: (Array[U8 val] val | None val)
```

#### Returns

* ([Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val | [None](builtin-None.md) val)

---

### payloadAsString
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-230)</span>


```pony
fun box payloadAsString()
: (String val | None val)
```

#### Returns

* ([String](builtin-String.md) val | [None](builtin-None.md) val)

---

## Private Functions

### _build
<span class="source-link">[[Source]](src/mqtt-publisher/publishPacket.md#L-0-81)</span>


An rather fiddly function to verify and decode a publish packet. Can be made
look more simple by eliminating the intermediate variable - but we will wait until
we have a little more confidence in using it first.
TODO - Much of this is duplicated in BasePacket. Make BasePacket a Trait and have
publishPacket as a decomposable


```pony
fun ref _build(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

