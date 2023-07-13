/// Use
  use "net"
  use "debug" 
  use "bureaucracy"
  use "collections"

  use "primitives"
  use "assembler"

class Client is TCPConnectionNotify
  """
  This class manages the TCP level connection and any set-up or tear-down necessary on network connection and 
  disconnection. It doesn't get involved in Broker level connections.

  Assume that the TCP buffers returned by received() are of arbitrary size and may have:
  1. One or more MQTT packets
  2. A trailing fragment of an MQTT packet 
  3. Both of the above

  Client constructs the Router with the config details from main and then adds the router to the registrar.
  Once Client gets an established TCP connection Router is passed this in its OnTcpConnect behaviour. Router
  can then start the Broker connection process. This is a bit of a long way around but we need to be sure 
  we don't generate any incomming messages before the connection is available. 

  Assembler is constructed and passed the tag of the router so that it knows where to send the 
  assembled packets. Assembler is not added to registrar because only client needs to access it.

  Otherwise, the client contains the callbacks called by TCPConnection when the connection state
  changes.

  Registrar usage  
  - Client adds the router to reg 
  """
  let _env: Env
  let _reg : Registrar
  """
  The registrar defined in Main and passed on to router
  """
  let _config : Map[String, String] val
  let _subs : Map[String, String] val
  var _router : Router
  var _assembler : Assembler

new iso create(env: Env, reg : Registrar, config : Map[String val, String val] val, subs : Map[String val, String val] val) =>
  _env = env
  _reg = reg
  _config = config
  _subs = subs
  
  _router = Router(_reg, _config, _subs)
  _reg.update(KeyRouter(), _router)

  _assembler = Assembler(_router)
  // assembler is only used by client so don't add it to reg

fun ref connecting(conn: TCPConnection ref, count: U32) =>
  Debug("Connecting (attempt " + count.string() + ")")
  
fun ref accepted(conn: TCPConnection ref) =>
  Debug("Connection Accepted")
  
fun ref connected(conn: TCPConnection ref) =>
  try
    (let host, let service) = conn.remote_address().name()?
    Debug("Client connected to " + host + ":" + service)
  end
  conn.set_nodelay(true)
  conn.set_keepalive(10)
  _router.onTcpConnect(conn)

fun ref received(conn: TCPConnection ref, data: Array[U8 val] iso, times: USize): Bool   =>
  _assembler.assemble(consume data) 
  true  
  
fun ref connect_failed(conn: TCPConnection ref) =>
    _reg[Main](KeyMain()).next[None]({(m : Main)=>m.onExit("TCP connection failed")})

fun ref closed(conn: TCPConnection ref) =>
     _reg[Main](KeyMain()).next[None]({(m : Main)=>m.onExit("TCP connection closed")})

