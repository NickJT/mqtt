use "collections"
use "debug"
use "../primitives"

/********************************************************************************/
primitive Split
  """
  Split the provided U16 into two U8 bytes `
  """
  fun apply(value : U16) : (U8 , U8) =>
    var msb : U16 = ((value and 0b1111111100000000) >> 8)
    var lsb : U16 = value and 0b0000000011111111
    (msb.u8(),lsb.u8())
        

/********************************************************************************/
primitive U16ToBytes
  """ 
  Convert a U16 into two U8 bytes where the first byte is the msb of the original U16. 
  Just a pass-through for Split at present.
  TODO - Endian for different platforms?
  """
  fun apply(value: U16 val) : (U8 val, U8 val) =>
    Split(value)


/********************************************************************************/
primitive BytesToU16 
  """
  Converts an Array of two U8 bytes into a U16 packtId. Note that the spec defines
  a valid Id to be non-zero, so we can use zero as an error case
  """
  fun apply(bytes : Array[U8] val) : U16 =>
  // ((msb << 8) + lsb).u16()  Triggers a llvm bug request
    try 
      (bytes(0)?.u16() << 8) + bytes(1)?.u16()
    else
      Debug.err("Couldn't read id data at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
      0
    end 

/********************************************************************************/
primitive MqString
  """
  Converts a standard string into a sequence of bytes representing the format used for 
  strings in the MQTT spec. This has a two byte length field followed by the bytes of 
  the charaacters. The MQTT version of an empty string is two bytes of zeros
  """
  fun apply(stg : String val) : Array[U8] val =>
    recover val
      let result : Array[U8] = result.init(0,2)  
      let length : USize = stg.size()
      // The MQTT version of an empty string is two bytes of zeros
      if (length > 0) and (length < (U16.max_value()).usize()) then
        (var msb , var lsb ) = Split(length.u16())
        try result(0)? = msb end
        try result(1)? = lsb end
        result.append(stg.array(), 0, length)      
      end
      result
    end


/********************************************************************************/
primitive ToQos fun apply(stg : String) : Qos =>
  """
  Takes a string and matches it against the qos patterns. Anything that
  doesn't match returns QOS0 ( = 0)
  """
  var lcStg = stg.lower()
  match lcStg
    | "qos0" => Qos0
    | "qos1" => Qos1
    | "qos2" => Qos2
  else
    Qos0
  end 


/********************************************************************************/
primitive ToQosBits fun apply(stg : String) : U8 =>
  """
  Takes a string and matches it against the qos patterns. Anything that
  doesn't match returns QOS0 ( = 0)
  """
  var lcStg = stg.lower()
  match lcStg
    | "qos0" => Qos0()
    | "qos1" => Qos1()
    | "qos2" => Qos2()
  else
    Qos0()
  end  

/********************************************************************************/
primitive U8ToQos fun apply(value : U8) : (Qos | None) =>
  """
  Take a U8 and returns a Qos type from QoS0 to QoS2. Returns None for
  any other value
  """
  match value
  | 0 => Qos0
  | 1 => Qos1
  | 2 => Qos2
  else
    Debug.err("Got invalid QoS value ("+value.string() + ") at" + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    None
  end 


/********************************************************************************/
primitive IsFixedHeader fun apply(data : ArrayVal) : Bool =>
  // RL can be up to four bytes (bytes 1 to 4). If we get a clear contunue bit 
  //anywhere in bytes 1 to 4 we're valid. If we get to byte 4 or we run out of bytes
  // without getting a clear but then we're false
  for index in Range[USize](1, 5) do     // half open range remember
    try
      if ((data(index)? and 0x80) == 0) then return true end
    else
      return false  // got to the end of the data
    end
  end 
  false  // got to byte 4


/********************************************************************************/
primitive TotalLength fun apply(data : ArrayVal box) : USize =>
  """
  Convenience function that calculates the total length of a packet by summing:
  1.  The fixed header length
  2.  The value of the remaining length field
  TODO - Optimise so we don't scan twice
  """
  var fhl : USize = FixedHeaderLength(data)
  if (fhl == 0) then return 0 end
  fhl + BytesToValue(data)


/********************************************************************************/
primitive FixedHeaderLength fun apply(data : ArrayVal box) : USize =>
  var count : USize = RlByteCount(data)
  if (count == 0) then return 0 end
  count + 1


/********************************************************************************/
primitive BytesToValue fun  apply(data : Array[U8] box) : USize =>
  """
  Takes the leading bytes of an MQTT packet and returns the remaining length encoded
  in bytes 1 to n, where 0 < n < 4. If n > 4, zero is returned as the packet cannot 
  meet the MQTT protocol standard.
  Note - This function takes the leading bytes including the control byte (Byte 0) that
  is not used in the BytesToValue calculation (hence index is defined as 1 below).
  """
  var multiplier : U32 = 1
  var value : U32 = 0
  let startIndex : USize = 1  // Remaining length bytes always start at byte 1
  var index : USize = 0       // Keep start index separate otherwise index -> 5
  var encodedByte : U8 = 0
  repeat
   try encodedByte = data(startIndex + index)? end
  index = index + 1
  value = value + ((encodedByte and 127).u32() * multiplier)
  multiplier = multiplier * 128
  if (index > 4) then Debug.err("Error inBytesToValue") ; return 0 end
    until ((encodedByte and 128) == 0) end
    value.usize()


/********************************************************************************/
primitive RlByteCount fun  apply(data : Array[U8] box) : USize =>
  """ 
  Returns the number of bytes in the remaining length field of the fixed header  
  """
  let startIndex : USize = 1  // Remaining length bytes always start at byte 1
  var index : USize = 0 
  var encodedByte : U8 = 0
  repeat
  try encodedByte = data(startIndex + index)? end
  index = index + 1
  if (index > 4) then Debug.err("Remaining Length Overflow") ; return 0 end
  until ((encodedByte and 128) == 0) end
  index

