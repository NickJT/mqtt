/* Uses **************************************************************************/
  use "bureaucracy"
  use "collections"
  use "debug"
  use "term"
  use "time"
  use "package:primitives"

/* Primitives ********************************************************************/
  trait Paintable
    fun paint() : Bool 
    fun ref content() : String val

  primitive HighlightPeriod  fun apply() : U64 => 3
  primitive MSG fun value(): U64 => 1
  primitive STS fun value(): U64 => 2
  primitive FRM fun value(): U64 => 4
  primitive CMD fun value(): U64 => 8
  type Areas is Flags[(MSG | STS | FRM | CMD)] 

class StatusLine is Paintable
  var _content : String val
  var _paint : Bool
  var _colour : String val = ANSI.green()
  new create(content' : String val) =>
    _content = content'
    _paint = true 

  fun paint() : Bool => _paint
  fun ref content() : String val =>
    _content
  fun ansi(left : U32, y : U32) : String val =>
    ANSI.cursor(left,y) 
    + _colour
    + _content
  fun string() : String val =>
    _content + "(" + _paint.string() + ")"

class BoxLine is Paintable
  var _topic : String val
  var _content : String val
  var _topicColour : String val =  ANSI.grey()
  var _contentColour : String val =  ANSI.grey()
  var _paint : Bool
  var _timeStamp : I64
  new create(topic : String val, content' : String val) =>
    _topic = topic
    _content = content'
    _timeStamp = Time.seconds()
    _paint = true
  fun ref setPaint() => _paint = true
    _timeStamp = Time.seconds()

  fun paint() : Bool => _paint
  fun ref content() : String val => 
    _paint = false
    _content
  
  fun ref update(content' : String val) =>
    _timeStamp = Time.seconds()
    _content = content'
    if (_contentColour == ANSI.grey()) then  
      _contentColour = ANSI.red()
      _topicColour = ANSI.white()
    end
    _paint = true
  fun ansi(left : U32, right :U32, y : U32) : String val =>
    ANSI.cursor(left,y) 
    + _topicColour
    + _topic
    + ANSI.cursor(right,y) 
    + _contentColour
    + _content

actor Terminal
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
    let _boxBuf : Array[BoxLine] = Array[BoxLine]
    let _boxMap : Map[String val, BoxLine] = Map[String val, BoxLine](_boxHeight.usize())
    let _paintAreas : Areas = Areas
    var _command : String val = Commands()
  /* Colours ********************************************************/
    let _borderColour : String val = ANSI.grey()
    let _separatorColour : String val = ANSI.grey()
    let _cmdColour : String val = ANSI.white()
    let _boxColour : String val = ANSI.white()
    let _statusColour : String val = ANSI.green()

new create(env: Env) =>
  _out = env.out
  for i in Range[U32](0,_statusHeight) do 
    _statusBuf.push(StatusLine("-"))
  end
  clearAll()
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
  try
    _statusBuf.shift()?
    _statusBuf.push(StatusLine(content))
    _paintAreas.set(STS)
    paint()
  end  

be clear() =>
  Debug("Got a clear - clearing the status buffer" where stream = DebugErr)
  _statusBuf.clear()
  clearAll()
  _paintAreas.set(FRM)
  _paintAreas.set(CMD)
  paint()
be size(rows: U16 val, cols: U16 val) =>
  """
    Called by ANSINotify to report the cmd window size
  """
  status("Windows size is " + rows.string() + " rows by " + cols.string() + " cols")

fun ref paint() =>
  _out.write(composite())
  _out.flush()

fun ref clearAll() =>
  _out.write(ANSI.clear() + ANSI.reset() + ANSI.white() + windowSize(_width, _height))
  _out.flush()
  Debug("Doing clearAll" where stream = DebugErr)

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
  paintString = paintString + ANSI.cursor(_width,_cmdY) + _cmdColour 
  paintString 

fun windowSize(w : U32, h: U32) : String val =>
  "\e[8;" + h.string() + ";" + w.string() + "t" 

fun cmdString() : String val =>
  Debug(_command where stream = DebugErr)
  ANSI.cursor(_left,_cmdY) + _cmdColour + "Commands - " + _command
fun ref boxString() : String val =>
  var result : String val = String
  var y : U32 = 0
  for line in _boxMap.values() do 
    result = result + line.ansi(_left,_right,y + _boxTopY)
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
  ANSI.cursor(0,y) + _separatorColour + separator(width)

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
    stg.append(_borderColour)
    for y in Range[U32](1,_height) do 
      stg.append(ANSI.cursor(x,y) + "|")
    end
    stg
  end  