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
  use "package:../primitives"
  use "package:../network"
  use "package:../configurator"

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
    Debug("InputNotify being disposed" where stream = DebugErr)


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
  Debug("[" + input.string() + "]" where stream = DebugErr )
  // ctrl q [17] to quit
  if input == 17 then 
    _exitCall(0)
  end 

fun ref fn_key(i: U8 val, ctrl: Bool val, alt: Bool val, shift: Bool val) =>
/*f1:Connect f2:Test f3:Stats f4:Unsub f5:Perf f6:Load B f9:Mute f10:Clear f11:Disc f12:Quit */
  _reg[Terminal](KeyTerminal()).next[None]({(t:Terminal)=>t.status("cmd: f" + i.string())})
  Debug("Handler got: f" + i.string() where stream = DebugErr)
  match i
  | Connect()     => _reg[OsNetwork](KeyNetwork()).next[None]({(nw:OsNetwork)=>nw.connect()})
  | SubscribeTest()   => _reg[Spawner](KeySpawner()).next[None]({ (s: Spawner)=>s.testSubs(Sub)}, {()=>Debug("No spawner")})
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
  //Debug("Rows: " + rows.string() + " Cols: " + cols.string() where stream = DebugErr )
  //_reg[Terminal](KeyTerminal()).next[None]({(t:Terminal)=>t.size(rows,cols)})

fun ref close() =>
  Debug("Window closed" where stream = DebugErr)
  _exitCall(0)

fun ref dispose() =>
  Debug("ANSINotify being disposed" where stream = DebugErr )

/* Unused key handlers*********************************************************/
  fun ref prompt(term: ANSITerm ref, value: String val) =>
    Debug("[prompt = " + value + "]" where stream = DebugErr )

  fun ref home(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug("[Home]" where stream = DebugErr )

  fun ref up(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug("[up]" where stream = DebugErr )

  fun ref down(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug("[down]" where stream = DebugErr )

  fun ref left(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug("[left]" where stream = DebugErr )

  fun ref right(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug("[right]" where stream = DebugErr )

  fun ref delete(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug("[delete]" where stream = DebugErr )

  fun ref insert(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug("[insert]" where stream = DebugErr )

  fun ref end_key(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug("[end]" where stream = DebugErr )

  fun ref page_up(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
    Debug("[page_up]" where stream = DebugErr )

  fun ref page_down(ctrl: Bool val, alt: Bool val, shift: Bool val) =>
      Debug("[page_down]" where stream = DebugErr )


```````