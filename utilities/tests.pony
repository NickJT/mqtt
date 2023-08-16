
use "pony_test"
use "collections"
use "package:../primitives"

actor \nodoc\ Main is TestList
  new create(env : Env) =>
  PonyTest(env, this)

  new make() =>
    None

/********************************************************************************/
fun tag tests(test: PonyTest) =>

    test(_Split)
    test(_BytesToU16)
    test(_U16ToBytes)

    test(_MqStringEmpty)
    test(_MqStringShort)
    test(_MqStringLong)
    test(_MqStringOver)

    test(_BytesToValueLim)
    test(_BytesToValueEx)

    test(_RlByteCount)

    test(_ValueToRLBytesLim)
    test(_ValueToRLBytesEx)

    test(_FPubHeader)
    test(_Fheader)


    test(_GoodPkt1)
    test(_GoodPkt2)
    test(_GoodPkt3)
    test(_GoodPkt4)
    test(_GoodPkt5)
    test(_GoodPkt6)

    test(_BadPkt1)
    test(_BadPkt2)
    test(_BadPkt3)
    test(_BadPkt4)
    test(_BadPkt5)
    test(_BadPkt6) 
/********************************************************************************/

/********************************************************************************/
class \nodoc\ iso _Split is UnitTest
    fun name() : String => "Split"
    fun apply(h: TestHelper) =>
    var value : U16 = 0
    (var msb: U8, var lsb: U8) = Split(value)
    h.assert_eq[U8](0, msb) 
    h.assert_eq[U8](0, lsb) 

    value = 0x0100
    (msb, lsb) = Split(value)
    h.assert_eq[U8](1, msb) 
    h.assert_eq[U8](0, lsb) 

    value = 0x0001
    (msb, lsb) = Split(value)
    h.assert_eq[U8](0, msb) 
    h.assert_eq[U8](1, lsb) 

    value = 0xFFFF
    (msb, lsb) = Split(value)
    h.assert_eq[U8](0xFF, msb) 
    h.assert_eq[U8](0xFF, lsb) 


/********************************************************************************/
class \nodoc\ iso _BytesToU16 is UnitTest
    fun name() : String => "U16ToBytes"
    fun apply(h: TestHelper) =>
    var b1 : Array[U8] val = [0;0]
    var b2 : Array[U8] val = [0;1]
    var b3 : Array[U8] val = [0;0x7f] //127
    var b4 : Array[U8] val = [0;0xff] //255
    var b5 : Array[U8] val = [1;0xff] //511
    var b6 : Array[U8] val = [0xff;0] //65280
    var b7 : Array[U8] val = [0xff;1] //65281
    var b8 : Array[U8] val = [0xff;0xff] //65535

    h.assert_eq[U16](0, BytesToU16(b1))
    h.assert_eq[U16](1, BytesToU16(b2))
    h.assert_eq[U16](127, BytesToU16(b3))
    h.assert_eq[U16](255, BytesToU16(b4))
    h.assert_eq[U16](511, BytesToU16(b5))
    h.assert_eq[U16](65280, BytesToU16(b6))
    h.assert_eq[U16](65281, BytesToU16(b7))
    h.assert_eq[U16](65535, BytesToU16(b8))



/********************************************************************************/
class \nodoc\ iso _U16ToBytes is UnitTest
    fun name() : String => "U16ToBytes"
    fun apply(h: TestHelper) =>
        (var b1: U8, var b0: U8) = U16ToBytes(0)
        h.assert_eq[U8](0, b1) 
        h.assert_eq[U8](0, b0) 
        (b1, b0)  = U16ToBytes(1)
        h.assert_eq[U8](0, b1) 
        h.assert_eq[U8](1, b0) 
        (b1, b0)  = U16ToBytes(127)
        h.assert_eq[U8](0, b1) 
        h.assert_eq[U8](127, b0) 
        (b1, b0)  = U16ToBytes(32512)
        h.assert_eq[U8](127, b1) 
        h.assert_eq[U8](0, b0) 
        (b1, b0)  = U16ToBytes(65535)
        h.assert_eq[U8](255, b1) 
        h.assert_eq[U8](255, b0) 


