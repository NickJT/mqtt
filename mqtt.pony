/************************************************************************/
  use "bureaucracy"
  use "collections"
  use "debug"
  use "net"
  use "term"

  use "configurator"
  use "idIssuer"
  use "network"
  use "primitives"
  use "publisher"
  use "router"
  use "subscriber"

actor MqttClient 
"""
Provides message access to the MQTT broker identified in config.ini or, if no config.ini can be
found, to localhost:1883.
"""
  var _env : Env
  var _reg : Registrar 
  let _issuer : IdIssuer 
  let _router : Router

  let _network : OsNetwork
  var _config : Map[String val, String val] val = Map[String val, String val]  
  var _subs : Map[String val, String val] val   = Map[String val, String val] 

  var _messageCallback : ({(String val, String val)} | None ) = None

  new create(env : Env) =>
    _env = env
    let configReader = MqttConfig(_env, ConfigFile(), FullConfigParams())
    if (configReader.isValid()) then
      _config = configReader.getConfig()
      _subs = configReader.getSubscriptions()
    else
      _config = DefaultBroker()
    end 

    _reg = Registrar
    _reg.update(KeyMain(), this)

    _issuer = IdIssuer
    _reg.update(KeyIssuer(),_issuer)

    _router = Router(_reg, _config)
    _reg.update(KeyRouter(),_router)

    _network = OsNetwork(_env, _router, _config)
    _reg.update(KeyNetwork(), _network)


  be connect(cb : {(String val)} iso) =>
    """
    Connect to the Broker initialised during instantiation. Takes a callback that is called with 
    a status message when the Broker is ready to accept subscribe and publish messages or when
    the Broker connection does not succeed.
    We connect by calling connect() on the network actor and the router gets a call once we have 
    a confirmed TCP connection.
    """
    _network.connect()

  be disconnect() =>
    """
    Gracefully disconnect from the Broker so that the last will and testament message is not sent. If
    disconnect is not called before the Mqtt actor terminates the Broker will send the LW&T message as
    configured in config.ini.
    Calling .disconnectBroker() on the router causes a disconnect message to be sent to the Broker before
    the network is closed.
    """
    _router.disconnectBroker()

  be publish(topic : String val, qos : String val, payload : Array[U8] val, cb : {(String val,String val)} iso ) =>
    """
    Publish the payload on the passed topic with the passed QoS. 
    """
    Debug("Publishing")
    cb("Published", String.from_array(payload))

  be subscribe(topic : String val, qos : String val, cb : {(String val,String val)} iso ) =>
    """
    Subscribe to the passed topic, requesting messages be returned with the passed qos. Takes a callback
    that is called with topic and payload when a message is received.
    """
    Debug("Subscribing")
    cb(topic, qos)

  be dispose() =>
  """
    Clears references in the registrar before exiting. We don't call disconnect here because
    we may want the Broker to send out the Last Will and Testatment message if we weren't 
    expecting to quit.
  """
    Debug.err("Mqtt being disposed")
    _router.cancelKeepAlive()
    _reg.remove(KeyIssuer(),_issuer)
    _reg.remove(KeyRouter(),_router)
    _reg.remove(KeyNetwork(),_network)
