use "pony_test"
use primitives = "../primitives"
use utilities = "../utilities"
use configurator = "../configurator"
use idIssuer = "../idIssuer"
use pinger = "../pinger"
use publisher = "../publisher"
use subscriber = "../subscriber"

actor \nodoc\ Main is TestList
  let _env : Env
  new create(env: Env) =>
    _env = env
    PonyTest(_env, this)

  new make(env: Env) =>
    _env = env



  fun tag tests(test: PonyTest) =>
    primitives.Main.make().tests(test)
    utilities.Main.make().tests(test)
    configurator.Main.make().tests(test)
    idIssuer.Main.make().tests(test)
    pinger.Main.make().tests(test)
    publisher.Main.make().tests(test)
    subscriber.Main.make().tests(test)
    