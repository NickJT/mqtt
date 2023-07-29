use "collections"
use "debug"
use "promises"
use "term"
use "bureaucracy"
use "primitives"
use "subscriber"
use "publisher"
use "examples"


class Handler is ReadlineNotify
  let _commands: Array[String] = _commands.create()
  let _out : OutStream
  let _lines : Array[String] 

  let _reg : Registrar
  let _terminal : Terminal
  var _subs: Map[String val, String val] val = Map[String val, String val] 
  var _publishers: Map[String val, Publisher] = Map[String val, Publisher]

  var _timestamper : (Timestamper | None) = None

  new create(env : Env, reg : Registrar, terminal : Terminal, subs : Map[String val, String val] val) =>
    _out = env.out
    _reg = reg
    _terminal = terminal
    _subs = subs

    _lines = Array[String]
    _commands.push("quit")
    _commands.push("connect")
    _commands.push("clear")
    _commands.push("disconnect")
    _commands.push("publish")
    _commands.push("mute")
    _commands.push("subscribe")
    _commands.push("unsubscribe all")

fun ref apply(line: String, prompt: Promise[String]) =>
  """
  If quit was entered then terminate by rejecting the promise otherwise, update the 
  prompt and add the line to the command buffer
  """
  if line == "quit" then
    _reg[Main](KeyMain()).next[None]({(m: Main)=>m.onExit()})
    prompt.reject()
  else  // display the updated prompt
    prompt("|> ")
  end 
  _update_commands(line)
  _lines.push(line)
  process(line)

fun ref _update_commands(line: String) =>
  for command in _commands.values() do
    if command.at(line, 0) then
      return
    end
  end
  _commands.push(line)

fun ref tab(line: String): Seq[String] box =>
  let r = Array[String]
  for command in _commands.values() do
    if command.at(line, 0) then
      r.push(command)
      return r
    end
  end
  r

fun ref process(line : String) =>
    try
      var cmd = stripCommand(line)?  
      match cmd 
      | "clear" => _terminal.clear()
      | "connect" => _reg[OsNetwork](KeyNetwork()).next[None]({(nw:OsNetwork)=>nw.connect()})
      | "disconnect" => _reg[Router](KeyRouter()).next[None]({ (r: Router)=>r.disconnectBroker()})
      | "publish" => _publish(line)
      | "timestamp" => _timestampOn(line) 
      | "subscribe" => _subscribeAll()
      | "unsubscribe" => _terminal.status("Unsubscribe not implemented")
      | "mute" => _mute()
      | "quit" => None
      else
        _terminal.status("No command: " + line)
      end
    end

fun _subscribeAll() =>
  for (topic, qos) in _subs.pairs() do
    Subscriber(_reg,topic,qos).subscribe()
  end

fun stripCommand(line : String) : String? =>
  """
  Returns the first word of the line in lower case
  """
  let delimiter = " "
  let splitArray: Array[String val] = line.split(delimiter)
  splitArray(0)?.lower()


fun _publish(line : String) =>
  let delimiter = " "
  let splitArray: Array[String val] = line.split(delimiter)
 
  try 
    if (splitArray(1)?.lower() == "timestamp" ) then
      _terminal.status("Starting timestamp publisher")
    end
  end

fun ref _timestampOn(line : String) =>
  if (_timestamper is None) then
    _timestamper = Timestamper(_reg)
  end

fun ref _mute() =>
  try
    (_timestamper as Timestamper).cancel() 
    _timestamper = None
  else
    Debug("Can't cancel timestamp" where stream = DebugErr)
  end