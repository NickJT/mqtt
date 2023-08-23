---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
/* Uses **************************************************************************/
  use "time"
  use "collections"
  use "term"
  use "debug"
  use "package:../primitives"
  use "package:../utilities"
  use "package:../mqtt"
  use "package:../services"

actor Terminal is MqttApplication
  let _env : Env
  let _ansiTerm : ANSITerm
  let _display : Display
  let _exitMain : {(U8)}
  let _mqtt : Mqtt
  var _service : (MqttService tag | None) = None

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
  """
  Tells the MQTT actor to connect to the Broker
  """
  _mqtt.connect(true)

be disconnect() =>
  """
  Tells the MQTT actor to send a disconnect message to the Broker and then release
  the network connection
  """
  _mqtt.connect(false)

be startService(code : U8) =>
  _display.status("starting service " + code.string())
  _service = Rtt("rtt", _mqtt, this)

be stopService(code : U8) =>
  _display.status("stop service " + code.string())
  try (_service as MqttService tag).onExit() end

be clear() =>
  """
  Tells the display actor to clear the message section of the screen
  """
  _display.clear()

be onExit(code : U8) =>
  """
  Called by the terminal actor in response to a user request to exit. Releases the
  keyboard handler, calls _onExit on the display actor and then calls the callback
  provided by Main.  
  TODO - We don't call disconnect here yet (so we can test the LW&T) but change this once
  everything is working
  """
  _ansiTerm.dispose()
  _display.onExit(0)
  Debug.err("Terminal exiting with code " + code .string())
  _exitMain(code)

be onConnection(connected : Bool) =>
  """
  Called by the MQTT actor when the Broker is connected
  """
  _display.status("onConnect = " + connected.string())

be onSubscribed(topic: String val, qos: (String val | None)) =>
  """
  Called by the MQTT actor with the result of a subscription request
  """
  try 
    _display.message(topic, qos as String val)
    var stg : String val = "Subscribed"
    (_service as MqttService tag).onResponse(topic, stg.array())
  else
    _display.message(topic, "Unsubscribed")
  end

be onMessage(topic: String val, content: Array[U8] val) =>
  """
  Called by the MQTT actor when it has recieved a message on a subscribed channel or 
  an allocated channel
  """
  try (_service as MqttService tag).onResponse(topic, content) end
  

be onStatus(content: String val)=>
  """
  Called by the MQTT actor when it has recieved a status message
  """
  _display.status(content)



```````