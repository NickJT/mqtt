/* Uses **************************************************************************/
  use "time"
  use "collections"
  use "term"
  use "debug"
  use "package:../primitives"
  use "package:../utilities"
  use "package:../mqtt"

actor Terminal is MqttClient
  let _env : Env
  let _ansiTerm : ANSITerm
  let _display : Display
  let _exitMain : {(U8)}

  let _mqtt : Mqtt

new create(env: Env, exitMain : {(U8)} iso) =>
  _env = env
  _exitMain = consume exitMain
  _display = Display(env)

  // Start by creating the keyboard handler using an ansiNotifier.
  // We pass it a reference to the onExit behaviour of main so we can call it when we're done
  var ansiNotify : Handler iso = Handler(_env, this)
  // Now create the ANSITerm object
  _ansiTerm = ANSITerm(consume ansiNotify, env.input)
  // Next create the inputNotifier and pass in the ANSITerm. Data received by 
  // _env.input will be passed to inputNotify and forwarded to ansiNotify's
  // apply method 
  var inputNotify : KbdInput iso =  KbdInput(_env, _ansiTerm)
  // Finally, pass inputNotify to _env.input so it has access to stdin
  _env.input(consume inputNotify, 512)

  _mqtt = Mqtt(_env, this)

be connect() =>
  _mqtt.connect(true)

be disconnect() =>
  _mqtt.connect(false)

be startService(code : U8) =>
  _display.status("start service " + code.string())

be stopService(code : U8) =>
  _display.status("stop service " + code.string())

be clear() =>
  _display.clear()

be onConnection(connected : Bool) =>
  _display.status("onConnect = " + connected.string())

be onSubscribed(topic: String val, qos: (String val | None)) =>
  try 
    _display.message(topic, qos as String val)
  else
    _display.message(topic, "Unsubscribed")
  end
be onMessage(topic: String val, content: String val) =>
  if (topic.contains("status")) then 
    _display.status(content)
  else
    _display.message(topic,content)
  end

be onStatus(content: String val)=>
  _display.status(content)

be onExit(code : U8) =>
  _ansiTerm.dispose()
  _display.onExit(0)
  Debug.err("Terminal exiting with code " + code .string())
  _exitMain(code)
