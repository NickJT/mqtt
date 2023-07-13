"""
# Pony MQTT Client #

## Release Objectives ##

### Release .1 ###
1. 100% coverage of the protocol for happy path with expected i/o.
2. Wide use of guards, debug checks and error tracing
3. Separate classes for each packet type so we don't miss any variations 
4. Consistent api to avoid programming errors while things stabiliise 
5. No hard split between library and application

### Release .2 ###
1. Consider edge cases and errors
2. Split code into library and application
3. Consolidate similar classes into factory classes
4. Optimise the api (public: simple, private: efficient)  
5. Remove unnecessary intermediate variable, guards and debug checks
6. Simple GUI for testing

### Release .3 ###
1. Performance 
2. Load and memory usage
3. Optimise
"""

use "net"
use "collections"
use "bureaucracy"
use "debug"

use "primitives"
use "configurator"
use "publisher"
use "examples"

actor Main
"""
Main is responsible for reading the config.ini file identified in the ConfigFile primitive
and passing the Client into the TCPConnection

Registrar usage  
- Main adds itself to reg so its onDisconnect behaviour can be called when the client disconnects 

"""
  let _reg : Registrar  = Registrar

  new create(env: Env) =>
    if (not _initialise(env, _reg) ) then 
      Debug("Unable to initialise connection - quitting")
    end

/********************************************************************************/    
be onExit(diagnostic : String val) =>
    Debug("Exit: " + diagnostic)

/********************************************************************************/    
be onMessage(topic : String val, content : String val) =>
    Debug(topic + " => " + content)
  
/********************************************************************************/    
be onBrokerConnect(message: String val) =>
  """
  Called once router has confirmed that we have a valid connection to the broker
  """
    //Debug("Starting timestamp publication")
    //Timestamper(_reg)


/************************************************************************/
fun ref _initialise(env: Env, reg : Registrar) : Bool =>
  let configReader = MqttConfig(env, ConfigFile(), FullConfigParams())
  //Debug("Opening " + ConfigFile())
  if (not configReader.isValid()) then
    Debug("Unable to read valid configuration")
    return false 
  end

  try
    var config = configReader.getConfig()
    var subs = configReader.getSubscriptions()
    var address :String val = config(IniAddress())? 
    var ipv4Address : String val = ""
    try
      ipv4Address = toIPv4(env, address) as String val
    else
      Debug("Unable to resolve an IPv4 address from " + address)
      return false
    end  

    var port: String val = config(IniPort())?
    Debug("Connecting to " + address + ":" + port)
    TCPConnection(TCPConnectAuth(env.root), recover Client(env, _reg, config, subs )end, ipv4Address, port)  
  else
    Debug("Unable to read address and port config in " + ConfigFile())
    return false
  end

  reg.update(KeyMain(), this)
  true



  /************************************************************************/
  fun toIPv4(env : Env, arg : String val) : (String val | None) =>
  """
  This doesn't fit comfortably anywhere yet so we'll leave it in main for now
  """  if (DNS.is_ip4(arg)) then return arg
    end
    
    try
      var addrs : Array[NetAddress val] = DNS.ip4(DNSAuth(env.root), arg, "")
      (var addr, var port) = addrs(0)?.name()?
      return addr
    end
    None