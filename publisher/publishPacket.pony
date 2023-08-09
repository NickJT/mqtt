use "debug"
use "collections"
use "../primitives"
use "../utilities"
use ".."

class PublishPacket
  """
  ## Packet Format ##
  ### Fixed header ###
  B1  Control byte - must be 0b0011DQQR where D:DUP flag, QQ is QOS and R is Retain
  B2. Remaining Length - This is the length of variable header plus the length of 
  the payload. The remaining length field can include 1 to 4 bytes.

  DUP - If the DUP flag is set to 0, it indicates that this is the first occasion that
  the Client or Server has attempted to send this MQTT PUBLISH Packet. If the DUP flag
  is set to 1, it indicates that this might be re-delivery of an earlier attempt to
  send the Packet. The recipient of a Control Packet that contains the DUP flag set to
  1 cannot assume that it has seen an earlier copy of this packet.

  ***QOS - The Packet Identifier field is only present in PUBLISH Packets where the QoS
  level is 1 or 2.***

  Retain - When sending a PUBLISH Packet to a Client the Server MUST set the RETAIN flag
  to 1 if a message is sent as a result of a new subscription being made by a Client. It
  MUST set the RETAIN flag to 0 when a PUBLISH Packet is sent to a Client because it
  matches an established subscription regardless of how the flag was set in the message
  it received.  
  If the RETAIN flag is set to 1, in a PUBLISH Packet sent by a CLIENT to a 
  SERVER, the Server MUST store the Application Message and its QoS, so that it can
  be delivered to future subscribers whose subscriptions match its topic name.

  ### Variable header ###
  Topic name
  B1 - Length MSB
  B2 - Length LSB
  B3-> Topic Characters

  Packet Id
  Only present in PUBLISH Packets where the QoS level is 1 or 2.
  Bn    Packet id MSB
  Bn+1  Packet id LSB 

  ### Payload ###
  The Payload contains the Application Message that is being published. 
  The content and format of the data is application specific. The length of the
  payload can be calculated by subtracting the length of the variable header from
  the Remaining Length field that is in the Fixed Header.  
  It is valid for a PUBLISH Packet to contain a zero length payload.

  ## Response ##
  The receiver of a PUBLISH Packet MUST respond as follows:
  - QoS   None
  - QoS 1 PUBACK Packet
  - QoS 2 PUBREC Packet
  """
  // Extracted data
  var _topicString : String val = String
  var _qos : Qos  = Qos0
  var _payload : Array[U8] val = Array[U8] 
  var _id : U16  = 0  // Error if not updated
  var _isValid : Bool = false
  var _controlByte : U8 = 0
  var _isDuplicate : Bool = false
  var _isRetain : Bool = false
  
  new create() =>
    """
    This creates a default initialised PublishPacket that can be used as a receiver for calls to compose. Not intended
    to be used to create PublishPackets. Use CreateFromPacket(BasePacket) to create PublishPackets.
    """
    None

  new val createFromPacket(basePacket : BasePacket val) =>
    """
    Creates a PublishPacket with the fields set from the passed BasePacket
    """  
    _build(basePacket)

