---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
/************************************************************************/
  use "bureaucracy"
  use "collections"
  use "debug"
  use "net"
  use "term"

  use "package:../configurator"
  use "package:../network"
  use "package:../primitives"
  use "package:../publisher"
  use "package:../router"
  use "package:../subscriber"
  use "package:../utilities"

trait MqttApplication
  be onConnection(connected : Bool)
  be onSubscribed(topic: String val, qos: (String val | None))
  be onMessage(topic: String val, content: Array[U8] val)
  be onStatus(content: String val)

trait MqttService
  be onResponse(topic: String val, payload : Array[U8] val)
  be onExit()  

actor Mqtt 
  """
  Provides message access to the MQTT broker identified in config.ini or, if no config.ini can be
  found, to localhost:1883.
  """
  var _env : Env
  let _app : MqttApplication tag

  let _router : Router
  let _network : OsNetwork
  var _connected : Bool = false
  var _config : Map[String val, String val] val = Map[String val, String val]  
  var _subs : Map[String val, String val] val   = Map[String val, String val] 

new create(env : Env, mqttApplication : MqttApplication tag) =>
  _env = env
  _app = mqttApplication
  let configReader = MqttConfig(_env, ConfigFile(), FullConfigParams())
  if (configReader.isValid()) then
    _config = configReader.getConfig()
    _subs = configReader.getSubscriptions()
  else
    _config = DefaultBroker()
  end 

  _router = Router(this, _config)
  _network = OsNetwork(_env, _router, _config)


be connect(cmd : Bool) =>
  """
  cmd: true - Connect to the Broker initialised during instantiation. Takes a callback that is called with 
  a status flag when the Broker is ready to accept subscribe and publish messages or when the Broker connection
  does not succeed. We connect by calling connect() on the network actor and the router gets a call once we have 
  a confirmed TCP connection.
  cmd: false - Gracefully disconnect from the Broker so that the last will and testament message is not sent. If
  disconnect is not called before the Mqtt actor terminates the Broker will send the LW&T message as
  configured in config.ini. 

  Calling .disconnectBroker() on the router send the disconnect packet and cancels the ping timer. The tcp client
  calls router.cleanup() once the network has disconnected so there is no need to call any other router behaviours here.

  Router calls onConnection(false) once it has finished its clean-up and we can safely start to exit the app

  > DISCONNECT must be the last message sent by the client to the server. The client must close the TCP 
  connection after sending DISCONNECT.
  """

  if ((cmd == true) and (not _connected)) then
    _network.connect()
  end

  if ((cmd == false) and _connected) then 
      _router.disconnectBroker()
      _network.disconnect()
  end

be publish(topic : String val, payload : Array[U8] val, qos : String val = "qos0") =>
  """
  This is just a passthrough to the router.
  """
  if (not _connected) then return end

  var q : Qos = ToQos(qos)
  if (q is Qos0) then 
    _router.onPublishQos0(topic, payload)
  else
    _router.onPublish(topic, payload, q)
  end

be subscribe(topic : String val, qos : (String val | None)) =>
  """
  Subscribe or unsubscribe to the passed topic, requesting messages be returned with the passed qos. 
  This is just a passthrough to the router.
  """
  if (not _connected) then return end

  try 
    _router.onSubscribe(topic, ToQos((qos as String val)))
  else
    _router.onUnsubscribe(topic)
  end

be onConnection(connected : Bool) =>
  _connected = connected
  _app.onConnection(connected)

be onSubscribed(topic: String val, qos: (String val | None)) =>
  _app.onSubscribed(topic, qos)

be onMessage(topic: String val, content: Array[U8] val) =>
  _app.onMessage(topic,content)

be onStatus(content: String val) =>
    _app.onStatus(content)
```````