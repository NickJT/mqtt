"""
IdIssuer is responsible for managing the issuing and reissuing of message ids. Ids must be unique for 
in-flight messages so we need a check-in/check-out system so we don't overflow the U16.

> SUBSCRIBE, UNSUBSCRIBE, and PUBLISH (in cases where QoS > 0) Control Packets contain a non-zero
16-bit Packet Identifier in big endian format. If a Client re-sends a particular Control Packet,
then it MUST use the same Packet Identifier in subsequent re-sends of that packet.The Packet
Identifier becomes available for reuse after the Client has processed the corresponding  
acknowledgement packet. In the case of a QoS 1 PUBLISH this is the corresponding PUBACK  
In the case of QoS 2 it is PUBCOMP. For SUBSCRIBE or UNSUBSCRIBE it is the corresponding
SUBACK or UNSUBACK.  

"""