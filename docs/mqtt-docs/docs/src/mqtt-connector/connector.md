---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "debug"
use "collections"

use "../primitives"
use "../utilities"
use ".."

actor Connector
"""
Responsible for:
1. building the connection packet and sending it to the Broker via router.send
2. receiving and interpreting the returned ConnAck packet
3. telling router whether to start a new session or to restore an established
session.

Doesn't do much else at present but could be a repository for remedial actions if
the broker doesn't connect (depending on the return code)

It may be more consistent to pass connector the registrar and let it retrieve router from there.
However, as we are still early in the connection process and there is no need for async processes
at this stage we will pass connector a tag to router and let it call the router behaviours 
directly.
"""
  let _router : Router

  new create(router : Router tag) =>
    _router = router
    
  be connect( config : Map[String val, String val] val) =>
    var cp : ConnectPacket = ConnectPacket(config)
    if (not cp.isValid()) then 
      Debug("Invalid connect packet (or I'm a Mock Broker) at " + __loc.file() + ":" +__loc.method_name())
      return
    end

    _router.send(cp.getPacket())
    _router.sendToMain("Sent connect packet at " , __loc.file() + ":" +__loc.method_name())
  

  be onAck(basePacket: BasePacket val) =>
    var connAck  : ConnAckPacket = ConnAckPacket(basePacket)

    if connAck.sessionPresent()  then _router.onBrokerRestore() 
    elseif connAck.sessionAccepted() then _router.onBrokerConnect()
    else _router.onBrokerRefusal(connAck.returnCode())
    end
    
    
```````