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
  use "package:../idIssuer"
  use "package:../network"
  use "package:../primitives"
  use "package:../publisher"
  use "package:../router"
  use "package:../subscriber"

trait MqttClient
  be onConnection(connected : Bool)
  be onSubscribed(topic: String val, qos: (String val | None))
  be onMessage(topic: String val, content: String val)
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
  let _client : MqttClient tag

  var _reg : Registrar 
  let _issuer : IdIssuer 
  let _router : Router
  let _network : OsNetwork
  var _config : Map[String val, String val] val = Map[String val, String val]  
  var _subs : Map[String val, String val] val   = Map[String val, String val] 

new create(env : Env, mqttClient : MqttClient tag) =>
  _env = env
  _client = mqttClient
  let configReader = MqttConfig(_env, ConfigFile(), FullConfigParams())
  if (configReader.isValid()) then
    _config = configReader.getConfig()
    _subs = configReader.getSubscriptions()
  else
    _config = DefaultBroker()
  end 

  _reg = Registrar
  _reg.update(KeyClient(), _client)

  _issuer = IdIssuer
  _reg.update(KeyIssuer(),_issuer)

  _router = Router(_reg, _config)
  _reg.update(KeyRouter(),_router)

  _network = OsNetwork(_env, _router, _config)
  _reg.update(KeyNetwork(), _network)


be connect(cmd : Bool) =>
  """
  cmd: true - Connect to the Broker initialised during instantiation. Takes a callback that is called with 
  a status flag when the Broker is ready to accept subscribe and publish messages or when the Broker connection
  does not succeed. We connect by calling connect() on the network actor and the router gets a call once we have 
  a confirmed TCP connection.
  cmd: false - Gracefully disconnect from the Broker so that the last will and testament message is not sent. If
  disconnect is not called before the Mqtt actor terminates the Broker will send the LW&T message as
  configured in config.ini. Calling .disconnectBroker() on the router causes a disconnect message to be sent to
  the Broker before the network is closed.
  """
  if (cmd == true) then
    _network.connect()
  else
    _router.disconnectBroker()
  end

be publish(topic : String val, qos : String val, payload : Array[U8] val) =>
  """
  Publish the payload on the passed topic with the passed QoS. 
  """
  Debug("Publishing")
  _client.onMessage(topic, String.from_array(payload))

be subscribe(topic : String val, qos : (String val | None)) =>
  """
  Subscribe or unsubscribe to the passed topic, requesting messages be returned with the passed qos. Takes a callback
  that is called with topic and payload when a message is received.
  If qos is None then the topic is unsubscribed
  """
  Debug("Subscribing")
  _client.onSubscribed(topic, qos)


```````