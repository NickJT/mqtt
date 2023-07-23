use "collections"
use "debug"
use "../primitives"
use "../utilities"
use "../configurator"

class ConnectPacket
"""
Fixed header  
B1  Control byte (must be 0b00010000)  
B2  Remaining Length - This is the length of variable header (10) plus the  
 length of the payload (string length + 2).  

Variable header  
B1 - B6   Protocol name (must be 0,4,M,Q,T,T)  
B7 -      Protocol Level (must be 0x04)  
B8 -      Connect Flags (see below)
B9 - B10  Keep Alive (MSB, LSB)  

Payload  
The payload of the CONNECT Packet contains one or more length-prefixed fields as  
determined by the flags in the variable header.  These fields, if present, MUST  
appear in the order
- Client Identifier  
- Will Topic  
- Will Message  
- User Name  
- Password 

""" 
  var _clientId : Array[U8] val  = Array[U8]  
  """
  The first field in the payload. This is a parameter to the constructor  
  so we don't support connections without a client id  
  """
  let _protocolName : Array[U8] val = [0;4;'M';'Q';'T';'T']
  """
  Fixed by the specification
  """
  let _protocolLevel : Array[U8] val = [4]
  """
  Fixed by the specification
  """
    var _connectFlags : U8 = DefaultConnectFlags()
  """
  Connect Flag Bits  
  - B7    User Name Flag  (set if user name is in payload)
  - B6    Password Flag   (set if password) 
  - B5    Will Retain     (set if will message is retained)
  - B4-B3 Will Qos        (0, 1 or 2 - must not be 3)
  - B2    Will Flag       (set if will topic and message)
  - B1    Clean Session   (set for server to discard previous state)
  - B0    Reserved (must be zero)
  The default value of the flags is set in the constants.pony file
  """
  let defaultKeepAlive : U8  = 60
  """
  This is a default value of the _keepAlive LSB which is used in the event we can't retrieve the 
  the string in the .ini file or convert it into a valid 16 bit number.
  """
  var _keepAlive : Array[U8] val  = [0 ; defaultKeepAlive]
  """
  Default keep alive is set to 60 seconds. Format is MSB LSB
  """

  var _cleansession : Bool  = false
  """
  Default value for cleansession
  """

  var _willTopic : Array[U8] val = Array[U8]
  """
  The topic on which the will message will be published. If a Will topic is supplied then  
  the will message must also be supplied and the three will-related flags set  
  - Will Flag
  - Will Retain
  - Will QOS
  """
  
  var _willMessage : Array[U8] val  = Array[U8]
  """
  The will message to be published
  """

  var _willQosString : String val = "qos0"
  """
  The QoS for the will message (derived from the text field in the config map) 
  """
  
  var _userName : Array[U8]  val = Array[U8]
  """
  The username of the user credentials held by the broker (not to be confused with the clientId)
  """

  var _password: Array[U8] val = Array[U8]
   """
  The password of the user credentials held by the broker
  """

  var _isValid : Bool = false
  """
  We're using this to enable testing with the Mock Broker - It can probably be optimised
  out later
  """

  new create(config : Map[String val, String val] val) =>
  """
  Create an instance of a connect packet using the passed config parameters
  """
    try
    _clientId = MqString(config(IniId())?)
    _userName = MqString(config(IniName())?)
    _password = MqString(config(IniPassword())?)
    
    _keepAlive = _makeKeepAlive(config(IniKeepalive())?)
    _cleansession = _makeSession(config(IniCleansession())?)
    _setWill(config(IniTopic())?, config(IniMessage())?, config(IniQos())?)    

    _isValid = true

    else
      Debug("Couldn't create a ConnectPacket")
    end


  fun getPacket() : ArrayVal =>
  """
  Return a connect packet ready to send to the broker
  """
    _assemble()

  fun isValid() : Bool =>
  """
  This is set false on instantiation and only set true if we have valid data
  """
    _isValid

  fun _assemble() : ArrayVal =>
  """
  Build a connect packet based on the current state of the local variables for each field
  """
  recover val
    var variable : Array[U8] = Array[U8].create()
    var payload : Array[U8] = Array[U8].create()
    var packet : Array[U8] = Array[U8].create()

    variable.append(_protocolName)
    variable.append(_protocolLevel)
    variable.push_u8(_connectFlags)
    variable.append(_keepAlive)
    
    payload.append(_clientId)

  /******* MAKE SURE THE PAYLOAD APPENDING IS DONE IN ORDER *********/
  /*
  - Will Topic  
  - Will Message  
  - User Name  
  - Password  */

    if (isSet(ConnectWill)) then
      payload.append(_willTopic)
      payload.append(_willMessage)
    end

    if (isSet(ConnectUserName)) then
        payload.append(_userName)
    end

    if (isSet(ConnectPassword)) then
        payload.append(_password)
    end

    var fh : FixedHeader = FixedHeader
    var fixed : Array[U8] val = fh.makeHeader(ControlConnect, (variable.size() + payload.size()))
    
    packet.append(fixed)
    packet.append(variable)
    packet.append(payload)
    packet
  end     

  fun isSet(flag : ConnectFlags) : Bool =>
    """
    Test the value of the passed flag in the class field and returns
    true if it is set
    """
    var testFlag : U8 = 0
    match flag
    | ConnectUserName => testFlag =  ConnectUserName() 
    | ConnectPassword => testFlag =  ConnectPassword() 
    | ConnectWRetain  => testFlag =  ConnectWRetain()  
    | ConnectWill     => testFlag =  ConnectWill()  
    | ConnectClean    => testFlag =  ConnectClean()  
    end
    ((testFlag and _connectFlags) != 0)


  fun ref _makeKeepAlive(kaString : String) : Array[U8] val => 
  """
  Sets the class variable _keepAlive that determines the keep alive time is seconds
  If we fail any of the validation tests we do not set the class variable and leave
  the packet builder to use a default value of 60 seconds
  """
    recover val
      var result : Array[U8] = [0;defaultKeepAlive]
    try
      var value : U16 = kaString.u16()?
      (var msb : U8, var lsb : U8) = Split(value)
      result(0)? = msb
      result(1)? = lsb
    else
      Debug("Couldn't convert keepAlive string <<" + kaString + ">> - using default")
    end  
      consume result
    end


  fun ref _makeSession(csString : String) : Bool =>
  """
  Sets the field controling whether we start with a clean session or restore a past 
  session. If it is true then client and broker delete the old session. If it is false
  then the client and the Broker must restore from disc and save the session after the 
  network disconnect.
  """
    if (csString == "0") then  // clear the clean session flag
      _connectFlags = _connectFlags and (not ConnectClean())
    else  // set the clean session flag
      _connectFlags = _connectFlags or ConnectClean()
    end  
    isSet(ConnectClean)


  fun ref _setWill(topic : String , msg : String , qos: String, retain : Bool = true) =>
  """
  Sets the will topic, message and handling flags  
  """
    if ((topic.size() == 0) or (msg.size() == 0)) then return end
    _willTopic = MqString(topic)
    _willMessage = MqString(msg)
    _connectFlags = _connectFlags or ConnectWill()
    if (retain == true) then
      _connectFlags = (_connectFlags or ConnectWRetain())
    end

    //if the Will Flag is set to 0, then the Will Retain Flag MUST be set to 0 (so, just in case)
    if ((not isSet(ConnectWill))) then
      _connectFlags = (_connectFlags and (not ConnectWRetain()))
    end

    _connectFlags = _connectFlags and ConnectQMask() // Sets B3 and B4 to zero
    match ToQos(qos)
    | Qos0 => None  // B3 and B4 stay zero
    | Qos1 => _connectFlags = _connectFlags or ConnectWQos1()
    | Qos2 => _connectFlags = _connectFlags or ConnectWQos2()
    end


