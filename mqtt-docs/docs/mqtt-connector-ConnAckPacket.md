# ConnAckPacket
<span class="source-link">[[Source]](src/mqtt-connector/conAckPacket.md#L-0-7)</span>

ConnAckPacket represents a ConnACK message from the Broker. It is receive only so it is 
never generated by the client.
The purpose of this class is to interpret a ConnAck packet and hide the internal
workings of interpretation from the router

CONNACK Packet
Fixed Header 
B0  - Control Byte = 2
B1  - Remaining Length = 2

Variable Header
B2  - Connect Acknowledge Flags (Only Bit 0 is used: 1 = session present)
B3  - Connect Return Code 

"""

```pony
class ref ConnAckPacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-connector/conAckPacket.md#L-0-35)</span>


```pony
new ref create(
  basePacket: BasePacket val)
: ConnAckPacket ref^
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [ConnAckPacket](mqtt-connector-ConnAckPacket.md) ref^

---

## Public Functions

### sessionAccepted
<span class="source-link">[[Source]](src/mqtt-connector/conAckPacket.md#L-0-64)</span>


```pony
fun box sessionAccepted()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### sessionPresent
<span class="source-link">[[Source]](src/mqtt-connector/conAckPacket.md#L-0-66)</span>


```pony
fun box sessionPresent()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### returnCode
<span class="source-link">[[Source]](src/mqtt-connector/conAckPacket.md#L-0-68)</span>


```pony
fun box returnCode()
: (ConnAckAccepted val | ConnAckRefusedProtocolVersion val | ConnAckRefusedIdentifierRejected val | 
    ConnAckRefusedServerUnavailable val | ConnAckRefusedBadUserNameOrPassword val | ConnAckRefusedNotAuthorised val)
```

#### Returns

* ([ConnAckAccepted](mqtt-connector-ConnAckAccepted.md) val | [ConnAckRefusedProtocolVersion](mqtt-connector-ConnAckRefusedProtocolVersion.md) val | [ConnAckRefusedIdentifierRejected](mqtt-connector-ConnAckRefusedIdentifierRejected.md) val | 
    [ConnAckRefusedServerUnavailable](mqtt-connector-ConnAckRefusedServerUnavailable.md) val | [ConnAckRefusedBadUserNameOrPassword](mqtt-connector-ConnAckRefusedBadUserNameOrPassword.md) val | [ConnAckRefusedNotAuthorised](mqtt-connector-ConnAckRefusedNotAuthorised.md) val)

---

