
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

    Debug("Passed " + subs.size().string() + " topics" where stream = DebugErr)    
    Debug(_testSubs.size().string() + " Test topics" where stream = DebugErr)    
    Debug(_subs.size().string() + " Broker stats topics" where stream = DebugErr)    

  be brokerSubs(cmd : SubControl) =>
    Debug("In brokerSubs " where stream = DebugErr)    
    subscribermicator(_subs, cmd)

  be testSubs(cmd : SubControl) =>
    Debug("In testSubs " where stream = DebugErr)    
    subscribermicator(_testSubs, cmd)

  be unSubAll() =>
    Debug("Unsubscribing all in spawner " where stream = DebugErr)    
    subscribermicator(_subs, UnSub)
    subscribermicator(_testSubs, UnSub)

  be perfTest() =>
    var t = Time.now()
    Debug("Starting perfTest at " + t._1.string() + ":" + t._2.string() where stream = DebugErr)
    _publishers.insert("timestamp",Timestamper(_reg))

  be loadTest() =>
     Debug("loadTest not implemented  at " 
    + __loc.file() + ":" +__loc.method_name() 
    where stream = DebugErr)
    None

  be mute() =>
    for publisher in _publishers.values() do
      publisher.cancel()
    end
    
  fun ref subscribermicator(subs : Map[String val, String val] val, cmd : SubControl) =>
    """
    Subscribing and unsubscribing from a map of topics
    """
    match cmd
    | Sub =>  Debug("Subscribing to " + subs.size().string() + " topics" where stream = DebugErr)    
              for (topic, qos) in subs.pairs() do
                if not _subscribers.contains(topic) then 
                  _subscribers.insert(topic, Subscriber(_reg, topic, qos))
                  Debug("Inserted subscription for " + topic where stream = DebugErr)    
                end
                try _subscribers(topic)?.subscribe() 
                  Debug("Spawner subscribed to " + topic where stream = DebugErr)    
                end
              end
    | UnSub =>  Debug("Unsubscribing from " + subs.size().string() + " topics" where stream = DebugErr)    
                for topic in subs.keys() do
                  try _subscribers(topic)?.unsubscribe() 
                    Debug("Spawner unsubscribed from " + topic where stream = DebugErr)    
                  end
                end
    end


