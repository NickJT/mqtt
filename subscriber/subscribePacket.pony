use "debug"
use "../primitives"
use "../utilities"

class SubscribePacket
"""
Fixed header
B1  Control byte (must be 0b10000010 = Control Packet Type & 0b00000010)
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
B.. Requested Qos (0b000000xx) 0, 1 or 2

    if topic is "$SYS/#" = qos0
    Packet =  130, 11, 0, 1, 0, 6, 36, 83, 89, 83, 47, 35, 0
"""
  var _allGood : Bool 
  
  new create() =>
    _allGood = false

  fun ref compose(id : U16, topic : String, qosString : String) : ArrayVal =>
    """
  Return a subscribe packet ready to send to the broker
  """

    _allGood = ((topic.size() > 0) and (id > 0) ) // id == zero is an error marker
   
    recover val

      var variable : Array[U8] = Array[U8].create()
      var payload :  Array[U8]  =  Array[U8].create()
      var packet :  Array[U8]  =  Array[U8].create()
   
      (var msb : U8, var lsb:U8) = U16ToBytes(id)
   
      variable.push_u8(msb)
      variable.push_u8(lsb)
      payload.append(MqString(topic))
      payload.push_u8(ToQosBits(qosString))

      var fixed :  Array[U8] val = FixedHeader.makeHeader(ControlSubscribe, (variable.size() + payload.size()))
    
      packet.append(fixed)
      packet.append(variable)
      packet.append(payload)
      packet
    end   

