/* Uses **************************************************************************/
  use "time"
  use "collections"
  use "term"
  use "debug"
  use "../primitives"
  use "../utilities"

actor Terminal
  let _env : Env
  let _ansiTerm : ANSITerm
  let _display : Display
  let _exitMain : {(U8)}

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


be connect() =>
  Debug.err("connect")

be disconnect() =>
  Debug.err("connect")

be startService(code : U8) =>
  Debug.err("start service")

be stopService(code : U8) =>
  Debug.err("stop service")

be clear() =>
  Debug.err("clear")

be onConnection() =>
  Debug.err("onConnection")

be onSubscribed() =>
  Debug.err("onSubscribed")
  
be onExit(code : U8) =>
  _ansiTerm.dispose()
  _display.onExit(0)
  Debug.err("Terminal exiting with code " + code .string())
  _exitMain(code)
