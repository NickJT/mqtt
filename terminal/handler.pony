/* Uses************************************************************************/
  use "collections"
  use "debug"
  use "promises"
  use "term"
  use "bureaucracy"
  use "package:.."
  use "package:../configurator"
  use "package:../examples"
  use "package:../network"
  use "package:../primitives"
  use "package:../router"

class KbdInput is InputNotify
  """
  InputNotify is the outer wrapper notifier. Apply is called by env.input when data is 
  available from the input stream. Apply then calls the ANSI terminal so that the data 
  can be interpreted 
  """
  let _env : Env
  let _term : ANSITerm
  new create(env : Env, term : ANSITerm) =>
    _env = env
    _term = term
  
  fun ref apply(data : Array[U8 val] iso) =>
    _term(consume data)

  fun ref dispose() =>
    Debug.err("InputNotify being disposed")


class Terminal is ANSINotify
  """
  ANSINotify is the inner wrapper notifier. Apply is called by the ANSITerm when input
  is available. Closed is called when the window is closed.
  """
  let _env : Env
  var _term : (ANSITerm | None) = None

  let _exitCall : {(U8)}
  new create(env : Env, exitCall : {(U8)} iso) =>
     _env = env
    _exitCall = consume exitCall
  
fun ref apply(term: ANSITerm ref, input: U8 val) =>
  _term = term
  Debug.err("[" + input.string() + "]")

fun ref fn_key(i: U8 val, ctrl: Bool val, alt: Bool val, shift: Bool val) =>
  match i 
  | Quit()        =>  _exitCall(0)
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
  fun ref prompt(term: ANSITerm ref, value: String val) =>
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

