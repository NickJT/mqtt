---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
/* Uses************************************************************************/
  use "collections"
  use "debug"
  use "promises"
  use "term"
  use "bureaucracy"
  use "package:.."
  use "package:../configurator"
  use "package:../network"
  use "package:../primitives"
  use "package:../router"
  use "package:../services"

class KbdInput is InputNotify
  """
  InputNotify is the outer wrapper notifier. Apply is called by env.input when data is 
  available from the input stream. Apply then calls the ANSI terminal so that the data 
  can be interpreted 
  """
  let _env : Env
  let _ansiTerm : ANSITerm
  new create(env : Env, ansiTerm : ANSITerm) =>
    _env = env
    _ansiTerm = ansiTerm
  
  fun ref apply(data : Array[U8 val] iso) =>
    _ansiTerm(consume data)

  fun ref dispose() =>
    Debug.err("InputNotify being disposed")


class Handler is ANSINotify
  """
  ANSINotify is the inner wrapper notifier. Apply is called by the ANSITerm when input
  is available. Closed is called when the window is closed.
  """
  let _env : Env
  let _terminal : Terminal
  var _ansiTerm : (ANSITerm | None) = None

  new create(env : Env, terminal : Terminal) =>
    _env = env
    _terminal = terminal
  
fun ref apply(ansiTerm: ANSITerm ref, input: U8 val) =>
  _ansiTerm = ansiTerm
  Debug.err("[" + input.string() + "]")

fun ref fn_key(i: U8 val, ctrl: Bool val, alt: Bool val, shift: Bool val) =>
  match i 
  | Connect() => _terminal.connect()
  | Discon() => _terminal.disconnect()
  | Service() => _terminal.startService(i)
  | Mute() => _terminal.stopService(i)
  | Clear() => _terminal.clear()
  | Quit()   =>  _terminal.onExit(0)
  else
    Debug.err("f"+ i.string() + " not used yet")
  end

fun ref size(rows: U16 val, cols: U16 val) =>
  None 
  //Debug.err("Rows: " + rows.string() + " Cols: " + cols.string())
  //_reg[Display](KeyDisplay()).next[None]({(t:Display)=>t.size(rows,cols)})

fun ref close() =>
  Debug.err("Window closed")
  //_exitCall(0)

/* Unused key handlers*********************************************************/
  fun ref prompt(ansiTerm: ANSITerm ref, value: String val) =>
    Debug.err("[prompt = " + value + "]")

  fun ref home(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug.err("[Home]")

  fun ref up(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug.err("[up]")

  fun ref down(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug.err("[down]")

  fun ref left(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug.err("[left]")

  fun ref right(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug.err("[right]")

  fun ref delete(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug.err("[delete]")

  fun ref insert(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug.err("[insert]")

  fun ref end_key(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug.err("[end]")

  fun ref page_up(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug.err("[page_up]")

  fun ref page_down(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
      Debug.err("[page_down]")


```````