use "debug" 
use "../primitives"
use "../utilities"
use ".."

use "files"

actor Assembler
"""
Assembler accepts an array of bytes of arbitrary length received from the TCP buffer. It
assembles these into MQTT packets, wraps them in the BasePacket class and passess them
on the router.
Incomming TCP buffers may contain:
1.  one or more complete MQTT packets or 
2.  one or more complete MQTT packets followed by a partial packet
3.  the trailing end of a packet, followed by zero or more complete or partial packets

The only guarantee we assume is that the first buffer of data starts with the fixed 
header of a valid MQTT packet
 
I'm not using a ring buffer for packet assembly because:
- it implies copying on and copying off individual bytes
- packets would need to be assembled by appending every byte individually
- the value of the RL bytes would need to be either calculated on the fly (which is complex
 for an inner loop and would mean we have RL calculations in two places) or would mean
composing a five byte array to send to the primitive (more copying) 
- the split/chop approach provides a fast path for the 99.9?% of packets that arrive 
single and complete
TODO - Benchmark the two approaches  the performance release (maybe) 
Assembler should be the only actor that needs to deal with raw Array[U8], 
other than when router extracts the data in its send behaviour.
"""
  let _router : Router tag
  var _remainder : ArrayVal = Array[U8]
  var _pkt : ArrayVal = Array[U8]
  var packets : Array[ArrayVal] = packets.create()

  new create(router : Router tag) =>
    _router = router


/********************************************************************************/
be assemble(input: ArrayVal) =>
var buf : ArrayVal = input
while (true) do
  _pkt = split(buf)
  if (_pkt.size() > 0) then packets.push(_pkt) end
  var needed : USize = 0
  needed = TotalLength(_remainder)   // This returns zero if _remainder is empty
  if ((needed == 0) or (_remainder.size() < needed)) then break end
  buf = _remainder
  _remainder = recover val Array[U8].create() end
end

////////////// Determine how often this happens - then remove /////
//if (packets.size() == 0) then Debug("Partial packet") end
//if (packets.size() > 1) then Debug ("Multiple packets")end
///////////////////////////////////////////////////////////////////

for packet in packets.values() do 
  var basePacket : BasePacket val = recover val BasePacket(packet) end
  _router.route(consume basePacket)
end
packets.clear()


/********************************************************************************/
fun ref split(input: ArrayVal) : ArrayVal =>

  var splitAt : USize = 0
  if (_remainder.size() > 0 ) then
      splitAt = TotalLength(_remainder)
  else
    splitAt = TotalLength(input)
  end

  var b : Array[U8] iso =  Array[U8]
  b.>append(_remainder).append(input)

  var length  = b.size()
  (var h1 : ArrayVal, var h2: ArrayVal) = (consume b).chop(splitAt)
        
  if (length < splitAt ) then
    _remainder = h1 
    return h2
  end
  
  _remainder = h2
  h1

