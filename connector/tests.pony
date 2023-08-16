
use "pony_test"
use "collections"
use "package:../primitives"
use "package:../utilities"


class \nodoc\  TestConfig
  fun fullConfig() : Map[String, String] val =>
    recover val
        let config : Map[String, String] = Map[String, String]
        config.insert("address", "192.168.86.98")
        config.insert("port", "1338")
        config.insert("id","PonyClient")
        config.insert("keepalive","11")

        config.insert("topic","LWandT")
        config.insert("message","Goodbye!")
        config.insert("qos","qos0")

        config.insert("name","nick")
        config.insert("password","abcdef")

        config.insert("$SYS/Broker","QOS0")
        config.insert("$SYS/Load","qos0")
        config.insert("pico/#","QOS0")
        consume config
    end

  fun minConfig() : Map[String, String] val =>
    recover val
      let config : Map[String, String] = Map[String, String]
        config.insert("address", "192.168.86.98")
        config.insert("port", "1338")
        config.insert("id","Pony")
        config.insert("keepalive","60")
        consume config
    end

  fun makeSubs() : Map[String, String] val =>
    recover val
      let subs : Map[String, String] =  Map[String, String]
        subs.insert("abc","QOS0")
        subs.insert("def/hij","qos0")
        subs.insert("#","QOS0")
        consume subs
      end


actor \nodoc\ Main is TestList
    var _out : OutStream

    new create(env : Env) =>
        _out = env.out
        PonyTest(env, this)

    new make(env : Env) =>
        _out = env.out
        None

    fun tag tests(test: PonyTest) =>
        test(_ConnectPacketMin)
        test(_ConnectPacketAll)
        test(_Disconnect)


class \nodoc\  iso _ConnectPacketMin is UnitTest
    fun name() : String => "Control: Connect Packet - Min Params"
    fun apply(h: TestHelper) =>
      var cp : ConnectPacket = ConnectPacket(TestConfig.minConfig())
      var result : Array[U8] val = cp.getPacket()
      var expected : Array[U8] val = [16;16;0;4;77;81;84;84;4;238;0;60;0;4;80;111;110;121]
      h.assert_array_eq[U8](expected, result)

class \nodoc\  iso _ConnectPacketAll is UnitTest
  fun name() : String => "Control: Connect Packet - All Params "
  fun apply(h: TestHelper) =>
    var cp : ConnectPacket = ConnectPacket(TestConfig.fullConfig())
    var result : Array[U8] val = cp.getPacket()
    var expected : Array[U8] val = [16;54;0;4;77;81;84;84;4;230;0;11;0;10;80;111;110;121;67;108;105;101;110;116;0;6;76;87;97;110;100;84;0;8;71;111;111;100;98;121;101;33;0;4;110;105;99;107;0;6;97;98;99;100;101;102]
    h.assert_array_eq[U8](expected , result)


class \nodoc\  iso _Disconnect is UnitTest
  fun name() : String => "Disconnect"
  fun apply(h: TestHelper) =>
  var result : Array[U8] val = DisconnectPacket.compose()    
  var expected : Array[U8] = [224;0]
  h.assert_array_eq[U8](expected , result)
