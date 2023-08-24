"""
# Pony MQTT Client #

### Release Objectives ###

#### Release .1 ####
1. 100% coverage of the protocol for happy path with expected i/o
2. QoS 0, 1 & 2 cleansession only - no message re-transmission after disconnect
3. Wide use of guards, debug checks and error tracing
4. Separate classes for each packet type so we don't miss any variations
5. Consistent api to avoid programming errors while things stabiliise  
6. Minimal Main application to demonstrate connect, subscribe, publish and disconnect

### Release .2 ###

1. Consider edge cases and errors
2. Refine the api (public: simple, private: efficient)  
3. Add session restoration 
4. Consolidate similar classes into factory classes
5. Remove unnecessary intermediate variable, guards and debug checks
6. Simple text terminal for testing

### Release .3 ###

1. Performance  
2. Load and memory usage  
3. Optimise
4. Build as library
5. Terminal app for benchmarking


### Architecture ###
The architecture of the R.1 is highly decomposed:
1  to help understanding how the protocol works
2  to facilitate perf testing each component later

This is probably not the most effective approach for performance so expect to see components 
being consolidated later. The main purpose of each of the packages (in order of typical programe flow) is as follows.

#### Main ####
Uses a configurator actor to reads the configuration from config.ini. Passes the config to 
the other actors it creates and then starts the terminal handler. Actors are stored in a 
Registrar so then can be disposed later - when main's onExit behaviour is called.

### Network ###
Connects to the server in the config.ini file (or localhost:1883 a default). Creates a Client as a callback for events.

### Client ###
The TCP class that tells Router when the network is connected (not the MQTT broker yet, just the TCP connection). The
Client received method is called when data is available and send this data to Assembler.

### Assembler ###
TCP knows nothing of MQTT messages so we may receive multiple MQTT messages in a TCP packet,
or fractions of a message, or any combination thereof. Assembler is responsible for assembling
valid MQTT messages from these TCP packets. If you were expecting sections of the code to be
written in assembler, I am sorry to disappoint...

### Router ###
The hub of the library - carries out minimal interpretation of the incomming message and send
it to the appropriate handlers. Keeps track of the incomming and outgoing message ids as acks
are only tied to messages by id.

"""

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