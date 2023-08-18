---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

/*****************************************************/  
primitive ConnectUserName fun apply() : U8 => 128
primitive ConnectPassword fun apply() : U8 =>  64
primitive ConnectWRetain  fun apply() : U8 =>  32
primitive ConnectWQos2    fun apply() : U8 =>  16
primitive ConnectWQos1    fun apply() : U8 =>   8
primitive ConnectWill     fun apply() : U8 =>   4
primitive ConnectClean    fun apply() : U8 =>   2
primitive ConnectWQos0    fun apply() : U8 =>   0
primitive ConnectQMask    fun apply() : U8 =>   0b11100111

primitive DefaultConnectFlags fun apply() : U8 =>
 (ConnectUserName() or
  ConnectPassword() or
  ConnectWQos1() or
  ConnectWill() or
  ConnectWRetain() or
  ConnectClean())

primitive RestoreConnectFlags fun apply() : U8 =>
 (ConnectUserName() or
  ConnectPassword() or
  ConnectWQos1() or
  ConnectWill() or
  ConnectWRetain())

type ConnectFlags is (
  ConnectUserName 
| ConnectPassword 
| ConnectWill    
| ConnectWQos0  | ConnectWQos1 | ConnectWQos2  
| ConnectWRetain
| ConnectClean    
)

```````