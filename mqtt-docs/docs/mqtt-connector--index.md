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


## Public Types

* [primitive ConnAckAccepted](mqtt-connector-ConnAckAccepted.md)
* [class ConnAckPacket](mqtt-connector-ConnAckPacket.md)
* [primitive ConnAckRefusedBadUserNameOrPassword](mqtt-connector-ConnAckRefusedBadUserNameOrPassword.md)
* [primitive ConnAckRefusedIdentifierRejected](mqtt-connector-ConnAckRefusedIdentifierRejected.md)
* [primitive ConnAckRefusedNotAuthorised](mqtt-connector-ConnAckRefusedNotAuthorised.md)
* [primitive ConnAckRefusedProtocolVersion](mqtt-connector-ConnAckRefusedProtocolVersion.md)
* [primitive ConnAckRefusedServerUnavailable](mqtt-connector-ConnAckRefusedServerUnavailable.md)
* [type ConnAckReturnCode](mqtt-connector-ConnAckReturnCode.md)
* [primitive ConnectClean](mqtt-connector-ConnectClean.md)
* [type ConnectFlags](mqtt-connector-ConnectFlags.md)
* [class ConnectPacket](mqtt-connector-ConnectPacket.md)
* [primitive ConnectPassword](mqtt-connector-ConnectPassword.md)
* [primitive ConnectQMask](mqtt-connector-ConnectQMask.md)
* [primitive ConnectUserName](mqtt-connector-ConnectUserName.md)
* [primitive ConnectWQos0](mqtt-connector-ConnectWQos0.md)
* [primitive ConnectWQos1](mqtt-connector-ConnectWQos1.md)
* [primitive ConnectWQos2](mqtt-connector-ConnectWQos2.md)
* [primitive ConnectWRetain](mqtt-connector-ConnectWRetain.md)
* [primitive ConnectWill](mqtt-connector-ConnectWill.md)
* [actor Connector](mqtt-connector-Connector.md)
* [primitive DefaultConnectFlags](mqtt-connector-DefaultConnectFlags.md)
* [class DisconnectPacket](mqtt-connector-DisconnectPacket.md)
* [primitive RejectionCode](mqtt-connector-RejectionCode.md)
* [primitive RestoreConnectFlags](mqtt-connector-RestoreConnectFlags.md)