/********************************************************************************/
class \nodoc\ iso _MqStringEmpty is UnitTest
    fun name() : String => "MqString - Empty"
    fun apply(h: TestHelper) =>

    var empty : String = ""
    var emptyA : Array[U8] = [0;0]
    h.assert_array_eq[U8](emptyA, MqString(empty))

/********************************************************************************/
class \nodoc\ iso _MqStringShort is UnitTest
    fun name() : String => "MqString - Short"
    fun apply(h: TestHelper) =>

    var a : String = "a"
    var aA : Array[U8] = [0;1;'a']
    h.assert_array_eq[U8](aA, MqString(a))

    var ab : String = "ab"
    var bA : Array[U8] = [0;2;'a';'b']
    h.assert_array_eq[U8](bA, MqString(ab))


/********************************************************************************/
class \nodoc\ iso _MqStringLong is UnitTest
    fun name() : String => "MqString - Long"
    fun apply(h: TestHelper) =>

    var c : Array[U8] val = c.init('c',0xFF)
    var longer : String = String.from_array(c)
    var cA : Array[U8] = [0;0xFF]
    cA.append(c)
    h.assert_array_eq[U8](cA, MqString(longer))

    var d : Array[U8] val = d.init('d',0xFF01)
    var longd : String = String.from_array(d)
    var dA : Array[U8] = [0xFF;0x01]
    dA.append(d)
    h.assert_array_eq[U8](dA, MqString(longd))


/********************************************************************************/
class \nodoc\ iso _MqStringOver is UnitTest
    fun name() : String => "MqString - Over Length"
    fun apply(h: TestHelper) =>

    var over : Array[U8] val = over.init('e',(U16.max_value()+1).usize())
    var overLen : String = String.from_array(over)
    var eA : Array[U8] = [0x00;0x00]
    eA.append(over)
    h.assert_array_eq[U8](eA, MqString(overLen))


/********************************************************************************/
class \nodoc\ iso _BytesToValueLim is UnitTest
    fun name() : String => "BytesToValue - Limits"
    //fun  ValueToRLBytes(length : USize val) : Array[U8] val=>
    fun apply(h: TestHelper) =>
    var bytes : Array[U8] val  =[0x00;0x00]
    var expected : USize = 0
    var result : USize  = BytesToValue(bytes)
    h.assert_eq[USize](expected , result)
    bytes  =[192; 0x7F; 0xFF; 0xFF; 0xFF; 0x7F;0;0]
    expected  = 127
    result = BytesToValue(bytes)
    h.assert_eq[USize](expected , result)

    bytes  =[192; 0x80; 0x01; 0xFF; 0xFF; 0xFF; 0x7F;0;0]
    expected  = 128
    result = BytesToValue(bytes)
    h.assert_eq[USize](expected , result)

    bytes  =[192; 0xFF; 0x7F; 0xFF; 0xFF; 0xFF; 0x7F;0;0]
    expected  = 16383
    result = BytesToValue(bytes)
    h.assert_eq[USize](expected , result)

    bytes  =[192; 0x80; 0x80; 0x01; 0xFF; 0xFF; 0x7F;0;0]
    expected  = 16384
    result = BytesToValue(bytes)
    h.assert_eq[USize](expected , result)

    bytes  =[192; 0xFF; 0xFF; 0x7F; 0xFF; 0xFF; 0x7F;0;0]
    expected  = 2097151
    result = BytesToValue(bytes)
    h.assert_eq[USize](expected , result)

    bytes  =[192; 0x80; 0x80; 0x80; 0x01;0xFF; 0x7F; 0xFF; 0xFF; 0x7F;0;0]
    expected  = 2097152
    result = BytesToValue(bytes)
    h.assert_eq[USize](expected , result)

    bytes  =[192; 0xFF; 0xFF; 0xFF; 0x7F; 0x80; 0x80; 0x01;0xFF; 0x7F; 0xFF; 0xFF; 0x7F;0;0]
    expected  = 268435455
    result = BytesToValue(bytes)
    h.assert_eq[USize](expected , result)


/********************************************************************************/
class \nodoc\ iso _BytesToValueEx is UnitTest
  let b :  Array[U8] val = [0 ; 193 ; 2]
  let v :  U32 =   321
  fun name(): String => "Bytes To Value - Example"
  fun apply(h: TestHelper) =>
    h.assert_eq[USize](v.usize(), BytesToValue(b))



