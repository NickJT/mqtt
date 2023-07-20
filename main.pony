"""
# Pony MQTT Client #

## Release Objectives ##

### Release .1 ###
1. 100% coverage of the protocol for happy path with expected i/o.
2. Wide use of guards, debug checks and error tracing
3. Separate classes for each packet type so we don't miss any variations 
4. Consistent api to avoid programming errors while things stabiliise 
5. No hard split between library and application

### Release .2 ###
1. Consider edge cases and errors
2. Split code into library and application
3. Consolidate similar classes into factory classes
4. Optimise the api (public: simple, private: efficient)  
5. Remove unnecessary intermediate variable, guards and debug checks
6. Simple GUI for testing

### Release .3 ###
1. Performance 
2. Load and memory usage
3. Optimise
"""
/************************************************************************/
  use "bureaucracy"
  use "collections"
  use "debug"
  use "net"
  use "term"

  use "configurator"
  use "examples"
  use "primitives"
  use "publisher"
  use "subscriber"

actor Main
  """
  Main is responsible for reading the config.ini file identified in the ConfigFile primitive
  and passing the Client into the TCPConnection
  Once the client is established and the Broker is connected, main subscribes to the topics
  in the .ini file 
  """
  let _reg : Registrar  = Registrar
  var _subs: Map[String val, String val] val = Map[String val, String val] 
  var _sBuf: Map[String val, String val] = Map[String val, String val]
  var _sPos: Map[String val, U32] = Map[String val, U32]
  var _sCol: Map[String val, String val] = Map[String val, String val]
  var _sFirst :  Map[String val, Bool] = Map[String val, Bool]
  let _out : OutStream

  let _yCommand : U32 = 4
  let _yMessage : U32 = 6
  let _yLine : U32 = 5
  let _yBuf : U32 = 8
  let _xTopic : U32 = 3
  let _xContent : U32 = 45

  let _xCursor : U32 = 3
  let _yCursor : U32 = 2

  new create(env: Env) =>
    _out = env.out
    _out.write(ANSI.clear())
    showMsg("Initialising", "")
  
    if (not _initialise(env, _reg) ) then 
      showMsg("Unable to initialise connection", "Quitting")
    else 
      showMsg("")
    end

    var y :U32 = _yBuf
    for key in _subs.keys() do
      _sBuf.insert(key,"")
      _sPos.insert(key,y)
      _sFirst.insert(key,true)
      _sCol.insert(key,ANSI.grey())
      y = y + 1
    end
    refreshTopics()


    let term = ANSITerm(Readline(recover Handler(env) end, env.out), env.input)
    _out.write(ANSI.cursor(_xCursor,_yCursor))
    term.prompt("> ")

    let notify = object iso
      let term: ANSITerm = term
      fun ref apply(data: Array[U8] iso) => term(consume data)
      fun ref dispose() => term.dispose()
    end

    env.input(consume notify)


/********************************************************************************/    
be onExit(diagnostic : String val) =>
  """
  Called by Client when the TCP connection is closed or if the network connection request fails 
  """
      showMsg("Exit: ", diagnostic)

/********************************************************************************/    
be onTick(sec : I64) =>
  for (topic,content) in _sBuf.pairs() do
    try if (_sCol(topic)? == ANSI.red()) then _sCol.update(topic, ANSI.green()) end end
  end
  refresh()
/********************************************************************************/    
be onMessage(topic : String val, content : String val) =>
  """
  This is the primary route into main for messages received over MQTT. It is called
  by the router for subscription receipts.
  """
  try
    if (_sFirst(topic)? == true) then 
      _sFirst.update(topic,false)
    elseif (_sBuf(topic)?.ne(content)) then 
      _sCol.update(topic,ANSI.red())
    end
    _sBuf.update(topic,content)
    refresh()
  end


/********************************************************************************/    
be onBrokerConnect(message: String val) =>
  """
  Called once when the router has confirmed that we have a valid connection to the
  broker. This is the location for any app setup such as starting publication actors
  or subscribing to topics.
  TODO - Add local collection of subscribers so we can call unsubscriber on them later
  """
    showMsg(message, "")

    for (topic , qos) in _subs.pairs() do 
      var subscriber = Subscriber(_reg, topic, qos)  
      subscriber.subscribe()
    end

    showMsg("Starting timestamp publication at ", __loc.file() + " : " +__loc.method_name())
    Timestamper(_reg)
/************************************************************************/
fun ref _initialise(env: Env, reg : Registrar) : Bool =>
  let configReader = MqttConfig(env, ConfigFile(), FullConfigParams())
  //Debug("Opening " + ConfigFile())
  if (not configReader.isValid()) then
    showMsg("Unable to read valid configuration")
    return false 
  end

  try
    var config = configReader.getConfig()
    _subs = configReader.getSubscriptions()
    var address :String val = config(IniAddress())? 
    var ipv4Address : String val = ""
    try
      ipv4Address = toIPv4(env, address) as String val
    else
      showMsg("Unable to resolve an IPv4 address from " , address)
      return false
    end  

    var port: String val = config(IniPort())?
    showMsg("Connecting to " , address + ":" + port)
    TCPConnection(TCPConnectAuth(env.root), recover Client(env, _reg, config) end, ipv4Address, port)  
  else
    showMsg("Unable to read address and port config in ", ConfigFile())
    return false
  end

  reg.update(KeyMain(), this)
  true


/************************************************************************/
fun ref refreshTopics() =>
  for (topic,content) in _sBuf.pairs() do
    try
      var y = _sPos(topic)? 
      _out.write(ANSI.cursor(_xTopic,y) + ANSI.erase(EraseLine))
      _out.write(ANSI.white() + topic)
      _out.write(ANSI.cursor(_xCursor,_yCursor))
      _out.flush()
    else
      showMsg("Error in refreshTopics" + topic," " + content)
    end
  end

/************************************************************************/
fun ref refresh() =>
  for (topic,content) in _sBuf.pairs() do
    try  
      var y = _sPos(topic)? 
      _out.write(ANSI.cursor(_xContent,y)+ ANSI.erase(EraseRight))
      _out.write(_sCol(topic)? + content)
      _out.flush()
      _out.write(ANSI.white())
      _out.write(ANSI.cursor(_xCursor,_yCursor))
      _out.flush()
    else
      showMsg("Error in refresh " + topic," " + content)
    end
  end
/************************************************************************/
fun showMsg(topic : String val, content: String val = "") =>
  _out.write(ANSI.cursor(_xTopic,_yMessage) + ANSI.erase(EraseLine) + ANSI.white())
  _out.flush()
  _out.write(ANSI.cursor(_xTopic,_yMessage) + topic)
  _out.write(ANSI.cursor(_xContent,_yMessage) + content)
  _out.write(ANSI.cursor(_xCursor,_yCursor))
  _out.flush()

/************************************************************************/
fun toIPv4(env : Env, arg : String val) : (String val | None) =>
  """
  This doesn't fit comfortably anywhere yet so we'll leave it in main for now
  TODO - Decide where network utilities should go
  """  
  if (DNS.is_ip4(arg)) then return arg end
  
  try
    var addrs : Array[NetAddress val] = DNS.ip4(DNSAuth(env.root), arg, "")
    (var addr, var port) = addrs(0)?.name()?
    return addr
  end
  None