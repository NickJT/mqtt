# BasePacket
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-5)</span>

BasePacket is the simplest concrete representation of the Packet trait. It is used by 
Assembler to send a basic validated packet to router. 
If the BasePacket.IsValid() method returns true then BasePacket guarantees
1. The first byte of the data can be read
2. The remaining length bytes can be read
3. The length of the array matches the remaining length value
4. The control packet is valid ( 0 > b7..b4 < 15)


```pony
class ref BasePacket is
  Packet ref
```

#### Implements

* [Packet](mqtt-primitives-Packet.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-24)</span>


```pony
new ref create(
  data': Array[U8 val] val)
: BasePacket ref^
```
#### Parameters

*   data': [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

#### Returns

* [BasePacket](mqtt-utilities-BasePacket.md) ref^

---

## Public Functions

### isValid
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-116)</span>


Returns true if the packet has been validated


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### isNotValid
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-124)</span>


Sugar to remove some nots from the main code, sorry


```pony
fun box isNotValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### controlType
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-131)</span>


Returns the packetType which should only be None if isValid() returns false


```pony
fun box controlType()
: (ControlConnect val | ControlConnAck val | ControlPublish val | 
    ControlPubAck val | ControlPubRec val | ControlPubRel val | 
    ControlPubComp val | ControlSubscribe val | ControlSubAck val | 
    ControlUnsubscribe val | ControlUnsubAck val | ControlPingReq val | 
    ControlPingResp val | ControlDisconnect val | None val)
```

#### Returns

* ([ControlConnect](mqtt-primitives-ControlConnect.md) val | [ControlConnAck](mqtt-primitives-ControlConnAck.md) val | [ControlPublish](mqtt-primitives-ControlPublish.md) val | 
    [ControlPubAck](mqtt-primitives-ControlPubAck.md) val | [ControlPubRec](mqtt-primitives-ControlPubRec.md) val | [ControlPubRel](mqtt-primitives-ControlPubRel.md) val | 
    [ControlPubComp](mqtt-primitives-ControlPubComp.md) val | [ControlSubscribe](mqtt-primitives-ControlSubscribe.md) val | [ControlSubAck](mqtt-primitives-ControlSubAck.md) val | 
    [ControlUnsubscribe](mqtt-primitives-ControlUnsubscribe.md) val | [ControlUnsubAck](mqtt-primitives-ControlUnsubAck.md) val | [ControlPingReq](mqtt-primitives-ControlPingReq.md) val | 
    [ControlPingResp](mqtt-primitives-ControlPingResp.md) val | [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val | [None](builtin-None.md) val)

---

### controlByte
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-139)</span>


Returns the control byte which has been checked for a valid type code


```pony
fun box controlByte()
: (U8 val | None val)
```

#### Returns

* ([U8](builtin-U8.md) val | [None](builtin-None.md) val)

---

### isA
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-147)</span>


Returns true if the top four bits in the byte passed as value match the
ControlArrayVal passed as controlType or false otherwise.


```pony
fun box isA(
  control: (ControlConnect val | ControlConnAck val | ControlPublish val | 
    ControlPubAck val | ControlPubRec val | ControlPubRel val | 
    ControlPubComp val | ControlSubscribe val | ControlSubAck val | 
    ControlUnsubscribe val | ControlUnsubAck val | ControlPingReq val | 
    ControlPingResp val | ControlDisconnect val))
: Bool val
```
#### Parameters

*   control: ([ControlConnect](mqtt-primitives-ControlConnect.md) val | [ControlConnAck](mqtt-primitives-ControlConnAck.md) val | [ControlPublish](mqtt-primitives-ControlPublish.md) val | 
    [ControlPubAck](mqtt-primitives-ControlPubAck.md) val | [ControlPubRec](mqtt-primitives-ControlPubRec.md) val | [ControlPubRel](mqtt-primitives-ControlPubRel.md) val | 
    [ControlPubComp](mqtt-primitives-ControlPubComp.md) val | [ControlSubscribe](mqtt-primitives-ControlSubscribe.md) val | [ControlSubAck](mqtt-primitives-ControlSubAck.md) val | 
    [ControlUnsubscribe](mqtt-primitives-ControlUnsubscribe.md) val | [ControlUnsubAck](mqtt-primitives-ControlUnsubAck.md) val | [ControlPingReq](mqtt-primitives-ControlPingReq.md) val | 
    [ControlPingResp](mqtt-primitives-ControlPingResp.md) val | [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val)

#### Returns

* [Bool](builtin-Bool.md) val

---

### isNotA
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-156)</span>


Embarrasingly unecccessary sugar to keep the main code clean 


```pony
fun box isNotA(
  control: (ControlConnect val | ControlConnAck val | ControlPublish val | 
    ControlPubAck val | ControlPubRec val | ControlPubRel val | 
    ControlPubComp val | ControlSubscribe val | ControlSubAck val | 
    ControlUnsubscribe val | ControlUnsubAck val | ControlPingReq val | 
    ControlPingResp val | ControlDisconnect val))
