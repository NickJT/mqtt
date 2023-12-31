"""
This is a test mock that provides enough of the necessary responses to enable testing - nothing more.
"""

use "bureaucracy"
use "collections"
use "debug"
use "net"

use ".."
use "package:../assembler"
use "package:../primitives"

class Broker is TCPConnectionNotify 
  let _env: Env
  var _router : Router
  var _assembler : Assembler
  var _reg : Registrar = Registrar

new iso create(env: Env) =>
    _env = env
    Debug.err("Broker started")
    _router = Router(_reg, Map[String val, String val])
    _assembler = Assembler(_router)
    _reg.update(KeyRouter(), _router)

fun ref connecting(conn: TCPConnection ref, count: U32) =>
  Debug.err("Connecting (attempt " + count.string() + ")" )

fun ref accepted(conn: TCPConnection ref) =>
  try
    (let host, let service) = conn.remote_address().name()?
    _env.out.print("Broker accepted connection from " + host + ":" + service)
    _router.onTcpConnect(conn)
  end

fun ref connected(conn: TCPConnection ref) =>
  try
    (let host, let service) = conn.remote_address().name()?
    Debug.err("Broker connected to " + host + ":" + service)
  end

fun ref received(conn: TCPConnection ref, data: Array[U8] iso,  times: USize): Bool  =>
  // send data to assembler here
  //_env.out.print("Received count = " + times.string())
  _assembler.assemble(consume data)
  false  // to yield instead of waiting for max_size bytes from TCP 

fun ref connect_failed(conn: TCPConnection ref) =>
  Debug.err("Broker connect failed")

fun ref closed(conn: TCPConnection ref) =>
  Debug.err("Broker connection closed")
