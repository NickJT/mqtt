---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

use "package:../primitives"

class PingReqPacket
"""
Respresents the PINGREQ Packet, which has only two bytes
B1: Control Byte ControlPingReq
B2: Remaining Length (always zero)

Hardly worth building a class for two bytes, but just for consistency of approach...
"""

    fun compose() : ArrayVal => [ControlPingReq() << 4; 0]
 
```````