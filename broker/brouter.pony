/** use **/
  use "collections"
  use "debug"
  use "net"

  use "../assembler"
  use "../primitives"
  use "../publisher"
  use "../ticker"
  use "../utilities"


actor Brouter is Routable
  var _tcpMaybe : (TCPConnection | None)
  let _delay : USize

  let _connack : ArrayVal = [32; 2; 0; 0]
  let _subAck : ArrayVal = [44; 3; 0; 1; 0]
  let _pingResp : ArrayVal = [208; 0]

  new create(delay : USize) =>
    Debug("Broker router started")
    _tcpMaybe = None
    _delay = delay
    
be route(basePacket : BasePacket val) =>
    if (basePacket.isNotValid()) then
      Debug("Router got an invalid packet at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
      return
    end
    
    match basePacket.controlType()
      | ControlConnect => send(_connack)  // goes to subscriber but may not have an id so find by topic
      | ControlSubscribe => send(_subAck)
      | ControlPublish  => Debug(basePacket.controlType().string())
      | ControlPubAck => Debug(basePacket.controlType().string())
      | ControlPubRec => Debug(basePacket.controlType().string())
      | ControlPubRel => Debug(basePacket.controlType().string())
      | ControlPubComp => Debug(basePacket.controlType().string())
      | ControlPingReq => send(_pingResp)
    else
      Debug("Shouldn't get to " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    end

be onTCPConnect(tcp: TCPConnection) =>
  _tcpMaybe = tcp

be send(data : ArrayVal) =>
  """
  Check the TCP connection is valid and use it to send our packet
  """
  try
    var tcp : TCPConnection 
    tcp = _tcpMaybe as TCPConnection
    tcp.write(data)
  else
    Debug("Writing to invalid socket at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())  
  end  