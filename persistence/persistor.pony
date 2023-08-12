use "debug"
use "package:../primitives"
use "package:../utilities"

Actor Persistor

  new create() =>
    Debug.err("Created persistor")

  be persist(data : ArrayVal val) =>
    // This bit just for dev
    var pkt = BasePacket(data)
    Debug.err("Saved a " + pkt.controlType().string())
