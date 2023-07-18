---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "collections"
use "../utilities"

/********************************************************************************/
type ArrayVal is Array[U8 val] val
  """
  A basic typedef for the type we use to construct packets for sending over the socket 
  to the broker
  """

/********************************************************************************/
type IdType is U16
  """
  The type of the packet id as defined by the protocol specification
  """

/********************************************************************************/
//QoS Types Note - QoS flag primitives for Publish Packets are in pubFlags.pony
  // Note - DO NOT USE THESE FOR WILL QOS
  primitive Qos0 fun apply(): U8 => 0 fun string() : String => "QoS 0" 
  primitive Qos1 fun apply(): U8 => 1 fun string() : String => "QoS 1"
  primitive Qos2 fun apply(): U8 => 2 fun string() : String => "QoS 2"

/********************************************************************************/
type Qos is (Qos0 | Qos1| Qos2)
  """
  A typeDef for the three quality of service flags 
  """

/********************************************************************************/
trait Packet
  """
  The minimum set of functions needed to extract the information in the fixed header
  and enable the packet to be interpreted correctly
  """
  fun isValid() : Bool 
  """
  True if the packet has been validated
  """
  fun isA(control : ControlArrayVal) : Bool
  """
  True if the top four bits in the byte passed as value match the
  ControlArrayVal passed as controlType or false otherwise.
  """
  fun controlType() : (ControlArrayVal  | None) 
  """
  The MQTT message type which should only be None if isValid() returns false
  """
  fun controlByte() : (U8 | None)
  """
  The control byte which should only be None if isValid() returns false
  """
  fun fixedHeaderLength() : USize
  """
  The sum of the control byte and the number of bytes in the remaining length field.
  """
  fun remainingLength() : USize
  """
  The decoded value of the remaining length field. 
  """
  fun data() : ArrayVal
  """
  Returns the raw bytes of the packet as a sendable array of U8 (ArrayVal)
  """

```````