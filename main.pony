/************************************************************************/
  use "debug"

  use "terminal"


/************************************************************************/
  actor Main
  let _env : Env
  //let _terminal : Terminal
  let _mqtt : MqttClient

  new create(env : Env) =>
    _env = env
    //_terminal = Terminal(_env, recover iso this~onExit() end)
    _mqtt = MqttClient(env)
    _mqtt.connect(recover iso this~onConnect() end)

  be onConnect(stg : String val) =>
    // Now we can subscribe
    Debug("Connected")
    _mqtt.subscribe("test/q0", "qos0", recover iso this~onSubscribed() end)

  be onSubscribed(topic: String val, qos: String val) =>
    // Now we can publish
    Debug("Subscribed")
    let pubMsg : String val = "A test message"
    _mqtt.publish("test/q0", "qos0", pubMsg.array(),recover iso this~onMessage() end)

  be onStatus(stg : String val) =>
    Debug(stg)

  be onMessage(topic : String val, content : String val) =>
    Debug(topic + " - " + content)

  be onExit(code : U8) =>
    """
    Only called when we are exiting the program and all of the actors need to
    be cleanly terminated
    """  
    // cleanup here
    Debug.err("Main cleanup completed (" + code.string() + ")" )
