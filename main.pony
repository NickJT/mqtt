
/************************************************************************/
  use "bureaucracy"
  use "collections"
  use "debug"
  use "net"
  use "term"

  use "configurator"
  use "idIssuer"
  use "examples"
  use "network"
  use "primitives"
  use "publisher"
  use "router"
  use "subscriber"
  use "terminal"


/************************************************************************/
  actor Main
  let _env : Env
  var _reg : Registrar 
  let _issuer : IdIssuer 
  let _router : Router
  let _spawner : Spawner
  let _terminal : Terminal
  let _ansiTerm : ANSITerm

  let _network : OsNetwork
  var _config : Map[String val, String val] val = Map[String val, String val]  
  var _subs : Map[String val, String val] val   = Map[String val, String val] 

    
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

    _spawner = Spawner(_reg, _subs)
    _reg.update(KeySpawner(),_spawner)

    _terminal = Terminal(_env)
    _reg.update(KeyTerminal(),_terminal)

    _network = OsNetwork(_env, _router, _config)
    _reg.update(KeyNetwork(), _network)

    // Start by creating the ansiNotifier. We pass it a reference to the onExit
    // behaviour of main so we can call dispose when we're done
    var ansiNotify : Handler iso = Handler(_env, _reg, recover iso this~onExit() end)

    // Now create the ANSITerm object
    _ansiTerm = ANSITerm(consume ansiNotify, env.input)

    // Next create the inputNotifier and pass in the ANSITerm. Data received by 
    // _env.input will be passed to inputNotify and forwarded to ansiNotify's
    // apply method 
    var inputNotify : Aclass iso =  Aclass(_env, _ansiTerm)

    // Finally, pass inputNotify to _env.input so it has access to stdin
    _env.input(consume inputNotify, 512)
 

  be onExit(code : U8) =>
    """
    Only called when we are exiting the program and all of the actors need to
    be cleanly terminated
    """  
    _cleanup()
    Debug.err("Main.onExit code is " + code.string())
    

  fun ref _cleanup() =>
    Debug.err("Main cleanup underway")
    _ansiTerm.dispose()
    _env.input.dispose()
    _reg.remove(KeyMain(),this)
    _reg.remove(KeyIssuer(),_issuer)
    // In case the user didn't disconnect the Broker
    _reg[Router](KeyRouter()).next[None]({(r:Router)=>r.cancelKeepAlive()})
    _reg[OsNetwork](KeyNetwork()).next[None]({(n:OsNetwork)=>n.disconnect()})
    _reg.remove(KeyNetwork(),_network)
    _reg.remove(KeyRouter(),_router)
    _reg.remove(KeyTerminal(),_terminal)
    _env.out.write(ANSI.reset() + ANSI.clear() + ANSI.white())
    _env.out.flush()
    Debug.err("Main cleanup completed")
