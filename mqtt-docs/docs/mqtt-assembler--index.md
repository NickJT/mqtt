Assembler accepts an array of bytes of arbitrary length received from the TCP buffer. It
assembles these into MQTT packets, wraps them in the BasePacket class and passes them
on to the router.
Incomming TCP buffers may contain:  
1.  one or more complete MQTT packets or  
2.  one or more complete MQTT packets followed by a partial packet 
3.  the trailing end of a packet, followed by zero or more complete or partial packets

The only guarantee we assume is that the first buffer of data starts with the fixed header of a valid MQTT packet


## Public Types

* [actor Assembler](mqtt-assembler-Assembler.md)
* [type Stream](mqtt-assembler-Stream.md)
