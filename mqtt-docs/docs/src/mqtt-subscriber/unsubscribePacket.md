---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "debug"
use "package:../primitives"
use "package:../utilities"

class UnsubscribePacket
"""
Fixed header
B1  Control byte (must be 0b10100010 = Control Packet Type & 0b00000010)
B2  Remaining Length - This is the length of variable header (2 bytes) 
plus the length of the payload.   

Variable header
B1 Packet id MSB
B2 Packet id LSB 

Payload
B1  Payload Length MSB
B2  Payload Length LSB

String representation of topic name (length is NOT encoded as remaining length)
B3  Length of topic filter in bytes - MSB  
B4  Length of topic filter in bytes - LSB
B.. Characters of topic filter '$SYS/broker/load/bytes/sent/1min'

"""
  var _isValid : Bool = false
  var _id : IdType = 0

  new create() =>
  """
  Only intended to enable UnsubscribePacket.compose(<<args>>) 
  """
    None

  new val createFromPacket(basePacket : BasePacket val) =>
    """
    Creates an Unsubscribe Packet with the fields set from the passed BasePacket. Only
    used for Mock Broker 
    """  
    if (basePacket.isNotA(ControlUnsubscribe)) then
    return 
  end  

  _id = BytesToU16(basePacket.data().trim(2,4)) 
  _isValid = (_id != 0)


/********************************************************************************/
fun isValid() : Bool =>
  _isValid


/************************************************************************/  
fun id() : (IdType val | None) =>
  if (_id != 0) then return _id end
  None  


/************************************************************************/  
fun ref compose(id' : U16, topic : String) : ArrayVal =>
"""
Build an unsubscribe packet based on the passed arguments
"""
  _id = id'  
  _isValid = ((topic.size() > 0) and (_id > 0) ) // id == zero is an error marker
  recover val
    var variable :  Array[U8]  =  Array[U8].create()
    var payload :  Array[U8]  =  Array[U8].create()
    var packet :  Array[U8]  =  Array[U8].create()
    
    (var msb : U8, var lsb:U8) = U16ToBytes(_id)
    
    variable.push_u8(msb)
    variable.push_u8(lsb)
    payload.append(MqString(topic))

    var fixed :  Array[U8] val = FixedHeader.makeHeader(ControlUnsubscribe, (variable.size() + payload.size()))
    
    packet.append(fixed)
    packet.append(variable)
    packet.append(payload)
    packet
  end   


```````