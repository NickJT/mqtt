use "debug"
use "collections"

use "package:../primitives"
use "package:../utilities"

class PubRelPacket
  """
  A PUBREL Packet is the response to a PUBREC Packet. It is the third packet of the QoS 2 protocol 
  exchange

  Fixed header
  B1  Control byte (must be 0b01100010)
  B2  Remaining Length - This is a single byte containing 0x02   

  Variable header - Always bytes 2 and 3 of the packet
  B1 Packet id MSB
  B2 Packet id LSB 

  Payload
  PubRel has no payload

  Create a PubRel packet from a passed BasePacket and provide a public function to
  retrieve the id.
  TODO - Once all the ack packets are done, check for consistency. It may be better to 
  simply check for a valid packet and return the id, or zero if not valid
  """
  var _isValid : Bool = false
  var _id : IdType = 0

  new create() =>
    None

  new val createFromPacket(pkt : BasePacket val) =>
    if (pkt.isNotA(ControlPubRel)) then
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
fun compose(pktId : U16 val) : ArrayVal =>
  """
  Compose a PubRel packet for a give id and return directly as a ArrayVal 
  TODO - Once all the ack packets are done, check for consistency. Do we need a
  id != 0 check?
  """
  recover val
    var variable : Array[U8] = Array[U8].create()
    var packet : Array[U8]  = Array[U8].create()
    (var msb : U8, var lsb:U8) = U16ToBytes(pktId)
    variable.push_u8(msb)
    variable.push_u8(lsb)

    var fixed : Array[U8] val = FixedHeader.makeHeader(ControlPubRel, (variable.size()))
  
    packet.append(fixed)
    packet.append(variable)
    consume packet
  end  
