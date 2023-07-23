---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "collections"
use "debug"
use "promises"
use "term"

class Handler is ReadlineNotify
  let _commands: Array[String] = _commands.create()
  var _i: U64 = 0
  let _out : OutStream
  let _buffer : Map[String, String]
  let _lines : Array[String] 

  let _xCursor : U32 = 3
  let _yCursor : U32 = 2
  let _yCommand : U32 = 4

  new create(env : Env) =>
    _out = env.out
    _buffer = Map[String, String]
    _lines = Array[String]
    _commands.push("quit")
    _commands.push("connect")
    _commands.push("disconnect")
    _commands.push("publish")
    _commands.push("subscribe")
    _commands.push("unsubscribe all")

fun ref apply(line: String, prompt: Promise[String]) =>
  """
  If quit was entered then terminate by rejecting the promise otherwise, update the 
  prompt and add the line to the command buffer
  """
  if line == "quit" then
    prompt.reject()
  else  // display the updated prompt
    _out.write(ANSI.cursor(_xCursor, _yCursor))
    prompt("> ")
  end 
  _update_commands(line)
  _lines.push(line)
  process(line)

fun ref process(line : String) =>
    // extract the command
    // match on command
    // send arguments to command handler
    try
      var c = line(0)?  
      match c 
      | 'c' => splash("connect")
      | 'd' => splash("disconnect")
      | 'p' => splash("publish")
      | 's' => splash(line)
      | 'u' => splash("unsubscribe")
      end
    end

fun splash(stg : String val) => 
  _out.write(ANSI.cursor(_xCursor, _yCommand))
  _out.write(ANSI.erase(EraseLine))
  _out.flush()
  _out.write(ANSI.red()+ stg + ANSI.reset())
  _out.write(ANSI.cursor(_xCursor, _yCursor))
  _out.flush()


fun ref _update_commands(line: String) =>
  """
  if line (the last string passed) is a substring of a command already in the 
  command buffer then return without adding it, else add the line to the command buffer/
  This gives a history of commands entered
  """
  for command in _commands.values() do
    if command.at(line, 0) then
      return
    end
  end
  _commands.push(line)

fun ref tab(line: String): Seq[String] box =>
  """
  If tab is entered then return all the commands that have the same prefix
  as the line entered before the tab
  """
  let r = Array[String]

  for command in _commands.values() do
    if command.at(line, 0) then
      r.push(command)
    end
  end
  r


```````