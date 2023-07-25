/********************************************************************************/
  use "bureaucracy"
  use "collections"
  use "term"

  use "examples"
  use "primitives"
  use "subscriber"

actor Terminal
  var _subs: Map[String val, String val] = Map[String val, String val] 

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
  let _reg : Registrar

  new create(env: Env, registrar : Registrar) =>
    _out = env.out
    _reg = registrar
    _out.write(ANSI.clear())
    

    var y :U32 = _yBuf
    for key in _subs.keys() do
      _sBuf.insert(key,"")
      _sPos.insert(key,y)
      _sFirst.insert(key,true)
      _sCol.insert(key,ANSI.grey())
      y = y + 1
    end
    refreshTopics()
    _out.write(ANSI.cursor(_xCursor,_yCursor))


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
be onError(errorCode : ErrorCode, message : String val) =>
  """
  This is the route into main for errors.
  TODO - proper error handling
  """
  showMsg(errorCode.string(), ": " + message)

/********************************************************************************/    
be onBrokerConnect(message: String val) =>
  """
  Called once when the router has confirmed that we have a valid connection to the
  broker. This is the location for any app setup such as starting publication actors
  or subscribing to topics.
  TODO - Add local collection of subscribers so we can call unsubscribe on them later
  """
    showMsg(message, "")

    for (topic , qos) in _subs.pairs() do 
      Subscriber(_reg, topic, qos)
    end



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

fun startPub() =>
    showMsg("Starting timestamp publication at ", __loc.file() + " : " +__loc.method_name())
    //Timestamper(_reg)

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
