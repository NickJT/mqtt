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
        test(_Subscribe)
        test(_Unsubscribe)

class iso _Subscribe is UnitTest
  fun name() : String => "Subscribe"
  fun apply(h: TestHelper) =>
    //Subscribe id = 1 Topic= a/b QoS 0 - 10 bytes
    var result : Array[U8] val = SubscribePacket.compose(1,"a/b","qos0")  
    var expected : Array[U8]  = [130;8;0;1;0;3;97;47;98;0]
    h.assert_array_eq[U8](expected , result)

    //Subscribe id = 65281 Topic= a/b QoS 0 - 10 bytes
    result = SubscribePacket.compose(65281,"a/b","qos0")  
    expected = [130;8;255;1;0;3;97;47;98;0]

    //Subscribe id = 1 Topic= a/b QoS 1 - 10 bytes
    result = SubscribePacket.compose(1,"a/b","qos1") 
    expected = [130;8;0;1;0;3;97;47;98;1]

    //Subscribe id = 65281 Topic= a/b QoS 1 - 10 bytes
    result = SubscribePacket.compose(65281,"a/b","qos1")  
    expected = [130;8;255;1;0;3;97;47;98;0]

    //Subscribe id = 1 Topic= a/b QoS 2 - 10 bytes
    result = SubscribePacket.compose(1,"a/b","qos2") 
    expected = [130;8;0;1;0;3;97;47;99;2]

    //Subscribe id = 65281 Topic= a/b QoS 2 - 10 bytes
    result = SubscribePacket.compose(65281,"a/b","qos2")  
    expected = [130;8;0;1;0;3;97;47;99;2]


class iso _Unsubscribe is UnitTest
  fun name() : String => "Unsubscribe"
  fun apply(h: TestHelper) =>
    //Subscribe id = 1 Topic= a/b QoS 0 - 10 bytes
    var result : Array[U8] val = UnsubscribePacket.compose(1,"a/b")  
    var expected : Array[U8]  = [162;7;0;1;0;3;97;47;98]
    h.assert_array_eq[U8](expected , result)

    //Subscribe id = 65281 Topic= a/b QoS 0 - 10 bytes
    result = UnsubscribePacket.compose(65281,"a/b")  
    expected = [162;7;255;1;0;3;97;47;98]
   
```````