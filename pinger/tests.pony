
use "pony_test"
use "collections"
use "package:../primitives"
use "package:../utilities"


actor \nodoc\ Main is TestList
    new create(env : Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        test(_PingReq)
        

class \nodoc\  iso _PingReq is UnitTest
  fun name() : String => "Ping request"
  fun apply(h: TestHelper) =>
  var result : Array[U8] val = PingReqPacket.compose()    
  var expected : Array[U8] = [192;0]
  h.assert_array_eq[U8](expected , result)