/********************************************************************************/
class \nodoc\ iso _RlByteCount is UnitTest
    fun name() : String => "Remaining Length - RlByteCount"
    fun apply(h: TestHelper) =>
    //  fun  RlByteCount(data : Array[U8] val) : U32 => 
    var packet : Array[U8 val] val = [192;0]
    var expected : USize val = 1
    var result : USize val = RlByteCount(packet)
    h.assert_eq[USize](expected , result)

    packet = [192;127;0;0]
    expected = 1
    result = RlByteCount(packet)
    h.assert_eq[USize](expected , result)

    packet = [192;0x80;0x01;0;0]
    expected = 2
    result = RlByteCount(packet)
    h.assert_eq[USize](expected , result)

    packet = [192;0xff;0x7f;0;0]
    expected = 2
    result = RlByteCount(packet)
    h.assert_eq[USize](expected , result)

    packet = [192;0x80; 0x80; 0x01;0;0]
    expected = 3
    result = RlByteCount(packet)
    h.assert_eq[USize](expected , result)

    packet = [192;0xFF; 0xFF; 0x7F;0;0]
    expected = 3
    result = RlByteCount(packet)
    h.assert_eq[USize](expected , result)

    packet = [192;0x80; 0x80; 0x80; 0x01;0;0]
    expected = 4
    result = RlByteCount(packet)
    h.assert_eq[USize](expected , result)

    packet = [192;0xFF; 0xFF; 0xFF; 0x7F;0;0]
    expected = 4
    result = RlByteCount(packet)
    h.assert_eq[USize](expected , result)


/********************************************************************************/
class \nodoc\ iso _ValueToRLBytesLim is UnitTest
    fun name() : String => "ValueToRLBytes - Limits"
    fun apply(h: TestHelper) =>
    var value : USize val = 0
    var expected : Array[U8] val  =[0x00]
    var result : Array[U8] val  = ValueToRLBytes(value)
    h.assert_array_eq[U8](expected , result)

    value = 127
    expected  =[0x7F]
    result  = ValueToRLBytes(value)
    h.assert_array_eq[U8](expected , result)

    value  = 128
    expected  =[0x80; 0x01]
    result = ValueToRLBytes(value)
    h.assert_array_eq[U8](expected , result)

    value  = 16383
    expected  =[0xFF; 0x7F]
    result  = ValueToRLBytes(value)
    h.assert_array_eq[U8](expected , result)

    value  = 16384
    expected  =[0x80; 0x80; 0x01]
    result  = ValueToRLBytes(value)
    h.assert_array_eq[U8](expected , result)

    value  = 2097151
    expected  =[0xFF; 0xFF; 0x7F]
    result  = ValueToRLBytes(value)
    h.assert_array_eq[U8](expected , result)

    value = 2097152
    expected  =[0x80; 0x80; 0x80; 0x01]
    result  = ValueToRLBytes(value)
    h.assert_array_eq[U8](expected , result)

    value = 268435455
    expected  = [0xFF; 0xFF; 0xFF; 0x7F]
    result = ValueToRLBytes(value)
    h.assert_array_eq[U8](expected , result)


/********************************************************************************/
class \nodoc\ iso _ValueToRLBytesEx is UnitTest
  let b :  Array[U8] val = [193;2]
  let v :  USize =   321
  fun name(): String => "ValueToRLBytes - Example"

  fun apply(h: TestHelper) =>
    h.assert_array_eq[U8](b, ValueToRLBytes(v))

