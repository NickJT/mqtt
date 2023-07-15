# FixedHeader
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-4)</span>

Makes a fixed header of between two and four bytes - present in all MQTT Control Packets  
byte 1 MQTT Control Packet type Flags specific to each MQTT Control Packet type  
byte 2 Remaining Length byte 1 (mandatory)  
[Optional Bytes] 
byte 3 Remaining Length byte 2 (only if remaining length is > 127)  
byte 4 Remaining Length byte 3 (only if remaining length is > 16383)  
byte 5 Remaining Length byte 4 (only if remaining length is > 2 097 151)  


```pony
class ref FixedHeader
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-4)</span>


```pony
new iso create()
: FixedHeader iso^
```

#### Returns

* [FixedHeader](mqtt-utilities-FixedHeader.md) iso^

---

## Public Functions

### makeHeader
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-16)</span>


 
Make a control packet header for anything other than a publish message (which needs special flags)


```pony
fun ref makeHeader(
  packetType: (ControlConnect val | ControlConnAck val | ControlPublish val | 
    ControlPubAck val | ControlPubRec val | ControlPubComp val | 
    ControlSubAck val | ControlUnsubAck val | ControlPingReq val | 
    ControlPingResp val | ControlDisconnect val | ControlPubRel val | 
    ControlSubscribe val | ControlUnsubscribe val),
  len: USize val)
: Array[U8 val] val
```
#### Parameters

*   packetType: ([ControlConnect](mqtt-primitives-ControlConnect.md) val | [ControlConnAck](mqtt-primitives-ControlConnAck.md) val | [ControlPublish](mqtt-primitives-ControlPublish.md) val | 
    [ControlPubAck](mqtt-primitives-ControlPubAck.md) val | [ControlPubRec](mqtt-primitives-ControlPubRec.md) val | [ControlPubComp](mqtt-primitives-ControlPubComp.md) val | 
    [ControlSubAck](mqtt-primitives-ControlSubAck.md) val | [ControlUnsubAck](mqtt-primitives-ControlUnsubAck.md) val | [ControlPingReq](mqtt-primitives-ControlPingReq.md) val | 
    [ControlPingResp](mqtt-primitives-ControlPingResp.md) val | [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val | [ControlPubRel](mqtt-primitives-ControlPubRel.md) val | 
    [ControlSubscribe](mqtt-primitives-ControlSubscribe.md) val | [ControlUnsubscribe](mqtt-primitives-ControlUnsubscribe.md) val)
*   len: [USize](builtin-USize.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### makePubHeader
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-63)</span>


Make a control packet header for a publish message - setting the flags from the passed arguments


```pony
fun ref makePubHeader(
  len: USize val,
  q: (Qos0 val | Qos1 val | Qos2 val) = reference,
  dup: Bool val = false,
  retain: Bool val = false)
: Array[U8 val] val
```
#### Parameters

*   len: [USize](builtin-USize.md) val
*   q: ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val) = reference
*   dup: [Bool](builtin-Bool.md) val = false
*   retain: [Bool](builtin-Bool.md) val = false

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

## Private Functions

### _make
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-26)</span>


Make a fixed header of between two and five bytes.
len is the length of the remaining packet. If len is < 128 the length of the returned 
fixed header in the array will be two bytes


```pony
fun ref _make(
  packetType: (ControlConnect val | ControlConnAck val | ControlPublish val | 
    ControlPubAck val | ControlPubRec val | ControlPubRel val | 
    ControlPubComp val | ControlSubscribe val | ControlSubAck val | 
    ControlUnsubscribe val | ControlUnsubAck val | ControlPingReq val | 
    ControlPingResp val | ControlDisconnect val),
  len: USize val,
  flags: U8 val = 0)