/********************************************************************************/
fun ref _build(basePacket : BasePacket val) =>
  """
  An rather fiddly function to verify and decode a publish packet. Can be made
  look more simple by eliminating the intermediate variable - but we will wait until
  we have a little more confidence in using it first.
  TODO - Much of this is duplicated in BasePacket. Make BasePacket a Trait and have
  publishPacket as a decomposable
  """

  // Calculated indices
  var iTopicLen : USize  = 2
  var iTopicStart : USize = 4
  var iIdStart : USize = 0
  var iIdEnd : USize = 0
  var iTopicEnd : USize = iTopicStart
  var iPayLoadStart : USize = 0
  var iPayLoadEnd : USize = 0
  // Extracted values
  var topicLen : USize = 0
  var variableLen : USize = 0
  var payloadLen : USize = 0
  var idLen : USize = 0

  // Packet only checks control byte and remaining length bytes so we 
  // can use it with a Publish Packet to extract the control byte and
  // the flags  
  if(basePacket.isNotValid()) then
    Debug.err("Invalid packet found at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
    return
  end
  
  if (basePacket.isNotA(ControlPublish)) then
    Debug.err(ControlPublish.string() + " found at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
    return
  end

  try // Extracting all of the information from the basic packet class
    _controlByte = basePacket.controlByte() as U8   // Will error if None
    _qos = FlagsToQos(_controlByte)
    _isDuplicate = IsDup(_controlByte)
    _isRetain = IsRetain(_controlByte)
  else
    Debug.err("Couldn't get control byte at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
    return
  end

  // Allow for an id if Qos > 0 
  if (not (_qos is Qos0)) then idLen = 2 end   // No id for Qos0

  iTopicLen = basePacket.fixedHeaderLength().usize()
  // (b,b] remember
  topicLen = BytesToU16(basePacket.data().trim(iTopicLen,iTopicLen+2)).usize()

  // Topic Length is always two bytes and the topic characters follow
  iTopicStart = iTopicLen + 2  
  iTopicEnd = iTopicStart + topicLen

  iIdStart = iTopicEnd
  iIdEnd = iTopicEnd + idLen
  iPayLoadStart = iIdEnd

  // Calculate values
  variableLen = topicLen + 2 + idLen
  payloadLen = basePacket.remainingLength() - variableLen
  iPayLoadEnd = iIdEnd + payloadLen

  // Extract the data
  _topicString = String.from_array(basePacket.data().trim(iTopicStart, iTopicEnd))
  _payload= basePacket.data().trim(iPayLoadStart, iPayLoadEnd)

  if (not (_qos is Qos0)) then  
    _id = BytesToU16( basePacket.data().trim(iIdStart, iIdStart+2))
    if (_id == 0) then 
      Debug.err("No packet id (" + _id.string() + ") found at" + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
      return
    end 
  end
  _isValid = true

/********************************************************************************/
fun compose(args : PublishArgs val)  : ArrayVal => 
  """
  Returns a publish packet ready to send to the broker. 
  """

  recover val
    var variable : Array[U8]  = Array[U8].create()
    var payload' : Array[U8]   = Array[U8].create()
    var packet : Array[U8]   = Array[U8].create()
   
    // Publish packets have topic before id
    variable.append(MqString(args.topic))
    // id is only appended for QoS 1 and 2
    if (not (args.qos is Qos0) ) then
      if (args.cid == 0 ) then  
        Debug.err("Error - Publish with id = 0  at" + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string() )
      end  
      (var msb : U8, var lsb:U8) = U16ToBytes(args.cid)
      variable.push_u8(msb) 
      variable.push_u8(lsb)
    end 

    payload'.append(args.payload)

    var len : USize = variable.size() + payload'.size()
    var fixed : Array[U8] val = FixedHeader.makePubHeader(len, args.qos, args.dup, args.retain)

    packet.append(fixed)
    packet.append(variable)
    packet.append(payload')
    packet
  end   


/********************************************************************************/
fun isValid() : Bool =>
  _isValid


/************************************************************************/  
fun id() : (IdType val | None) =>
  if (_id != 0) then return _id end
  None  


/************************************************************************/  
fun qos() : Qos =>
  _qos


/************************************************************************/  
fun topic() : (String val | None) =>
  if (_topicString.size() == 0) then return None end
  // String.clone() returns an iso which is zero terminated even if the original 
  // string wasn't
  _topicString.clone()


/************************************************************************/  
fun payload() : (Array[U8] val | None) =>
  if (_payload.size() == 0) then return None end
  var payloadBytes : Array[U8] iso = Array[U8]
  for b in _payload.values() do
    payloadBytes.push(b)
  end  
  consume payloadBytes


/************************************************************************/  
fun payloadAsString() : (String val | None) =>
  if (_payload.size() == 0) then return None end
  var payloadString : String iso = String
  for c in _payload.values() do
    payloadString.push(c)
  end 
  consume payloadString

