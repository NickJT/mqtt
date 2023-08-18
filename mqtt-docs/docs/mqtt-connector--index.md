The conector actor is responsible for:  
1. building the connection packet and sending it to the Broker via router.send  
2. receiving and interpreting the returned ConnAck packet  
3. telling router whether to start a new session or to restore an established
session.  
Connector is a separate actor because we may want to add some error handling/re-try behaviour later


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
