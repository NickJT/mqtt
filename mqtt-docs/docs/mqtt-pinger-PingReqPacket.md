# PingReqPacket
<span class="source-link">[[Source]](src/mqtt-pinger/pingReqPacket.md#L-0-4)</span>

Respresents the PINGREQ Packet, which has only two bytes
B1: Control Byte ControlPingReq
B2: Remaining Length (always zero)

Hardly worth building a class for two bytes, but just for consistency of approach...


```pony
class ref PingReqPacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-pinger/pingReqPacket.md#L-0-4)</span>


```pony
new iso create()
: PingReqPacket iso^
```

#### Returns

* [PingReqPacket](mqtt-pinger-PingReqPacket.md) iso^

---

## Public Functions

### compose
<span class="source-link">[[Source]](src/mqtt-pinger/pingReqPacket.md#L-0-13)</span>


```pony
fun box compose()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

