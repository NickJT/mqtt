
use "pony_test"
use "collections"
use "../utilities"

actor \nodoc\ Main is TestList
    new create(env : Env) =>
        PonyTest(env, this)

    new make() =>
      None


    fun tag tests(test: PonyTest) =>
        test(_ToQos)
        test(_ToQosBits)
        test(_U8ToQos)

class \nodoc\  iso _ToQos is UnitTest
    fun name() : String => "ToQos"
    fun apply(h: TestHelper) =>
        var q : Qos = ToQos("qos0")
        h.assert_eq[Bool](true, q is Qos0) 
        q = ToQos("qos1")
        h.assert_eq[Bool](true, q is Qos1) 
        q = ToQos("qos2")
        h.assert_eq[Bool](true, q is Qos2) 

        q = ToQos("Qos0")
        h.assert_eq[Bool](true, q is Qos0) 
        q = ToQos("Qos1")
        h.assert_eq[Bool](true, q is Qos1) 
        q = ToQos("Qos2")
        h.assert_eq[Bool](true, q is Qos2) 

        q = ToQos("Any")
        h.assert_eq[Bool](true, q is Qos0) 
        
        q = ToQos("")
        h.assert_eq[Bool](true, q is Qos0) 
        

  class \nodoc\  iso _ToQosBits is UnitTest
    fun name() : String => "ToQosBits"
    fun apply(h: TestHelper) =>
        var q : U8 = ToQosBits("qos0")
        h.assert_eq[U8](0, q) 
        q = ToQosBits("qos1")
        h.assert_eq[U8](q, q) 
        q = ToQosBits("qos2")
        h.assert_eq[U8](2, q) 

        q = ToQosBits("Qos0")
        h.assert_eq[U8](0,q) 
        q = ToQosBits("Qos1")
        h.assert_eq[U8](1,q) 
        q = ToQosBits("Qos2")
        h.assert_eq[U8](2,q) 

        q = ToQosBits("Any")
        h.assert_eq[U8](0, q) 
        
        q = ToQosBits("")
        h.assert_eq[U8](0,q) 


        
  class \nodoc\  iso _U8ToQos is UnitTest
    fun name() : String => "U8 To Qos"
    fun apply(h: TestHelper) =>
      try
        var q : Qos = U8ToQos(0) as Qos
        h.assert_eq[Bool](true, q is Qos0) 
        q = U8ToQos(1)  as Qos
        h.assert_eq[Bool](true, q is Qos1) 
        q = U8ToQos(2)  as Qos
        h.assert_eq[Bool](true, q is Qos2) 

        var mq : (Qos | None)
        mq = U8ToQos(3) as None
        h.log("Will generate a <Got invalid QoS value (3)> message")
        h.assert_eq[Bool](true, mq is None) 
        h.log("Will generate a <Got invalid QoS value (255)> message")
        mq = U8ToQos(255)  as None
        h.assert_eq[Bool](true, mq is None) 
      else
        h.fail("U8ToQos error in test")
      end