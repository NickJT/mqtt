---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
/*****************************************************/  
//Sub ACK Codes
/*****************************************************/  
primitive SubAckSuccessMaxQos0  fun apply() : U8 =>  0
primitive SubAckSuccessMaxQos1  fun apply() : U8 =>  1
primitive SubAckSuccessMaxQos2  fun apply() : U8 =>  2
primitive SubAckFailure         fun apply() : U8 =>  128


type SubackReturnCode is (
  SubAckSuccessMaxQos0
| SubAckSuccessMaxQos1
| SubAckSuccessMaxQos2
| SubAckFailure 
)

```````