use "debug"
use "collections"
use "pony_test"
use "../primitives"
use "../utilities"

type Stream is Array[ArrayVal] 

primitive \nodoc\ P1 fun apply(): ArrayVal => [11;5;1;2;3;4;5]
primitive \nodoc\ P2 fun apply(): ArrayVal => [12;3;1;2;3]
primitive \nodoc\ P3 fun apply(): ArrayVal => [13;7;1;2;3;4;5;6;7]
primitive \nodoc\ P4 fun apply(): ArrayVal => [14;0]
primitive \nodoc\ P5 fun apply(): ArrayVal => [15;6;1;2;3;4;5;6]
primitive \nodoc\ P6 fun apply(): ArrayVal => [16;2;1;2]

primitive \nodoc\ Single fun apply() => P1()
primitive \nodoc\ Double fun apply() : ArrayVal => [12;3;1;2;3;11;5;1;2;3;4;5]  // p2 p1
primitive \nodoc\ Partial fun apply(): ArrayVal =>[13;7;1;2;3]  // part of p3
primitive \nodoc\ Fraction fun apply(): ArrayVal =>[4;5;6;7;14;0]  // remainder of p3 and p4
primitive \nodoc\ Overlen fun apply() : ArrayVal=>[13;7;1;2;3;4;5;6;7;15;6;1;2;3;4;5] // p3 and part of P5
primitive \nodoc\ Tail  fun apply() : ArrayVal=>[6]  // remainder of p5
primitive \nodoc\ Last fun apply() : ArrayVal=> P6()



actor \nodoc\ Main is TestList

new create(env : Env) =>
PonyTest(env, this)

new make() =>
  None

fun tag tests(test: PonyTest) =>
  test(_Single)


class \nodoc\ iso _Single is UnitTest 
  fun name() : String => "Assembler Tests - Not Yet Implemented"

  fun apply(h:TestHelper) =>
  h.assert_true(true)
 
  

