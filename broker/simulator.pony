use "net"

actor Main
  new create(env: Env) =>
    let delay = try
      env.args(1)?.usize()?
    else
      1
    end

    TCPListener(TCPListenAuth(env.root), recover Listener(env, delay) end, "192.168.86.144","1883")
