---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "bureaucracy"
use "collections"
use "debug"

use ".."
use "../publisher"
use "../subscriber"
use "../primitives"
use "../utilities"

actor MessageTest
  let _reg : Registrar
  let _testPub : Publisher
  let _testSub : Subscriber
  let _testTopic : String val = TestPrefix()+"perftest"
  var _count : U64 = 0

  new create(reg : Registrar) =>
    _reg = reg
    _testPub = Publisher(_reg,_testTopic)
    _testSub = Subscriber(_reg,_testTopic, "qos1")
    _testSub.subscribe()
    
  be send() =>
    _count = _count + 1
    _testPub.publish(PublishArgs(_testTopic, MqTime.startTime().array(), Qos1))

  be mute() =>
   Debug.err("MessageTest muted")
   _count = 0  
```````