use "format"
use "time"
use "../primitives"
use "debug"

class MqTime
  var _s : I64 
  var _ns : I64 
  
  new create() =>
    (_s,_ns) = Time.now()

  new create_at(s : I64, ns : I64) =>
    _s = s
    _ns = ns

  fun elapsed() : String val =>
    (var s, var ns) = Time.now()
    (var es , var ens) = _elapsed(s,ns)
    "[" + es.string() + "," + ens.string() + "]"

  fun startTime() : String val =>
    try
      PosixDate.create(_s,_ns).format("%Y:%m:%d %H:%M:%S")? + " [" + _s.string() + "," + _ns.string() + "]" 
    else
      "%Y:%m:%d %H:%M:%S [0 : 0]"
    end  

  fun _elapsed(s : I64, ns : I64) : (I64,I64) =>
    var sWithCarry = s
    var nsWithCarry = ns
    if (_ns > ns) then 
      nsWithCarry = nsWithCarry + 1_000_000_000
      sWithCarry = sWithCarry - 1
    end
    ((sWithCarry - _s) , (nsWithCarry- _ns))


primitive ElapsedSince fun apply(sFinish: I64, nsFinish: I64, start : String val) : String val =>
  """
  Content in the form of String val = 2023:08:05 10:57:00 [123456789:123456789]
  s is seconds
  ns is nanoseconds

  returns String val = elpased seconds:elpased nanoseconds
  """
  try 
    var temp : String val = start.substring((start.find("[")?+1),start.size().isize()-1) 
    var pos : USize = temp.find(",")?.usize() 
    var sStart = temp.trim(0,pos).i64()?
    var nsStart = temp.trim(pos+1).i64()?
    var sWithCarry = sFinish
    var nsWithCarry = nsFinish
    if (nsStart > nsFinish) then 
      nsWithCarry = nsWithCarry + 1_000_000_000
      sWithCarry = sWithCarry - 1
    end
    (sWithCarry - sStart).string() + "," + (nsWithCarry-nsStart).string()
  else 
    "" 
  end
  
  primitive Elapsed fun apply(start : String val) : String val =>
    (var s, var ns) = Time.now()
    ElapsedSince(s, ns, start)