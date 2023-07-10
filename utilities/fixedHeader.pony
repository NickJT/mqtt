use "../primitives"


class FixedHeader
"""
Makes a fixed header of between two and four bytes - present in all MQTT Control Packets  
byte 1 MQTT Control Packet type Flags specific to each MQTT Control Packet type  
byte 2 Remaining Length byte 1 (mandatory)  
[Optional Bytes] 
byte 3 Remaining Length byte 2 (only if remaining length is > 127)  
byte 4 Remaining Length byte 3 (only if remaining length is > 16383)  
byte 5 Remaining Length byte 4 (only if remaining length is > 2 097 151)  
"""

/********************************************************************************/
fun ref makeHeader(packetType : (CPNoFlags | CPWithFlags), len : USize) : Array[U8] val =>
""" 
Make a control packet header for anything other than a publish message (which needs special flags)
"""
match packetType 
| let noFlags : CPNoFlags => _make(packetType, len)
| let withFlags : CPWithFlags => _make(packetType, len, CPFlags()) 
end

/********************************************************************************/
fun ref _make(packetType : ControlArrayVal, len : USize, flags : U8 = 0) : Array[U8] val =>
"""
Make a fixed header of between two and five bytes.
len is the length of the remaining packet. If len is < 128 the length of the returned 
fixed header in the array will be two bytes
"""
  recover val
  var fh : Array[U8] = Array[U8]
  fh.push(_controlPacket(packetType, flags))
  if (len < 128) then 
    fh.push(len.u8())  
  else
    let rl : Array[U8] val = ValueToRLBytes(len)
    fh.append(rl,0,rl.size()) 
  end
  fh
  end

/*********************************************************************************/
    fun ref _controlPacket(packetType : ControlArrayVal, flags : U8 val = 0) : U8 =>
    """
    Returns the code of the requested packetType with the four flags set by the lower nibble of flags
    """
        var packet : U8 = _packetType(packetType)
        (packet or (flags and 0b00001111))


/********************************************************************************/
    fun _packetType(packetType : ControlArrayVal val) : U8 =>
    """
    returns the code of the requested packetType with the lower four bits set to zero
    """
        var result : U8 = packetType()
        ((result << 4) and 0b11110000) // just in case anything gets shifted in


/********************************************************************************/
fun ref makePubHeader(len : USize, q : Qos = Qos0, dup : Bool = false, retain : Bool = false): Array[U8] val =>
"""
Make a control packet header for a publish message - setting the flags from the passed arguments
"""
   _make(ControlPublish, len, _publishFlags(q, dup, retain))


/*********************************************************************************/
    fun ref _publishFlags(q : Qos, dup : Bool, retain : Bool) : U8 =>
    """
    returns a control packet of the requested type with the four flags set by the lower nibble of flags
    """
    var pubFlags : U8 = 0
    """
    dup : if the DUP flag is set to 0, it indicates that this is the first occasion that the Client
     or Server has attempted to send this MQTT PUBLISH Packet. If the DUP flag is set to 1,
    it indicates that this might be re-delivery of an earlier attempt to send the Packet.
    
    retain :  If the RETAIN flag is set to 1, in a PUBLISH Packet sent by a Client to
    a Server, the Server stores the Application Message and its QoS, so 
    that it can be delivered to future subscribers 
    
    Qos: A PUBLISH Packet MUST NOT have both QoS bits set to 1.
    """
    if (dup) then pubFlags = pubFlags or PublishDUP() end
    if (retain) then pubFlags = pubFlags or PublishRetain() end
    
    match q
    | Qos0 => pubFlags = pubFlags or PublishQos0()
    | Qos1 => pubFlags = pubFlags or PublishQos1()
    | Qos2 => pubFlags = pubFlags or PublishQos2()
    end

    pubFlags


/*********************************************************************************/
primitive ValueToRLBytes fun apply(length : USize val) : Array[U8] val=>
"""
Returns an array of bytes containing the passed length value encoded
as required for the remaining length field in the MQTT fixed header
"""  
  recover val 
    var encodedBytes : Array[U8] = encodedBytes.create()
    var encodedByte : U8 = 0  
    var x : U32 = length.u32()
    repeat 
      encodedByte = (x  %% 128).u8()  // Mod %
      x = x / 128   // div
      if (x > 0) then
       encodedByte = encodedByte or 128
      end 
      encodedBytes.push(encodedByte)
    until (not (x > 0)) end
    encodedBytes
  end