---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

use "package:../primitives"

class DisconnectPacket
"""
Respresents the DISCONNECT Packet, which has only two bytes
B1: Control Byte ControlDisconnect
B2: Remaining Length (always zero)

After sending a DISCONNECT Packet the Client MUST close the 
Network Connection and MUST NOT send any more Control Packets.

Hardly worth building a class for two bytes, but just for consistency of approach...
"""

    fun compose() : Array[U8] val => [ControlDisconnect() << 4; 0]
 


```````