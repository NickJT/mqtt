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
    var _reg : Registrar 
    let _issuer : IdIssuer 
    let _router : Router
    let _ticker : Ticker
    let _terminal : Terminal

    let _network : OsNetwork
    var _config : Map[String val, String val] val = Map[String val, String val]  
    var _subs : Map[String val, String val] val = Map[String val, String val]  
    
    new create(env : Env) =>
      _env = env
    
      let configReader = MqttConfig(env, ConfigFile(), FullConfigParams())
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

      _terminal = Terminal(_env)
      _reg.update(KeyTerminal(),_terminal)

      _ticker = Ticker(_router)
      _reg.update(KeyTicker(),_ticker)

      _network = OsNetwork(_env, _router, _config)
      _reg.update(KeyNetwork(), _network)

      let term : ANSITerm = ANSITerm(Readline(recover Handler(_env, _reg, _terminal, _subs) end, env.out), env.input)
      let notify = object iso
        let term: ANSITerm = term
        fun ref apply(data: Array[U8] iso) => term(consume data)
        fun ref dispose() => Debug("Disposing notify object" where stream = DebugErr); term.dispose()
      end
      env.input(consume notify)
      Debug("Main is gone but not forgotten" where stream = DebugErr)
      term.prompt("|~")

    be onExit() =>
      """
      Only called when we are exiting the program and all of the actors need to
      be cleanly terminated
      """  
      cleanup()
      

    fun ref cleanup() =>
      Debug("Main cleanup underway" where stream = DebugErr)
      _env.out.write(ANSI.clear() + ANSI.white() )
      _env.out.flush()
      _reg.remove(KeyMain(),this)
      _reg.remove(KeyIssuer(),_issuer)
      // In case the user didn't disconnect the Broker
      _reg[Router](KeyRouter()).next[None]({(r:Router)=>r.cancelKeepAlive()})
      _reg[OsNetwork](KeyNetwork()).next[None]({(n:OsNetwork)=>n.disconnect()})
      _reg.remove(KeyNetwork(),_network)
      _reg.remove(KeyRouter(),_router)
      _ticker.cancel()
      _reg.remove(KeyTicker(),_ticker)
      _reg.remove(KeyTerminal(),_terminal)
      Debug("Main cleanup completed" where stream = DebugErr)
