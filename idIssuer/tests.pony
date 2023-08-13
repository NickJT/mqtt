
use "pony_test"

actor \nodoc\ Main is TestList

    new create(env : Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        test(_IdIssue)

class \nodoc\  iso _IdIssue is UnitTest
  fun name() : String => "Id Issue"
  fun apply(h: TestHelper) =>
  h.assert_eq[Bool](true , true)

