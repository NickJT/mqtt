
/* Uses *******************************************************************/
  use "bureaucracy"
  use "collections"
  use "debug"
  use "time"

  use "package:../primitives"
  use "package:../subscriber"

actor Spawner
  var _reg : Registrar 

  var _subs : Map[String val, String val] val   = Map[String val, String val] 
  var _subscribers : Map[String val, Subscriber tag] = Map[String val, Subscriber tag]  
  var _publishers : Map[String val, Timestamper tag] = Map[String val, Timestamper tag]  
  let _testSubs : Map[String val, String val] val  
  var _soakTester : (SoakTester tag | None) = None
  var _perfTester : (MessageTest tag | None) = None

  new create(reg: Registrar, subs : Map[String val, String val] val) =>
    _reg = reg
    _subs = subs

    _testSubs = recover val
      var t = Map[String val, String val]
      t.insert("test/q0", "QOS0")
      t.insert("test/q1", "QOS1")
      t.insert("test/q2", "QOS2")
      t.insert("timestamp", "QOS1")
      t
    end

  be brokerSubs(cmd : SubControl) =>
    subscribermicator(_subs, cmd)

  be testSubs(cmd : SubControl) =>
    subscribermicator(_testSubs, cmd)

  be unSubAll() =>
    //Debug.err("Unsubscribing all in spawner ")    
    subscribermicator(_subs, UnSub)
    subscribermicator(_testSubs, UnSub)

  be perfTest() =>
    if (_perfTester is None) then
      _perfTester = MessageTest(_reg)
      _reg.update(KeyPerf(), _perfTester)
    end
    try (_perfTester as MessageTest).send() end
    

  be soakTest() =>
    _soakTester = SoakTester(_reg)
    //Debug.err("Starting perfTest at " + t._1.string() + ":" + t._2.string())
 

  be loadTest() =>
    _publishers.insert("timestamp",Timestamper(_reg))

  be mute() =>
    _reg.remove(KeyPerf(), _perfTester)
    try (_soakTester as SoakTester).mute() end
    _soakTester = None
    try (_perfTester as MessageTest).mute() end
    _perfTester = None

    for publisher in _publishers.values() do
      publisher.mute()
    end
      _publishers.clear()
    
  fun ref subscribermicator(subs : Map[String val, String val] val, cmd : SubControl) =>
    """
    Subscribing and unsubscribing from a map of topics
    """
    match cmd
    | Sub =>  for (topic, qos) in subs.pairs() do
                if not _subscribers.contains(topic) then 
                  _subscribers.insert(topic, Subscriber(_reg, topic, qos))
                end
                try _subscribers(topic)?.subscribe() 
                end
              end
    | UnSub =>  for topic in subs.keys() do
                  try _subscribers(topic)?.unsubscribe() 
                  end
                end
    end


