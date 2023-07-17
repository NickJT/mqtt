---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

use "pony_test"
use "collections"
use "../primitives"
use "../utilities"


actor Main is TestList
    new create(env : Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
      test(_Publish9) 
      test(_Publish8)
      test(_Publish7) 
      test(_Publish1)
      test(_Publish2)
      test(_Publish3)
      test(_Publish4)
      test(_Publish5)
      test(_Publish6)

      test(_Publish10 )
      
      test(_PubAck)
      test(_PubRec)
      test(_PubRelCompose)
      test(_PubRelFromData)
      test(_PubComp)



class iso _Publish1 is UnitTest
  fun name() : String => "Publish - id=1"
  fun apply(h: TestHelper) =>
  //Publish id =1 Topic= a/b QoS 0  - 10 bytes
    var args : PublishArgs val = PublishArgs(where id' =1, topic' = "a/b", payload' = ['a';'b';'c'])  
    var result : Array[U8] val = PublishPacket.compose(args)  
    var expected : Array[U8]  = [48;8;0;3;97;47;98;97;98;99]
    h.assert_array_eq[U8](expected , result)

class iso _Publish2 is UnitTest 
  fun name() : String => "Publish - id=65281"    //Publish id =65281 Topic= a/b QoS 0  - 10 bytes
  fun apply(h: TestHelper) =>
    var args : PublishArgs val = PublishArgs(where id' =65281, topic' = "a/b", payload' = ['a';'b';'c'])  
    var result  = PublishPacket.compose(args)  
    var expected  : Array[U8] = [48;8;0;3;97;47;98;97;98;99]
    h.assert_array_eq[U8](expected , result)

class iso _Publish3 is UnitTest
  fun name() : String => "Publish - QoS1"  
    fun apply(h: TestHelper) => //Publish id = 2  Topic= a/b QoS 1  - 12 bytes
    var args : PublishArgs val = PublishArgs(where id' =2, topic' = "a/b", payload' = ['a';'b';'c'], qos' = Qos1)  
    var result  = PublishPacket.compose(args)  
    var expected  : Array[U8] = [50;10;0;3;97;47;98;0;2;97;98;99]
    h.assert_array_eq[U8](expected , result)

class iso _Publish4 is UnitTest
  fun name() : String => "Publish - QoS2"     //Publish id = 65281  Topic= a/b QoS 2  - 12 bytes
    fun apply(h: TestHelper) =>
      var args : PublishArgs val = PublishArgs(where id' =65281, topic' = "a/b", payload' = ['a';'b';'c'], qos' = Qos2)  
      var result  = PublishPacket.compose(args)  
    var expected  : Array[U8] = [52;10;0;3;97;47;98;0xff;0x01;97;98;99]
    h.assert_array_eq[U8](expected , result)

class iso _Publish5 is UnitTest
  fun name() : String => "Publish - DUP"     // Publish id = 1  Topic= a/b Dup  - 10 bytes
    fun apply(h: TestHelper) =>
       var args : PublishArgs val = PublishArgs(where id' =1, topic' = "a/b", payload' = ['a';'b';'c'], d' = true)  
      var result  = PublishPacket.compose(args)  
    var expected  : Array[U8] = [56;8;0;3;97;47;98;97;98;99]
    h.assert_array_eq[U8](expected , result)

class iso _Publish6 is UnitTest
  fun name() : String => "Publish - Retain"    //Publish id = 65281  Topic= aa/bb retain  - 10 bytes
    fun apply(h: TestHelper) =>
       var args : PublishArgs val = PublishArgs(where id' =65281, topic' = "aa/bb", payload' = ['a';'b';'c'] , r' = true)  
      var result   = PublishPacket.compose(args)  
    var expected  : Array[U8] = [49;10;0;5;97;97;47;98;98;97;98;99]
    h.assert_array_eq[U8](expected , result)

class iso _Publish7 is UnitTest
  fun name() : String => "Publish - Long Topic"
  fun apply(h: TestHelper) =>
  //Publish id 1: $SYS/broker/subscriptions/count = 0 , qos = 1 retain = true
    var args : PublishArgs val = PublishArgs(where id' =1, topic' = "$SYS/broker/subscriptions/count", payload' = ['0'], qos' = Qos1, r' = true)  
    var result   = PublishPacket.compose(args)  
    var expected : Array[U8] val = [51; 36; 0; 31; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 115; 117; 98; 115; 99; 114; 105; 112; 116; 105; 111; 110; 115; 47; 99; 111; 117; 110; 116; 0; 1; 48]
    h.assert_array_eq[U8](expected , result)

class iso _Publish8 is UnitTest
  fun name() : String => "Publish - Empty Payload"
  fun apply(h: TestHelper) =>
  //Publish id 1: $SYS/broker/subscriptions/count = 0 , qos = 1 retain = true
    var empty : Array[U8] val =  Array[U8]
     var args : PublishArgs val = PublishArgs(where id' =1, topic' = "$SYS/broker/subscriptions/count",  payload' = empty, qos' = Qos1, r' = true)  
    var result   = PublishPacket.compose(args)  
    var expected : Array[U8] val = [51; 35; 0; 31; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 115; 117; 98; 115; 99; 114; 105; 112; 116; 105; 111; 110; 115; 47; 99; 111; 117; 110; 116; 0; 1]
    h.assert_array_eq[U8](expected , result)

class iso _Publish9 is UnitTest
  fun name() : String => "Publish - Minimum Publish"
  fun apply(h: TestHelper) =>
  //Publish one character topic, qos 0 (no id)
    var empty : Array[U8] val =  Array[U8]
    var args : PublishArgs val = PublishArgs(where id' =1, topic' = "a",  payload' = empty)  
    var result   = PublishPacket.compose(args)  
    var expected : Array[U8] val = [48; 3; 0; 1; 97]
    h.assert_array_eq[U8](expected , result)


class iso _Publish10 is UnitTest
  fun name() : String => "Publish In - Long Topic"
  fun apply(h: TestHelper) =>
  //Publish id 1: $SYS/broker/subscriptions/count = 0 , qos = 1 retain = true
    var dataIn : ArrayVal = [51; 36; 0; 31; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 115; 117; 98; 115; 99; 114; 105; 112; 116; 105; 111; 110; 115; 47; 99; 111; 117; 110; 116; 0; 1; 48]
    var pubPacket : PublishPacket val = PublishPacket.createFromPacket(BasePacket(dataIn))

    var id : U16 =1
    var topic : String = "$SYS/broker/subscriptions/count"
    var q : Qos = Qos1
    var dup : Bool  = false
    var retain : Bool  = true
    var payload : ArrayVal = ['0']

    try
      h.assert_eq[U16](id, pubPacket.id() as IdType)
      h.assert_eq[String](topic, pubPacket.topic() as String val)
      h.assert_eq[Bool](true, pubPacket.qos() is q)
      h.assert_eq[Bool](false, dup)
      h.assert_eq[Bool](true, retain)
      h.assert_array_eq[U8](payload, pubPacket.payload() as Array[U8] val)
    else
      h.assert_eq[Bool](true, false)
    end

class iso _PubAck is UnitTest
  fun name() : String => "Publish - PubAck Packet"
  fun apply(h: TestHelper) =>
    var result : ArrayVal = PubAckPacket.compose(1)   
    var expected : Array[U8]= [64;2;0;1]
    h.assert_array_eq[U8](expected , result)

    result = PubAckPacket.compose(65281)   
    expected = [64;2;255;1]
    h.assert_array_eq[U8](expected , result)


class iso _PubRec is UnitTest
  fun name() : String => "Publish - PubRec Packet"
  fun apply(h: TestHelper) =>
    var result : Array[U8] val = PubRecPacket.compose(1)   
    var expected : Array[U8]=  [80;2;0;1]
    h.assert_array_eq[U8](expected , result)

    result = PubRecPacket.compose(65281)   
    expected = [80;2;255;1]
    h.assert_array_eq[U8](expected , result)


class iso _PubRelCompose is UnitTest
  fun name() : String => "Publish - PubRel Packet compose"
  fun apply(h: TestHelper) =>
    var result : Array[U8] val = PubRelPacket.create().compose(1)   
    var expected : Array[U8]= [98;2;0;1]
    h.assert_array_eq[U8](expected , result)

    result = PubRelPacket.create().compose(65281)   
    expected = [98;2;255;1]
    h.assert_array_eq[U8](expected , result)


class iso _PubRelFromData is UnitTest
  fun name() : String => "Publish - PubRel Packet From Data"
  fun apply(h: TestHelper) =>
    var data : Array[U8] val = [98;2;0;1]
    h.assert_eq[U16](1, PubRelPacket.createFromPacket(BasePacket(data)).id())

    data = [98;2;255;1]
        h.assert_eq[U16](65281, PubRelPacket.createFromPacket(BasePacket(data)).id())
  

class iso _PubComp is UnitTest
  fun name() : String => "Publish - PubComp Packet"
  fun apply(h: TestHelper) =>
    var result : Array[U8] val = PubCompPacket.compose(1)   
    var expected : Array[U8]= [112;2;0;1]
    h.assert_array_eq[U8](expected , result)

    result = PubCompPacket.compose(65281)   
    expected = [112;2;255;1]
    h.assert_array_eq[U8](expected , result)

```````