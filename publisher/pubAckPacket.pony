use "debug"
use "collections"

use "package:../primitives"
use "package:../utilities"

class PubAckPacket
"""
A PUBACK Packet is the response to a PUBLISH Packet with QoS level 1.

Fixed header
B1  Control byte (must be 0b01000000)
B2  Remaining Length - This is a single byte containing 0x02   

Variable header
B1 Packet id MSB
B2 Packet id LSB 

Payload
PubAck has no payload
"""
var _isValid : Bool = false
var _id : IdType = 0

new create() =>
  None

new val createFromPacket(pkt : BasePacket val) =>
  if (pkt.isNotA(ControlPubAck)) then
    return 
  end  

  _id = BytesToU16(pkt.data().trim(2,4)) 
  _isValid = (_id != 0)

/********************************************************************************/
fun id() : IdType =>
  """
  A public function to retrieve the id. isValid is false if id == 0
  """
  _id

/********************************************************************************/
fun isValid() : Bool =>
  """
  Returns true if the packet was fully constructed and _id is not zero
  """
  _isValid

/********************************************************************************/
fun compose(id' : U16 val) : ArrayVal=>
  """
  Compose a PubAckPacket for a give id and return directly as a ArrayVal 
  TODO - Once all the ack packets are done, check for consistency.
  """
    recover val
    var variable : Array[U8] = Array[U8].create()
    var packet : Array[U8] = Array[U8].create()
    (var msb : U8, var lsb:U8) = U16ToBytes(id')
    variable.push_u8(msb)
    variable.push_u8(lsb)

    var fixed : Array[U8] val = FixedHeader.makeHeader(ControlPubAck, (variable.size()))
  
    packet.append(fixed)
    packet.append(variable)
    consume packet
  end