/********************************************************************************/
class \nodoc\ iso _FPubHeader is UnitTest
  fun name() : String => "Fixed Header - Publish"
  fun apply(h: TestHelper) =>
    var result = FixedHeader.makePubHeader(where len = 321 , dup = false , q = Qos0, retain = false)
    var expected : Array[U8] = [48;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makePubHeader(where len = 321 , dup = true , q = Qos0, retain = false)
    expected = [56;193;2]
    h.assert_array_eq[U8](expected , result)

  result = FixedHeader.makePubHeader(where len = 321 , dup = true , q = Qos1, retain = false)
    expected = [58;193;2]
    h.assert_array_eq[U8](expected , result)

  result = FixedHeader.makePubHeader(where len = 321 , dup = true , q = Qos2, retain = false)
    expected = [60;193;2]
    h.assert_array_eq[U8](expected , result)

  result = FixedHeader.makePubHeader(where len = 321 , dup = true , q = Qos2, retain = true)
    expected = [61;193;2]
    h.assert_array_eq[U8](expected , result)

/********************************************************************************/
class \nodoc\ iso _Fheader is UnitTest
  fun name() : String => "Fixed Header - Others"
  fun apply(h: TestHelper) =>
    var result = FixedHeader.makeHeader(ControlConnect, 321)
    var expected : Array[U8]  = [16;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlConnAck, 321)
    expected = [32;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlPubAck, 321)
    expected  = [64;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlPubRec, 321)
    expected  = [80;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlPubRel, 321)
    expected  = [98;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlPubComp, 321)
    expected  = [112;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlSubscribe, 321)
    expected  = [130;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlSubAck, 321)
    expected  = [144;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlUnsubscribe, 321)
    expected  = [162;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlUnsubAck, 321)
    expected  = [176;193;2]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlPingReq, 0)
    expected  = [192;0]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlPingResp, 0)
    expected  = [208;0]
    h.assert_array_eq[U8](expected , result)

    result = FixedHeader.makeHeader(ControlDisconnect, 0)
    expected  = [224;0]
    h.assert_array_eq[U8](expected , result)
/********************************************************************************/
class \nodoc\ iso _GoodPkt1 is UnitTest
"""
Publish id 1: $SYS/broker/subscriptions/count = 0 
"""
  fun name() : String => "Good BasePacket 1"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [51; 36; 0; 31; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 115; 117; 98; 115; 99; 114; 105; 112; 116; 105; 111; 110; 115; 47; 99; 111; 117; 110; 116; 0; 1; 48]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](true, pkt.isValid())
  h.assert_eq[Bool](false, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlPublish)
  h.assert_eq[Bool](false, pkt.controlType() is ControlPubAck)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 51) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](true, pkt.isA(ControlPublish))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](36, pkt.remainingLength())
  h.assert_eq[USize](2, pkt.fixedHeaderLength())
  h.assert_eq[USize](data.size(), pkt.fixedHeaderLength() + pkt.remainingLength())
  h.assert_array_eq[U8](data, pkt.data())

/********************************************************************************/
class \nodoc\ iso _GoodPkt2 is UnitTest
"""
Packet 2 QoS: Requested QoS 1 Approved QoS 1
"""
  fun name() : String => "Good BasePacket 2"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [144; 3; 0; 2; 1]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](true, pkt.isValid())
  h.assert_eq[Bool](false, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlSubAck)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 144) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](true, pkt.isA(ControlSubAck))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPublish))
  h.assert_eq[USize](3, pkt.remainingLength())
  h.assert_eq[USize](2, pkt.fixedHeaderLength())
  h.assert_eq[USize](data.size(), pkt.fixedHeaderLength() + pkt.remainingLength())
  h.assert_array_eq[U8](data, pkt.data())
/********************************************************************************/
class \nodoc\ iso _GoodPkt3 is UnitTest
"""
Publish id 2: $SYS/broker/load/publish/sent/1min = 12.63
"""
  fun name() : String => "Good BasePacket 3"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [51; 43; 0; 34; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 108; 111; 97; 100; 47; 112; 117; 98; 108; 105; 115; 104; 47; 115; 101; 110; 116; 47; 49; 109; 105; 110; 0; 2; 49; 50; 46; 54; 51]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](true, pkt.isValid())
  h.assert_eq[Bool](false, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlPublish)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 51) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](true, pkt.isA(ControlPublish))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](43, pkt.remainingLength())
  h.assert_eq[USize](2, pkt.fixedHeaderLength())
  h.assert_eq[USize](data.size(), pkt.fixedHeaderLength() + pkt.remainingLength())
  h.assert_array_eq[U8](data, pkt.data())

