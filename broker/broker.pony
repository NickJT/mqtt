use "debug"
use "net"

use "../assembler"
use "../primitives"

class Broker is TCPConnectionNotify 
  let _env: Env
  let _delay: USize
  var _brouter : Brouter
  var _assembler : Assembler

new iso create(env: Env, delay : USize) =>
    _env = env
    _delay = delay
    Debug("Broker started")
    _brouter = Brouter(delay)
    _assembler = Assembler(_brouter)

fun ref connecting(conn: TCPConnection ref, count: U32) =>
  Debug("Connecting (attempt " + count.string() + ")")

fun ref accepted(conn: TCPConnection ref) =>
  try
    (let host, let service) = conn.remote_address().name()?
    _env.out.print("Broker accepted connection from " + host + ":" + service)
    _brouter.onTCPConnect(conn)
  end

fun ref connected(conn: TCPConnection ref) =>
  try
    (let host, let service) = conn.remote_address().name()?
    Debug("Broker connected to " + host + ":" + service)
  end

fun ref received(conn: TCPConnection ref, data: Array[U8] iso,  times: USize): Bool  =>
  // send data to assembler here
  _env.out.print("received count = " + times.string())
  _assembler.assemble(consume data)
  false  // to yield instead of waiting for max_size bytes from TCP 

fun ref connect_failed(conn: TCPConnection ref) =>
  _env.out.print("Broker connect failed")

fun ref closed(conn: TCPConnection ref) =>
  _env.out.print("Broker connection closed")
