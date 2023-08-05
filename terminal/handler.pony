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

class Aclass is InputNotify
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


class Handler is ANSINotify
  """
  ANSINotify is the inner wrapper notifier. Apply is called by the ANSITerm when input
  is available. Closed is called when the window is closed.
  """
  let _env : Env
  var _term : (ANSITerm | None) = None
  let _reg : Registrar

  let _exitCall : {(U8)}
  new create(env : Env, reg : Registrar, exitCall : {(U8)} iso) =>
     _env = env
     _reg = reg
    _exitCall = consume exitCall
  
fun ref apply(term: ANSITerm ref, input: U8 val) =>
  _term = term
  Debug.err("[" + input.string() + "]")
  // ctrl q [17] to quit
  if input == 17 then 
    _exitCall(0)
  end 

fun ref fn_key(i: U8 val, ctrl: Bool val, alt: Bool val, shift: Bool val) =>
/*f1:Connect f2:Test f3:Stats f4:Unsub f5:Perf f6:Load B f9:Mute f10:Clear f11:Disc f12:Quit */
  //_reg[Terminal](KeyTerminal()).next[None]({(t:Terminal)=>t.status("cmd: f" + i.string())})
  //Debug.err("Handler got: f" + i.string())
  match i
  | Connect()     => _reg[OsNetwork](KeyNetwork()).next[None]({(nw:OsNetwork)=>nw.connect()})
  | SubscribeTest()   => _reg[Spawner](KeySpawner()).next[None]({ (s: Spawner)=>s.testSubs(Sub)}, {()=>Debug.err("No spawner")})
  | SubscribeStats()  => _reg[Spawner](KeySpawner()).next[None]({ (s: Spawner)=>s.brokerSubs(Sub)})
  | UnSubscribe() => _reg[Spawner](KeySpawner()).next[None]({ (s: Spawner)=>s.unSubAll()})
  | PerfTest()    => _reg[Spawner](KeySpawner()).next[None]({ (s: Spawner)=>s.perfTest()})
  | LoadTest()    => _reg[Spawner](KeySpawner()).next[None]({ (s: Spawner)=>s.loadTest()})
  | Mute()        => _reg[Spawner](KeySpawner()).next[None]({ (s: Spawner)=>s.mute()})
  | Discon()      => _reg[Router](KeyRouter()).next[None]({ (r: Router)=>r.disconnectBroker()})
  | Clear()       => _reg[Terminal](KeyTerminal()).next[None]({(t:Terminal)=>t.clear()})
  | Quit()        => _reg[Terminal](KeyTerminal()).next[None]({(t:Terminal)=>t.exitAndReset()})
                     _exitCall(0)
  else
    _reg[Terminal](KeyTerminal()).next[None]({(t:Terminal)=>t.status("f"+ i.string() + " not used yet")})
  end

fun ref size(rows: U16 val, cols: U16 val) =>
  None 
  //Debug.err("Rows: " + rows.string() + " Cols: " + cols.string())
  //_reg[Terminal](KeyTerminal()).next[None]({(t:Terminal)=>t.size(rows,cols)})

fun ref close() =>
  Debug.err("Window closed")
  _exitCall(0)

fun ref dispose() =>
  Debug.err("ANSINotify being disposed")

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