/********************************************************************************/
class \nodoc\ iso _GoodPkt4 is UnitTest
"""
Packet 3 QoS: Requested QoS 1 Approved QoS 1
"""
  fun name() : String => "Good BasePacket 4"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [144; 3; 0; 3; 1]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](true, pkt.isValid())
  h.assert_eq[Bool](false, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlSubAck)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 144) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](true, pkt.isA(ControlSubAck))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPublish))
  h.assert_eq[USize](3, pkt.remainingLength())
  h.assert_eq[USize](2, pkt.fixedHeaderLength())
  h.assert_eq[USize](data.size(), pkt.fixedHeaderLength() + pkt.remainingLength())
  h.assert_array_eq[U8](data, pkt.data())

/********************************************************************************/
class \nodoc\ iso _GoodPkt5 is UnitTest
"""
Publish id 2: $SYS/broker/load/publish/sent/1min = 12.63
"""
  fun name() : String => "Good BasePacket 5"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [51; 46; 0; 36; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 108; 111; 97; 100; 47; 98; 121; 116; 101; 115; 47; 114; 101; 99; 101; 105; 118; 101; 100; 47; 49; 109; 105; 110; 0; 3; 53; 48; 50; 46; 54; 51]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](true, pkt.isValid())
  h.assert_eq[Bool](false, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlPublish)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 51) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](true, pkt.isA(ControlPublish))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](46, pkt.remainingLength())
  h.assert_eq[USize](2, pkt.fixedHeaderLength())
  h.assert_eq[USize](data.size(), pkt.fixedHeaderLength() + pkt.remainingLength())
  h.assert_array_eq[U8](data, pkt.data())

/********************************************************************************/
class \nodoc\ iso _GoodPkt6 is UnitTest
"""
Publish id 2: $SYS/broker/load/publish/sent/1min = 12.63
"""
  fun name() : String => "Good BasePacket 6"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [51; 43; 0; 33; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 108; 111; 97; 100; 47; 98; 121; 116; 101; 115; 47; 114; 101; 99; 101; 105; 118; 101; 100; 47; 49; 109; 105; 110; 0; 3; 53; 48; 50]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](true, pkt.isValid())
  h.assert_eq[Bool](false, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlPublish)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 51) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](true, pkt.isA(ControlPublish))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](43, pkt.remainingLength())
  h.assert_eq[USize](2, pkt.fixedHeaderLength())
  h.assert_eq[USize](data.size(), pkt.fixedHeaderLength() + pkt.remainingLength())
  h.assert_array_eq[U8](data, pkt.data())

/********************************************************************************/
class \nodoc\ iso _BadPkt1 is UnitTest
"""
Publish id 1: $SYS/broker/subscriptions/count = 0 
error - incorrect length (-1 byte)
"""
  fun name() : String => "Bad BasePacket 1"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [51; 36; 0; 31; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 115; 117; 98; 115; 99; 114; 105; 112; 116; 105; 111; 110; 115; 47; 99; 111; 117; 110; 116; 0; 1]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](false, pkt.isValid())
  h.assert_eq[Bool](true, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlPublish)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 51) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](true, pkt.isA(ControlPublish))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](36, pkt.remainingLength())
  h.assert_eq[USize](2, pkt.fixedHeaderLength())
  h.assert_eq[Bool](false,    data.size() == (pkt.fixedHeaderLength() + pkt.remainingLength())  )
  h.assert_eq[USize](data.size(), ((pkt.fixedHeaderLength() + pkt.remainingLength()) - 1))
  h.assert_array_eq[U8](data, pkt.data())

/********************************************************************************/
class \nodoc\ iso _BadPkt2 is UnitTest
"""
Packet 2 QoS: Requested QoS 1 Approved QoS 1
error - incorrect length (+1 byte)
"""
  fun name() : String => "Bad BasePacket 2"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [144; 2; 0; 2; 1]
    var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](false, pkt.isValid())
  h.assert_eq[Bool](true, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlSubAck)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 144) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](true, pkt.isA(ControlSubAck))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](2, pkt.remainingLength())
  h.assert_eq[USize](2, pkt.fixedHeaderLength())
  h.assert_eq[Bool](false,    data.size() == (pkt.fixedHeaderLength() + pkt.remainingLength())  )
  h.assert_eq[USize](data.size(), ((pkt.fixedHeaderLength() + pkt.remainingLength()) + 1))
  h.assert_array_eq[U8](data, pkt.data())
