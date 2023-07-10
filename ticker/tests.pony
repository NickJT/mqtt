
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
        test(_TickTest)
        

class iso _TickTest is UnitTest
  fun name() : String => "Tick Test - not implemented"
  fun apply(h: TestHelper) =>
  var result : U8 = 0   
  var expected : U8 = 0
  h.assert_eq[U8](expected , result)

