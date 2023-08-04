use "bureaucracy"
use "time"
use "debug"
use ".."
use "../publisher"
use "../primitives"
use "../router"
use "../utilities"
use "collections"

actor MessageTest
  let _reg : Registrar
  let _testPub : Publisher
  let _testTopic : String val = "MessageTest/q0"
  let _resultPub : Publisher
  let _resultTopic : String val = "MessageTest/q0result"
  let _count : U64 = 10000
  let _start : (I64, I64)
  let _finish : (I64, I64)
  let _runDate : String val

  new create(reg : Registrar) =>
    _reg = reg
    _testPub = Publisher(_reg,_testTopic)
    _resultPub = Publisher(_reg,_resultTopic)
    
    _runDate = recover val
      (var sec, var nano) = Time.now()
      var stg : String ref = String
      stg.append(sec.string())
      stg.append(":")
      stg.append(nano.string())
      consume stg
     end

    var args = PublishArgs(_testTopic, _runDate.array(), Qos0)

    _start = Time.now()
    for i in Range[U64](0,_count) do 
      _testPub.publish(args)
    end
    _finish = Time.now()

    var taken : String val = recover val
      var stg : String ref = String
      stg.append((_finish._1 - _start._1).string())
      stg.append(":")
      stg.append((_finish._2 - _start._2).string())
      consume stg
     end


    args = PublishArgs(_resultTopic, taken.array(), Qos2)
    _resultPub.publish(args)

  be mute() =>
   None  