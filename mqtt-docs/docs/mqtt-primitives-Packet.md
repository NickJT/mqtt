# Packet
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-31)</span>

The minimum set of functions needed to extract the information in the fixed header
and enable the packet to be interpreted correctly


```pony
trait ref Packet
```

## Public Functions

### isValid
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-36)</span>


True if the packet has been validated


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### isA
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-40)</span>


True if the top four bits in the byte passed as value match the
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

### controlType
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-45)</span>


The MQTT message type which should only be None if isValid() returns false


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
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-49)</span>


The control byte which should only be None if isValid() returns false


```pony
fun box controlByte()
: (U8 val | None val)
```

#### Returns

* ([U8](builtin-U8.md) val | [None](builtin-None.md) val)

---

### fixedHeaderLength
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-53)</span>


The sum of the control byte and the number of bytes in the remaining length field.


```pony
fun box fixedHeaderLength()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### remainingLength
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-57)</span>


The decoded value of the remaining length field. 


```pony
fun box remainingLength()
: USize val
```

#### Returns

* [USize](builtin-USize.md) val

---

### data
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-61)</span>


Returns the raw bytes of the packet as a sendable array of U8 (ArrayVal)


```pony
fun box data()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

