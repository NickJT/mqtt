use "debug"
use "collections"
use "pony_test"
use "../primitives"
use "../utilities"

type Stream is Array[ArrayVal] 

primitive P1 fun apply(): ArrayVal => [11;5;1;2;3;4;5]
primitive P2 fun apply(): ArrayVal => [12;3;1;2;3]
primitive P3 fun apply(): ArrayVal => [13;7;1;2;3;4;5;6;7]
primitive P4 fun apply(): ArrayVal => [14;0]
primitive P5 fun apply(): ArrayVal => [15;6;1;2;3;4;5;6]
primitive P6 fun apply(): ArrayVal => [16;2;1;2]

primitive Single fun apply() => P1()
primitive Double fun apply() : ArrayVal => [12;3;1;2;3;11;5;1;2;3;4;5]  // p2 p1
primitive Partial fun apply(): ArrayVal =>[13;7;1;2;3]  // part of p3
primitive Fraction fun apply(): ArrayVal =>[4;5;6;7;14;0]  // remainder of p3 and p4
primitive Overlen fun apply() : ArrayVal=>[13;7;1;2;3;4;5;6;7;15;6;1;2;3;4;5] // p3 and part of P5
primitive Tail  fun apply() : ArrayVal=>[6]  // remainder of p5
primitive Last fun apply() : ArrayVal=> P6()



actor Main is TestList

new create(env : Env) =>
PonyTest(env, this)

new make() =>
  None

fun tag tests(test: PonyTest) =>
  test(_Single)


class iso _Single is UnitTest 
  fun name() : String => "Assembler Tests - Not Yet Implemented"

  fun apply(h:TestHelper) =>
  h.assert_true(true)
 
  