: Bool val
```
#### Parameters

*   control: ([ControlConnect](mqtt-primitives-ControlConnect.md) val | [ControlConnAck](mqtt-primitives-ControlConnAck.md) val | [ControlPublish](mqtt-primitives-ControlPublish.md) val | 
    [ControlPubAck](mqtt-primitives-ControlPubAck.md) val | [ControlPubRec](mqtt-primitives-ControlPubRec.md) val | [ControlPubRel](mqtt-primitives-ControlPubRel.md) val | 
    [ControlPubComp](mqtt-primitives-ControlPubComp.md) val | [ControlSubscribe](mqtt-primitives-ControlSubscribe.md) val | [ControlSubAck](mqtt-primitives-ControlSubAck.md) val | 
    [ControlUnsubscribe](mqtt-primitives-ControlUnsubscribe.md) val | [ControlUnsubAck](mqtt-primitives-ControlUnsubAck.md) val | [ControlPingReq](mqtt-primitives-ControlPingReq.md) val | 
    [ControlPingResp](mqtt-primitives-ControlPingResp.md) val | [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val)

#### Returns

* [Bool](builtin-Bool.md) val

---

### remainingLength
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-167)</span>


Returns the remaining length value of the packet (may be zero)


```pony
fun box remainingLength()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### fixedHeaderLength
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-175)</span>


Control byte + remainingLength bytes


```pony
fun box fixedHeaderLength()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### data
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-182)</span>


Returns the raw data used to create this BasePacket as an Array[U8] val


```pony
fun box data()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

## Private Functions

### _getControlByte
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-57)</span>


Returns the control byte if we can read the first byte of the data and the
top four bits are a valid control byte value.  
Returns None if we can't read the data or the first byte is not a valid
control byte which is defined in the specification as [1..14]
Note: We need to return the whole byte, not just the type because some
control bytes have flags in the lower four bits


```pony
fun box _getControlByte()
: (U8 val | None val)
```

#### Returns

* ([U8](builtin-U8.md) val | [None](builtin-None.md) val)

---

### _decode
<span class="source-link">[[Source]](src/mqtt-utilities/basePacket.md#L-0-81)</span>


Takes an 8 bit byte and decodes the Control Packet Type from the most
significant four bits (matching on value to get a type)


```pony
fun box _decode(
  value: (U8 val | None val))
: (ControlConnect val | ControlConnAck val | ControlPublish val | 
    ControlPubAck val | ControlPubRec val | ControlPubRel val | 
    ControlPubComp val | ControlSubscribe val | ControlSubAck val | 
    ControlUnsubscribe val | ControlUnsubAck val | ControlPingReq val | 
    ControlPingResp val | ControlDisconnect val | None val)
```
#### Parameters

*   value: ([U8](builtin-U8.md) val | [None](builtin-None.md) val)

#### Returns

* ([ControlConnect](mqtt-primitives-ControlConnect.md) val | [ControlConnAck](mqtt-primitives-ControlConnAck.md) val | [ControlPublish](mqtt-primitives-ControlPublish.md) val | 
    [ControlPubAck](mqtt-primitives-ControlPubAck.md) val | [ControlPubRec](mqtt-primitives-ControlPubRec.md) val | [ControlPubRel](mqtt-primitives-ControlPubRel.md) val | 
    [ControlPubComp](mqtt-primitives-ControlPubComp.md) val | [ControlSubscribe](mqtt-primitives-ControlSubscribe.md) val | [ControlSubAck](mqtt-primitives-ControlSubAck.md) val | 
    [ControlUnsubscribe](mqtt-primitives-ControlUnsubscribe.md) val | [ControlUnsubAck](mqtt-primitives-ControlUnsubAck.md) val | [ControlPingReq](mqtt-primitives-ControlPingReq.md) val | 
    [ControlPingResp](mqtt-primitives-ControlPingResp.md) val | [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val | [None](builtin-None.md) val)

---

