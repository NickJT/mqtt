/* Uses **************************************************************************/
  use "time"
  use "collections"
  use "term"
  use "debug"
  use "package:../primitives"
  use "package:../utilities"

/* Primitives ********************************************************************/
  primitive HighlightPeriod  fun apply() : U64 => 3
  primitive MSG fun value(): U64 => 1
  primitive STS fun value(): U64 => 2
  primitive FRM fun value(): U64 => 4
  primitive CMD fun value(): U64 => 8
  type Areas is Flags[(MSG | STS | FRM | CMD)] 

class StatusLine
  var _content : String val
  var _paint : Bool
  var _colour : String val =  DisplayColour.status()
  new create(content' : String val) =>
    _content = content'
    _paint = true 

  fun paint() : Bool => _paint

  fun ansi(left : U32, y : U32) : String val =>
    ANSI.cursor(left,y) 
    + _colour
    + _content
  fun string() : String val =>
    _content + "(" + _paint.string() + ")"

class BoxLine
  var _topic : String val
  var _content : String val
  var _lastContent : String val = String
  var _topicColour : String val =  DisplayColour.boxDormant()
  var _contentColour : String val =  DisplayColour.boxDormant()
  var _paint : Bool
  var _timeStamp : I64
  new create(topic : String val, content' : String val) =>
    _topic = topic
    _content = content'
    _timeStamp = Time.seconds()
    _paint = true
  
  fun paint() : Bool => _paint
  fun ref deadline(seconds : I64) =>
    if ((_contentColour == DisplayColour.boxChange()) and (_timeStamp < seconds)) then 
      _contentColour = DisplayColour.boxNormal()
      _paint = true
    end
  
  fun ref update(content' : String val) =>
    if (_topicColour == DisplayColour.boxDormant()) then  
      _topicColour = DisplayColour.boxNormal()
      _paint = true
    end
    
    // TODO - Note that _timeStamp is the time of the last change NOT the
    // last update. Don't use this for timing publication
    if (content' != _content) then 
      _timeStamp = Time.seconds()
      _lastContent = _content = content'
      _contentColour = DisplayColour.boxChange()
      _paint = true
    end
   
  
  fun ref ansi(left : U32, right :U32, y : U32) : String val =>
    _paint = false
    ANSI.cursor(left,y) + ANSI.erase(EraseRight)
    + _topicColour
    + _topic
    + ANSI.cursor(right,y) + ANSI.erase(EraseRight)
    + _contentColour
    + _content

actor Display
  /* Dimensions ********************************************************/
    let _out : OutStream
    let _width : U32 = 128
    let _height : U32 = 40
    let _left : U32 = 2
    let _right : U32 = _width / 2
    let _topSpacerY : U32 = 1 
    let _cmdY : U32 = _topSpacerY + 1 
    let _cmdHeight : U32 = 1
    let _cmdSpacerY : U32 = _cmdY + _cmdHeight
    let _boxTopY : U32 = _cmdSpacerY + 1  
    let _statusHeight : U32 = 4
    let _statusYTop : U32 = _height -1 - _statusHeight   // subtract 1 so we don't scroll on exit
    let _boxSpacerY : U32 = _statusYTop -1
    let _boxBottomY : U32 = _boxSpacerY -1   
    let _boxHeight : U32 = _boxSpacerY - _boxTopY
    let _statusYBottom : U32 = (_statusYTop + _statusHeight) - 1
    let _statusSpacerY : U32 = _statusYBottom + 1

  /* Structures *********************************************************/
    let _statusBuf : Array[StatusLine] = Array[StatusLine]
    let _boxMap : Map[String val, BoxLine] = Map[String val, BoxLine](_boxHeight.usize())
    let _paintAreas : Areas = Areas
    var _commands : String val = Commands()
    let _env : Env
    let _uim : UIManager // Timer for message highlighting

new create(env: Env) =>
  _env = env
  _out = env.out
  _uim = UIManager(this)

  for i in Range[U32](0,_statusHeight) do 
    _statusBuf.push(StatusLine("-"))
  end
  clearScreen()
  _paintAreas.all()
  paint()

be message(topic: String val, content : String val) =>
  if _boxMap.contains(topic) then
    try _boxMap(topic)?.update(content) end
  else
    _boxMap.insert(topic,BoxLine(topic,content))
  end
  _paintAreas.set(MSG)
  paint()

be status(content : String val) => 
  if _statusBuf.size() == _statusHeight.usize() then 
    try _statusBuf.shift()? end
  end
  _statusBuf.push(StatusLine(content))
  _paintAreas.set(STS)
  paint()

be clear() =>
  // Don't clear the subscriptions box because we haven't unsubscribed
  //_boxMap.clear()
  _statusBuf.clear()
  clearScreen()
  _paintAreas.all()
  paint()

be size(rows: U16 val, cols: U16 val) =>
  """
    Called by ANSINotify to report the cmd window size
  """
  status("Windows size is " + rows.string() + " rows by " + cols.string() + " cols")

be onTick(seconds : I64) =>
  timeout(seconds)
  // Anything else?

be onExit(code : U8) =>
  Debug.err("Display onExit with " + code.string())
  _uim.cancel()
  clearScreen()

fun ref paint() =>
  _out.write(composite())
  _out.flush()

fun ref clearScreen() =>
  _out.write(ANSI.clear() + ANSI.reset() + ANSI.white() + windowSize(_width, _height))
  _out.flush()

fun ref composite() : String val =>
  var paintString : String val = String
  if _paintAreas(FRM) then 
    paintString = 
      border(1) + border(_width)
      + separatorLine(_topSpacerY, _width)
      + separatorLine(_cmdSpacerY, _width)
      + separatorLine(_boxSpacerY, _width)
      + separatorLine(_statusSpacerY, _width)
  end
  if _paintAreas(CMD) then 
    paintString = paintString + cmdString()
  end
  if _paintAreas(MSG) then 
    paintString = paintString  + boxString() 
  end  
  if _paintAreas(STS) then 
    paintString = paintString   + statusString()
  end

  _paintAreas.clear()
  paintString = paintString + ANSI.cursor(_width,_cmdY) + DisplayColour.cmd() 
  paintString 

fun windowSize(w : U32, h: U32) : String val =>
  "\e[8;" + h.string() + ";" + w.string() + "t" 

fun cmdString() : String val =>
  ANSI.cursor(_left,_cmdY) + DisplayColour.cmd() + "Commands - " + _commands
fun ref boxString() : String val =>
  var result : String val = String
  let unsorted : Array[String val] = Array[String val].create(_boxMap.size()) 
  unsorted.concat(_boxMap.keys(),0)
  let sorted = Sort[Array[String val], String](unsorted)

  var y : U32 = 0
  for topic in sorted.values() do 
    try result = result + _boxMap(topic)?.ansi(_left,_right,y + _boxTopY) end
    y = y + 1
  end
  result
  
fun ref statusString() : String val =>
  var result : String val = ANSI.erase(EraseRight)
  var y : U32 = 0
  for line in _statusBuf.values() do 
    result = result + line.ansi(_left, _statusYTop + y) + ANSI.erase(EraseRight) + border(_width) 
    y = y + 1
  end
  result

fun separatorLine(y : U32, width : U32) : String val =>
  ANSI.cursor(0,y) + DisplayColour.separator() + separator(width)

fun separator(width : U32) : String val =>
  var arrayVal : Array[U8] val = recover val
    var array : Array[U8] = Array[U8].init(0x2d, width.usize())
    try
        array(0)? = '|'
        array(width.usize()-1)? = '|'
    end
    array
  end  
  String.from_array(arrayVal)

fun border(x : U32) : String val =>
  recover val 
    var stg : String ref  = String
    stg.append(DisplayColour.border())
    for y in Range[U32](1,_height) do 
      stg.append(ANSI.cursor(x,y) + "|")
    end
    stg
  end   
fun ref timeout(seconds : I64) =>
  var limit : I64 = seconds - 2
  var refreshNeeded : Bool = false
  for line in _boxMap.values() do 
    line.deadline(limit)
    refreshNeeded = refreshNeeded or line.paint()
  end 
  if refreshNeeded then  
    //status("Timeout refresh at " + seconds.string())
    _paintAreas.set(MSG)
    paint()
  end
