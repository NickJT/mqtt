use "pony_test"
use primitives = "package:../primitives"
use utilities = "package:../utilities"
use configurator = "package:../configurator"
use idIssuer = "package:../idIssuer"
use pinger = "package:../pinger"
use publisher = "package:../publisher"
use subscriber = "package:../subscriber"

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
    