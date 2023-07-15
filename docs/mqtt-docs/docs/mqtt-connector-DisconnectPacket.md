# DisconnectPacket
<span class="source-link">[[Source]](src/mqtt-connector/disconnectPacket.md#L-0-4)</span>

Respresents the DISCONNECT Packet, which has only two bytes
B1: Control Byte ControlDisconnect
B2: Remaining Length (always zero)

After sending a DISCONNECT Packet the Client MUST close the 
Network Connection and MUST NOT send any more Control Packets.

Hardly worth building a class for two bytes, but just for consistency of approach...


```pony
class ref DisconnectPacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-connector/disconnectPacket.md#L-0-4)</span>


```pony
new iso create()
: DisconnectPacket iso^
```

#### Returns

* [DisconnectPacket](mqtt-connector-DisconnectPacket.md) iso^

---

## Public Functions

### compose
<span class="source-link">[[Source]](src/mqtt-connector/disconnectPacket.md#L-0-16)</span>


```pony
fun box compose()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

