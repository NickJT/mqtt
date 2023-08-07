use "format"
use "time"
use "../primitives"
use "debug"

class MqTime
  var _s : I64 
  var _ns : I64 
  
  new create() =>
    (_s,_ns) = Time.now()

  fun ref update() =>
    (_s,_ns) = Time.now()


  fun elapsed(finish : MqTime) =>
    """
      time from set time to finish
    """
    _elapsed(finish._s,finish._ns)

  fun elapsedString(finish : MqTime) : String val =>
    (var s , var ns) = _elapsed(finish._s,finish._ns)
    s.string() + ":" + ns.string()

  fun timestamp() : String val =>
    try
      PosixDate.create(_s,_ns).format("%Y:%m:%d %H:%M:%S")? + " [" + _s.string() + "," + _ns.string() + "]" 
    else
      "%Y:%m:%d %H:%M:%S [0 : 0]"
    end  

  fun _elapsed(s : I64 val, ns : I64 val) : (I64,I64) =>
    var sWithCarry = s
    var nsWithCarry = ns
    if (_ns > ns) then 
      nsWithCarry = nsWithCarry + 1_000_000_000
      sWithCarry = sWithCarry - 1
    end
    ((sWithCarry - _s) , (nsWithCarry- _ns))


primitive Datestamp fun apply() : String val =>
  try
    (var sec, var nano) = Time.now()
    return PosixDate.create(sec,nano).format("%Y:%m:%d %H:%M:%S")?
  else  
    return "err"
  end


primitive Timestamp fun apply() : String val =>
  try
    (var sec, var nano) = Time.now()
    return PosixDate.create(sec,nano).format("%Y:%m:%d %H:%M:%S")? + " [" + sec.string() + "," + nano.string() + "]"
  else  
    return "err"
  end

primitive Elapsed fun apply(s: I64, ns: I64, content : String val) : String val =>
  """
  Content in the form of String val = 2023:08:05 10:57:00 [123456789:123456789]
  s is seconds
  ns is nanoseconds

  return String val = elpased seconds:elpased nanoseconds
  """
  try 
    var temp : String val = content.substring((content.find("[")?+1),content.size().isize()-1) 
    var pos : USize = temp.find(",")?.usize() 
    var sStart = temp.trim(0,pos).i64()?
    var nsStart = temp.trim(pos+1).i64()?
    var sWithCarry = s
    var nsWithCarry = ns
    if (nsStart > ns) then 
      nsWithCarry = nsWithCarry + 1_000_000_000
      sWithCarry = sWithCarry - 1
    end
    (sWithCarry - sStart).string() + "," + (nsWithCarry-nsStart).string()
  else 
    "" 
  end