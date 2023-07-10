use "../primitives"

primitive FlagsToQos fun apply(value : U8 val) : Qos =>
"""
Takes an unmasked control byte and extracts the Qos from bits 1 and 2.
Return QoS0 for invalid flags
TODO - Combine with above once we have all the use cases surfaced
"""
  match (value and 0b00000110)
  | 2 => Qos1
  | 4 => Qos2
  else
    Qos0
  end

primitive QosToFlags fun apply(q : Qos val) : U8 val =>
"""
Take a Qos and return the Qos flags for bits 1 and 2 of the 
Publish Packet
Note - Combine with above once we have all the use cases surfaced
"""
  match q
  | Qos0 => 0b00000000
  | Qos1 => 0b00000010
  | Qos2 => 0b00000100
  end


primitive IsDup fun apply(value : U8 val) : Bool =>
"""
Returns true if the DUP flag is set in the control byte
"""
  ((value and PublishDUP()) != 0)


primitive IsRetain fun apply(value : U8 val) : Bool =>
"""
Returns true if the retain flag is set in the control bytes
"""
  ((value and PublishRetain()) != 0)


