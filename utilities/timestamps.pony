use "format"
use "time"
use "package:../primitives"
use "debug"

class MqTime
  var _ans : U128 = 0
  
  new create() =>
    (var s, var ns) = Time.now()
    _ans = _toNs(s,ns)

  fun apply() : Array[U8] val =>
    recover val 
      var a : Array[U8] = Array[U8]
      a.push_u128(_ans)
      a
    end

  fun ref elapsed() : I64 =>
    (var s, var ns) = Time.now()
    (_toNs(s,ns) - _ans).i64()

  fun ref _toNs(s : I64, ns : I64) : U128 =>
    (s.u128() * 1_000_000_000) + ns.u128()

  primitive DateString fun apply() : String val =>
    (var s, var ns) = Time.now()
    try
      PosixDate.create(s,ns).format("%Y:%m:%d %H:%M:%S")? + " [" + s.string() + "," + ns.string() + "]" 
    else
      "%Y:%m:%d %H:%M:%S [0 : 0]"
    end  
