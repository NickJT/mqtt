use "debug"
use "collections"
use "../primitives"

class BasePacket is Packet
"""
BasePacket is the simplest concrete representation of the Packet trait. It is used by 
Assembler to send a basic validated packet to router. 
If the BasePacket.IsValid() method returns true then BasePacket guarantees
1. The first byte of the data can be read
2. The remaining length bytes can be read
3. The length of the array matches the remaining length value
4. The control packet is valid ( 0 > b7..b4 < 15)
"""

  var _data : ArrayVal
  var _controlByte : (U8 | None) = None
  var _packetType: (ControlArrayVal | None) = None
  var _fixedHeaderLength: USize = 0
  var _totalLength: USize = 0
  var _isValid : Bool = false
  var _source : String val 


  new create(data' : ArrayVal, source : String val = "") =>
    _data = data'
    _source = source
    // If the control byte isn't accessible then we don't have a valid packet
    _controlByte = _getControlByte() 
    if (_controlByte is None) then
      Debug.err("Can't read control byte at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
      return 
    end

    // If the control byte isn't valid then we don't have a valid packet
    _packetType = _decode(_controlByte)
    if (_packetType is None) then
      Debug.err("Can't decode control byte at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
      return 
    end 

    _fixedHeaderLength = FixedHeaderLength(_data)
    _totalLength = TotalLength(_data)

    // If we can't read the remaining length bytes then we don't have a valid packet
    if (_data.size() != TotalLength(_data)) then 
        Debug.err("Data packet is an unexpected size at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
        Debug.err("TotalLength returned " + TotalLength(_data).string() + " Actual size: " + _data.size().string())
        if (_source != "") then Debug.err("Source = " + _source ) end
        return
    end

    // If we get here we have a valid packet, maybe
    _isValid = true


/*********************************************************************************/
fun _getControlByte() : (U8 | None) =>
"""
Returns the control byte if we can read the first byte of the data and the
top four bits are a valid control byte value.  
Returns None if we can't read the data or the first byte is not a valid
control byte which is defined in the specification as [1..14]
Note: We need to return the whole byte, not just the type because some
control bytes have flags in the lower four bits
"""
  var rawControlByte : U8 = 0
  try
    rawControlByte = _data(0)?
  else
    Debug.err("Packet read error at" + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
    return None
  end  
  // Check it contains a valid type code before returning it
  var result : (ControlArrayVal | None) = _decode(rawControlByte)
  if (result is None) then return None end

  rawControlByte
  

/*********************************************************************************/
  fun _decode(value : (U8 val | None)) : (ControlArrayVal | None) =>
    """
    Takes an 8 bit byte and decodes the Control Packet Type from the most
    significant four bits (matching on value to get a type)
    """
    try 
      var packetValue : U8 = value as U8 val
                 
      match ((packetValue and 0b11110000) >> 4)
      | ControlConnect() => ControlConnect
      | ControlConnAck() => ControlConnAck
      | ControlPublish()  => ControlPublish
      | ControlPubAck()   => ControlPubAck
      | ControlPubRec()  => ControlPubRec
      | ControlPubRel()  => ControlPubRel
      | ControlPubComp() => ControlPubComp
      | ControlSubscribe()  => ControlSubscribe
      | ControlSubAck()  => ControlSubAck
      | ControlUnsubscribe() => ControlUnsubscribe
      | ControlUnsubAck() => ControlUnsubAck
      | ControlPingReq() => ControlPingReq
      | ControlPingResp() => ControlPingResp
      | ControlDisconnect() => ControlDisconnect
    else
      None
    end
  else
    None 
  end  



/********************************************************************************/
/***************    Public API   ************************************************/
/********************************************************************************/
  fun isValid() : Bool =>
"""
Returns true if the packet has been validated
"""
  _isValid


/********************************************************************************/
fun isNotValid() : Bool =>
"""
Sugar to remove some nots from the main code, sorry
"""
  not _isValid

/********************************************************************************/
  fun controlType() : (ControlArrayVal  | None) =>
"""
Returns the packetType which should only be None if isValid() returns false
"""
  _packetType


/********************************************************************************/
  fun controlByte() : (U8 | None) =>
"""
Returns the control byte which has been checked for a valid type code
"""
  _controlByte


/********************************************************************************/
  fun isA(control : ControlArrayVal) : Bool =>
"""
Returns true if the top four bits in the byte passed as value match the
ControlArrayVal passed as controlType or false otherwise.
"""
  _packetType is control


/********************************************************************************/
  fun isNotA(control : ControlArrayVal) : Bool =>
"""
Embarrasingly unecccessary sugar to keep the main code clean 
"""
  if (not (_packetType is control)) then
    Debug.err(_packetType.string() + " is not a " + control.string() + " at  " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
  end
  not (_packetType is control)


/********************************************************************************/
  fun remainingLength() : USize =>
"""
Returns the remaining length value of the packet (may be zero)
"""
  _totalLength - _fixedHeaderLength


/********************************************************************************/
  fun fixedHeaderLength() : USize =>
"""
Control byte + remainingLength bytes
"""
  _fixedHeaderLength

/********************************************************************************/
  fun data() : ArrayVal =>
  """
  Returns the raw data used to create this BasePacket as an Array[U8] val
  """
   _data