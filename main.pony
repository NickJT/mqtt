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

/************************************************************************/
  use "bureaucracy"
  use "collections"
  use "debug"
  use "net"
  use "term"

  use "configurator"
  use "idIssuer"
  use "examples"
  use "primitives"
  use "publisher"
  use "subscriber"
  use "ticker"


/************************************************************************/
  actor Main
    let _env : Env
    let _reg : Registrar  = Registrar
    let _cust : Custodian = Custodian
    let _issuer : IdIssuer = IdIssuer
    let _router : Router
    let _ticker : Ticker
    let _terminal : Terminal

    let _network : OsNetwork
    var _config : Map[String val, String val] val = Map[String val, String val]  
    var _subs : Map[String val, String val] val = Map[String val, String val]  
    
    new create(env : Env) =>
      _env = env
      _router = Router(_reg, _config)
      _ticker = Ticker(_router)
      _network = OsNetwork(_env, _router, _config)
      _terminal = Terminal(_env, _router, _subs)
      _retrieveConfiguration(_env)



/************************************************************************/
fun ref _retrieveConfiguration(env: Env) : Bool =>
  let configReader = MqttConfig(env, ConfigFile(), FullConfigParams())
  if (configReader.isValid()) then
    _config = configReader.getConfig()
    _subs = configReader.getSubscriptions()
    return true 
  end
  Debug("Unable to read valid configuration")
  false