: Array[U8 val] val
```
#### Parameters

*   packetType: ([ControlConnect](mqtt-primitives-ControlConnect.md) val | [ControlConnAck](mqtt-primitives-ControlConnAck.md) val | [ControlPublish](mqtt-primitives-ControlPublish.md) val | 
    [ControlPubAck](mqtt-primitives-ControlPubAck.md) val | [ControlPubRec](mqtt-primitives-ControlPubRec.md) val | [ControlPubRel](mqtt-primitives-ControlPubRel.md) val | 
    [ControlPubComp](mqtt-primitives-ControlPubComp.md) val | [ControlSubscribe](mqtt-primitives-ControlSubscribe.md) val | [ControlSubAck](mqtt-primitives-ControlSubAck.md) val | 
    [ControlUnsubscribe](mqtt-primitives-ControlUnsubscribe.md) val | [ControlUnsubAck](mqtt-primitives-ControlUnsubAck.md) val | [ControlPingReq](mqtt-primitives-ControlPingReq.md) val | 
    [ControlPingResp](mqtt-primitives-ControlPingResp.md) val | [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val)
*   len: [USize](builtin-USize.md) val
*   flags: [U8](builtin-U8.md) val = 0

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### _controlPacket
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-45)</span>


Returns the code of the requested packetType with the four flags set by the lower nibble of flags


```pony
fun ref _controlPacket(
  packetType: (ControlConnect val | ControlConnAck val | ControlPublish val | 
    ControlPubAck val | ControlPubRec val | ControlPubRel val | 
    ControlPubComp val | ControlSubscribe val | ControlSubAck val | 
    ControlUnsubscribe val | ControlUnsubAck val | ControlPingReq val | 
    ControlPingResp val | ControlDisconnect val),
  flags: U8 val = 0)
: U8 val
```
#### Parameters

*   packetType: ([ControlConnect](mqtt-primitives-ControlConnect.md) val | [ControlConnAck](mqtt-primitives-ControlConnAck.md) val | [ControlPublish](mqtt-primitives-ControlPublish.md) val | 
    [ControlPubAck](mqtt-primitives-ControlPubAck.md) val | [ControlPubRec](mqtt-primitives-ControlPubRec.md) val | [ControlPubRel](mqtt-primitives-ControlPubRel.md) val | 
    [ControlPubComp](mqtt-primitives-ControlPubComp.md) val | [ControlSubscribe](mqtt-primitives-ControlSubscribe.md) val | [ControlSubAck](mqtt-primitives-ControlSubAck.md) val | 
    [ControlUnsubscribe](mqtt-primitives-ControlUnsubscribe.md) val | [ControlUnsubAck](mqtt-primitives-ControlUnsubAck.md) val | [ControlPingReq](mqtt-primitives-ControlPingReq.md) val | 
    [ControlPingResp](mqtt-primitives-ControlPingResp.md) val | [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val)
*   flags: [U8](builtin-U8.md) val = 0

#### Returns

* [U8](builtin-U8.md) val

---

### _packetType
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-54)</span>


returns the code of the requested packetType with the lower four bits set to zero


```pony
fun box _packetType(
  packetType: (ControlConnect val | ControlConnAck val | ControlPublish val | 
    ControlPubAck val | ControlPubRec val | ControlPubRel val | 
    ControlPubComp val | ControlSubscribe val | ControlSubAck val | 
    ControlUnsubscribe val | ControlUnsubAck val | ControlPingReq val | 
    ControlPingResp val | ControlDisconnect val))
: U8 val
```
#### Parameters

*   packetType: ([ControlConnect](mqtt-primitives-ControlConnect.md) val | [ControlConnAck](mqtt-primitives-ControlConnAck.md) val | [ControlPublish](mqtt-primitives-ControlPublish.md) val | 
    [ControlPubAck](mqtt-primitives-ControlPubAck.md) val | [ControlPubRec](mqtt-primitives-ControlPubRec.md) val | [ControlPubRel](mqtt-primitives-ControlPubRel.md) val | 
    [ControlPubComp](mqtt-primitives-ControlPubComp.md) val | [ControlSubscribe](mqtt-primitives-ControlSubscribe.md) val | [ControlSubAck](mqtt-primitives-ControlSubAck.md) val | 
    [ControlUnsubscribe](mqtt-primitives-ControlUnsubscribe.md) val | [ControlUnsubAck](mqtt-primitives-ControlUnsubAck.md) val | [ControlPingReq](mqtt-primitives-ControlPingReq.md) val | 
    [ControlPingResp](mqtt-primitives-ControlPingResp.md) val | [ControlDisconnect](mqtt-primitives-ControlDisconnect.md) val)

#### Returns

* [U8](builtin-U8.md) val

---

### _publishFlags
<span class="source-link">[[Source]](src/mqtt-utilities/fixedHeader.md#L-0-71)</span>


returns a control packet of the requested type with the four flags set by the lower nibble of flags


```pony
fun ref _publishFlags(
  q: (Qos0 val | Qos1 val | Qos2 val),
  dup: Bool val,
  retain: Bool val)
: U8 val
```
#### Parameters

*   q: ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val)
*   dup: [Bool](builtin-Bool.md) val
*   retain: [Bool](builtin-Bool.md) val

#### Returns

* [U8](builtin-U8.md) val

---

