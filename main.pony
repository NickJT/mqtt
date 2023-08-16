/************************************************************************/
  use "debug"

  use "terminal"


/************************************************************************/
  actor Main
  let _env : Env
  let _terminal : Terminal

  new create(env : Env) =>
    _env = env
    _terminal = Terminal(env, recover iso this~onExit() end)

  be onExit(code : U8) =>
    """
    Only called when we are exiting the program and all of the actors need to
    be cleanly terminated
    """  
    // cleanup here
    Debug.err("Main cleanup completed (" + code.string() + ")" )
