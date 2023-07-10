
/**********************************************************/  
// Publish Flags
/**********************************************************/  
primitive PublishDUP      fun apply() : U8 =>  0b00001000 
primitive PublishQos0     fun apply() : U8 =>  0
primitive PublishQos1     fun apply() : U8 =>  0b00000010
primitive PublishQos2     fun apply() : U8 =>  0b00000100
primitive PublishRetain   fun apply() : U8 =>  0b00000001

type MQTTPublishFlags is (
  PublishDUP  
| PublishQos0  
| PublishQos1  
| PublishQos2  
| PublishRetain  
)
