use "debug"
use "package:../primitives"
use "package:../utilities"

Actor Persistor

  new create() =>
    Debug("Created persistor")

  be persist(data : ArrayVal val) =>
    // This bit just for dev
    var pkt = BasePacket(data)
    Debug("Saved a " + pkt.controlType().string())
