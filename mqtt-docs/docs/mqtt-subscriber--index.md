The actor and classes needed to subscribe to messages from the Broker and handle the ensuing 
handshakes.  
Note - This package includes suback codes on the basis that it may be better to interpret these
within the library code and return a string to the app than to return a code. 


## Public Types

* [primitive SubAckFailure](mqtt-subscriber-SubAckFailure.md)
* [class SubAckPacket](mqtt-subscriber-SubAckPacket.md)
* [primitive SubAckSuccessMaxQos0](mqtt-subscriber-SubAckSuccessMaxQos0.md)
* [primitive SubAckSuccessMaxQos1](mqtt-subscriber-SubAckSuccessMaxQos1.md)
* [primitive SubAckSuccessMaxQos2](mqtt-subscriber-SubAckSuccessMaxQos2.md)
* [type SubackReturnCode](mqtt-subscriber-SubackReturnCode.md)
* [class SubscribePacket](mqtt-subscriber-SubscribePacket.md)
* [actor Subscriber](mqtt-subscriber-Subscriber.md)
* [class UnsubscribePacket](mqtt-subscriber-UnsubscribePacket.md)
