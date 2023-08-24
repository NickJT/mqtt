---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
"""
Responsible for:
1. building the connection packet and sending it to the Broker via router.send
2. receiving and interpreting the returned ConnAck packet
3. telling router whether to start a new session or to restore an established
session.

If we are not accepted then we call the onBrokerRefusal behavior on the router and 
exit. The app needs to sort it out.
  
If we are accepted and requested a clean session the Broker will always give us one
so we can just call the onBrokerConnect() behaviour.

If we asked for a session restore (cleansession == 0) then we need to check whether
we got one - and if we did then call _router.onBrokerRestore().

If we asked for a restore and the Broker couldn't oblige then we can't do a
disconnect and reconnect here because as soon as we send a disconnect the Broker
will drop the network connection. Hence we must inform the app and let it go back
through the network connection process. We do this by calling onBrokerStateNotFound()
on router.

Note - Because we are still early in the connection process we will pass connector a
tag to router when it is created and let it call the router behaviours directly instead
of going through the registrar.
"""

use "debug"
use "collections"

use "package:../primitives"
use "package:../router"
use "package:../utilities"
use ".."

actor Connector
"""
Responsible for:
1. building the connection packet and sending it to the Broker via router.send
2. receiving and interpreting the returned ConnAck packet
3. telling router whether to start a new session or to restore an established
session.
"""
  let _router : Router
  var _cleanSessionRequested : Bool = true  
  """
  Set in the connect behaviour if the config includes CleanSession = 1
  and reset if CleanSession = 0 (i.e. restore a saved sessions)
  """

  new create(router : Router tag) =>
    _router = router
    
  be connect( config : Map[String val, String val] val) =>
    var cp : ConnectPacket = ConnectPacket(config)
    if (not cp.isValid()) then 
      Debug.err("Invalid connect packet (or I'm a Mock Broker) at " + __loc.file() + ":" +__loc.method_name())
      return
    end
    _cleanSessionRequested = (cp.isSet(ConnectClean))
    _router.send(cp.getPacket())
    _router.onStatus("Sent connect packet with CleanSession = " + _cleanSessionRequested.string())

  be onAck(basePacket: BasePacket val) =>
    // TODO - Optimse out the intermediates once we have the logic correct
    var connAck  : ConnAckPacket = ConnAckPacket(basePacket)

    // Deal with the easy case first - we have not been accepted
    if (not (connAck.sessionAccepted())) then
      _router.onBrokerRefusal(connAck.returnCode())
      return
    end

    // If we requested a clean session the Broker will 
    // always give us one
    if (_cleanSessionRequested) then 
    // We've been accepted and we have a clean session
      _router.onBrokerConnect() 
      return
    end

    // If we get here then we did not ask for a clean session, so we are
    // expecting a session to be present in the Broker. Check whether
    // we got one or not.

    if connAck.sessionPresent() then
      _router.onBrokerRestore() 
      return
    end

    // If we get here then we asked for a restore but the Broker couldn't oblige. 
    // We can't do a (disconnect + reconnect) here because as soon
    // as we send a disconnect the Broker will drop the network connection
    // Hence we must either: 1) inform the app and let it go back through the 
    // network connection process, or 2) just drop our saved state and carry on
    // TODO - Dropping saved state and continuing on session not found - review this.
    _router.onBrokerStateNotFound()
      
 
    
    
```````