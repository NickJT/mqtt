use "debug"
use "collections"

use "../primitives"
use "../utilities"
use ".."

class SubAckPacket
"""
## SubAck ##
A SUBACK Packet is sent by the Server to the Client to confirm receipt and processing of a SUBSCRIBE
Packet. A SUBACK Packet contains a list of return codes that specify the maximum QoS level that was granted
in each Subscription that was requested by the SUBSCRIBE.

### Fixed header ###
B1  Control byte (must be 0b10010000)
B2  Remaining Length - This is the length of variable header (2 bytes) 
plus the length of the payload.   

### Variable header ###
B1 Packet id MSB
B2 Packet id LSB 

### Payload ### 
B1  Return Code - The payload contains a list of return codes. Each return
code corresponds to a Topic Filter in the SUBSCRIBE Packet being acknowledged.
The order of return codes in the SUBACK Packet will match the order of Topic 
Filters in the SUBSCRIBE Packet
Payload = 0x00 - Success - Maximum QoS 0
Payload = 0x01 - Success - Maximum QoS 1
Payload = 0x02 - Success - Maximum QoS 2
Payload = 0x80 - Failure

### Actions ### 
We're not implementing the multi-subscribe capability in the specification because 
the saving in a few sub/unsub messages is outweighed by:
1. losing the "one topic:one subscriber" model
2. the additional complexity of an intermediate routing step to decompose the SubAck
from the Broker into SubAcks for individual actors.

Note: The Broker cannot conflate multiple acks into one SubAck unlessthe client subscribes to
multiple topics in one subscribe message.
"""
  var _qos : Qos  = Qos0
  var _id : U16 = 0
  var _isValid : Bool = false

  new create(basePacket : BasePacket val) =>
    var result : U8 = 0x80  // Default to rejected

    if (basePacket.isNotValid()or (basePacket.isNotA(ControlSubAck))) then 
           Debug("Invalid packet at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
        return
    end

    try 
      result = basePacket.data()(4)?
    else
      Debug("Can't read SubAck code at at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
      return
    end

    if (result == SubAckFailure()) then
      Debug("Subscription request rejected")
      return
    end
  
    match U8ToQos(result)
    | let q : Qos => _qos = q
    | None => return
    end
    
    // (b,b] remember
    _id = BytesToU16(basePacket.data().trim(2, 4)) 
    _isValid = (_id != 0)

/********************************************************************************/
  fun isValid() : Bool =>
  _isValid
    
/********************************************************************************/
  fun approvedQos() : (Qos | None )=>
    if (_isValid) then
      _qos
    else
      None
    end    

/********************************************************************************/
  fun id() : IdType =>
    _id

   