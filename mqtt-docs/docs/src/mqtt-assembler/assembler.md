---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "debug" 
use "package:../primitives"
use "package:../router"
use "package:../utilities"
use ".."

use "files"

actor Assembler
"""
We're using a ring buffer for packet assembly because:
- it implies copying on and copying off individual bytes
- packets would need to be assembled by appending every byte individually
- the value of the RL bytes would need to be either calculated on the fly (which is complex
 for an inner loop and would mean we have RL calculations in two places) or would mean
composing a five byte array to send to the primitive (more copying) 
- the _split/chop approach provides a fast path for the 99.9?% of packets that arrive 
single and complete
TODO - Benchmark the two approaches  the performance release (maybe) 
Assembler should be the only actor that needs to deal with raw Array[U8], 
other than when router extracts the data in its send behaviour.
"""
  let _router : Router tag
  var _remainder : ArrayVal = Array[U8]
  var _empty : ArrayVal = Array[U8]
  var _pkt : ArrayVal = Array[U8]
  var _packets : Array[ArrayVal] = _packets.create()
  new create(router : Router tag) =>
    _router = router

/********************************************************************************/
be assemble(input: ArrayVal) =>
  """
  We need to handle the case where we receive only the first byte of the packet OR
  where we don't have enough data to calculate the packet length.  
  If byte n has bit 7 set then byte n+1 is also a remaining length byte so the minimum 
  viable fixed header is control byte + bytes until we get to a byte with bit 7 == 0
  """
var buf : ArrayVal = input

while (true) do
  _pkt = _split(buf)
  if (_pkt.size() > 0) then  // _pkt is a valid packet
     _packets.push(_pkt)
  end
  // we have a remainder that might be one or more valid packets
  // if we don't have a fixed packet break and get more input 
  if (not IsFixedHeader(_remainder)) then break end

  // We have a valid FH so how may bytes do we need?
  if (_remainder.size() < TotalLength(_remainder)) then break end
  // we may have another packet so go around again
  buf = _remainder
  _remainder = recover val ArrayVal end
end

for packet in _packets.values() do 
  var basePacket : BasePacket val = recover val BasePacket(packet) end
  _router.route(basePacket)
 end
 _packets.clear()

/********************************************************************************/
fun ref _split(input: ArrayVal) : ArrayVal =>
  // TODO - Needs optimising. Note: initial benchmark suggests this version is quicker
  // than doing a ._split every time and then swapping  
  // append the new input to the last remainder
  var mudge : ArrayVal = recover val Array[U8].>append(_remainder).>append(input) end
  // if we still haven't got a complete fixed header then the new value is all remainder
  if (not IsFixedHeader(mudge)) then
    _remainder = mudge
    return _empty
  end
  // If we get here then we have a complete Fixed Header so
  // we know how many bytes we need to complete the packet
  var len : USize = mudge.size()
  var splitAt : USize = TotalLength(mudge)
  
  if (splitAt > len) then   // We don't have a complete packet so it's all remainder
    _remainder = mudge
    return _empty
  elseif (splitAt < len) then  // then we have a complete packet and a remainder
    _remainder = mudge.trim(splitAt)  
    return mudge.trim(0,splitAt)
  else    // (splitAt == mudge.size()) and we have a complete packet and no remainder
    _remainder = _empty
    return mudge
  end

```````