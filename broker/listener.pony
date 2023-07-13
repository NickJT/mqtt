use "net"
use "files"

class Listener is TCPListenNotify
  let _env: Env
  let _delay: USize
  var _host: String = ""
  var _service: String = ""
  var _count: USize = 0

  new create(env: Env, delay: USize) =>
    _env = env
    _delay = delay

  fun ref listening(listen: TCPListener ref) =>
    try
      (_host, _service) = listen.local_address().name()?
      _env.out.print("listening on " + _host + ":" + _service)
    else
      _env.out.print("couldn't get local address")
      listen.close()
    end

  fun ref not_listening(listen: TCPListener ref) =>
    _env.out.print("not listening")
    listen.close()

  fun ref connected(listen: TCPListener ref): TCPConnectionNotify iso^ =>
    _env.out.print("Broker starting")
    let broker = Broker(_env, _delay)
    broker

