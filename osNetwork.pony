  use "collections"
  use "debug"
  use "net"
  use "term"
  use "primitives"
  use "configurator"


actor OsNetwork
  var _config : Map[String val, String val] val = Map[String val, String val] 
  var _ipv4Address : String val = "localhost"
  var _port : String val = "1883"
  var _env : Env
  var _router : Router

  new create(env: Env, router: Router, config : Map[String val, String val] val) =>
  _env = env
  _router = router
  try
    var address :String val = config(IniAddress())? 
    //_ipv4Address = toIPv4(_env, address) as String val
    _port = config(IniPort())?
    _config = config
  else
    Debug("Unable to read address and port config in " + ConfigFile())
  end


/************************************************************************/
be connect() =>
  Debug("Connecting to " + _ipv4Address + ":" + _port)
  TCPConnection(TCPConnectAuth(_env.root), recover Client(_env, _router) end, _ipv4Address, _port)

/************************************************************************/
be disconnect() =>
  Debug("Disconnecting network")


/************************************************************************/
fun toIPv4(env : Env, arg : String val) : (String val | None) =>
  """
  Convert a string to an ip4 address or None if it is not valid
  """  
  if (DNS.is_ip4(arg)) then return arg end
  
  try
    var addrs : Array[NetAddress val] = DNS.ip4(DNSAuth(env.root), arg, "")
    (var addr, var port) = addrs(0)?.name()?
    return addr
  end
  None