/********************************************************************************/
class \nodoc\ iso _BadPkt3 is UnitTest
"""
Publish id 2: $SYS/broker/load/publish/sent/1min = 12.63
error - invalid control byte (0x00)
"""
  fun name() : String => "Bad BasePacket 3"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [0; 43; 0; 34; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 108; 111; 97; 100; 47; 112; 117; 98; 108; 105; 115; 104; 47; 115; 101; 110; 116; 47; 49; 109; 105; 110; 0; 2; 49; 50; 46; 54; 51]
    var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](false, pkt.isValid())
  h.assert_eq[Bool](true, pkt.isNotValid())
  h.assert_eq[Bool](false, pkt.controlType() is ControlSubAck)
  try h.assert_eq[Bool](true, (pkt.controlByte() as None ) == None) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](false, pkt.isA(ControlPublish))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](0, pkt.remainingLength())
  h.assert_eq[USize](0, pkt.fixedHeaderLength())
  h.assert_eq[Bool](false, data.size() == (pkt.fixedHeaderLength() + pkt.remainingLength())  )
  h.assert_array_eq[U8](data, pkt.data())
/********************************************************************************/
class \nodoc\ iso _BadPkt4 is UnitTest
"""
Publish id 2: $SYS/broker/load/publish/sent/1min = 12.63
error - invalid control byte (0xF0)
"""
  fun name() : String => "Bad BasePacket 4"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [0xf0; 43; 0; 34; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 108; 111; 97; 100; 47; 112; 117; 98; 108; 105; 115; 104; 47; 115; 101; 110; 116; 47; 49; 109; 105; 110; 0; 2; 49; 50; 46; 54; 51]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](false, pkt.isValid())
  h.assert_eq[Bool](true, pkt.isNotValid())
  h.assert_eq[Bool](false, pkt.controlType() is ControlPublish)
  try h.assert_eq[Bool](true, (pkt.controlByte() as None ) == None) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](false, pkt.isA(ControlPublish))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](0, pkt.remainingLength())
  h.assert_eq[USize](0, pkt.fixedHeaderLength())
  h.assert_eq[Bool](false, data.size() == (pkt.fixedHeaderLength() + pkt.remainingLength())  )
  h.assert_array_eq[U8](data, pkt.data())
/********************************************************************************/
class \nodoc\ iso _BadPkt5 is UnitTest
"""
Publish id 1: $SYS/broker/subscriptions/count = 0 
error - incorrect length (-1 byte)
"""
  fun name() : String => "Bad BasePacket 5"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [144; 4; 0; 3; 1]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](false, pkt.isValid())
  h.assert_eq[Bool](true, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlSubAck)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 144) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](false, pkt.isA(ControlPublish))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](4, pkt.remainingLength())
  h.assert_eq[USize](2, pkt.fixedHeaderLength())
  h.assert_eq[Bool](false,    data.size() == (pkt.fixedHeaderLength() + pkt.remainingLength())  )
  h.assert_array_eq[U8](data, pkt.data())
  /********************************************************************************/
class \nodoc\ iso _BadPkt6 is UnitTest
"""
Packet 3 QoS: Requested QoS 1 Approved QoS 1
error - To many remaining length bytes
"""
  fun name() : String => "Bad BasePacket 6"
  fun apply(h: TestHelper) =>
  var data : Array[U8] val = [144; 0xFF; 0xFF; 0xFF; 0xFF; 0xFF; 0; 3; 1]
  var pkt : BasePacket= BasePacket(data)
  h.assert_eq[Bool](false, pkt.isValid())
  h.assert_eq[Bool](true, pkt.isNotValid())
  h.assert_eq[Bool](true, pkt.controlType() is ControlSubAck)
  try h.assert_eq[Bool](true, (pkt.controlByte() as U8 ) == 144) 
  else
  h.fail("Failed on control byte")
  end
  h.assert_eq[Bool](true, pkt.isA(ControlSubAck))
  h.assert_eq[Bool](true, pkt.isNotA(ControlPubAck))
  h.assert_eq[USize](0, pkt.remainingLength())
  h.assert_eq[USize](0, pkt.fixedHeaderLength())
  h.assert_eq[Bool](false,    data.size() == (pkt.fixedHeaderLength() + pkt.remainingLength())  )
  h.assert_array_eq[U8](data, pkt.data())