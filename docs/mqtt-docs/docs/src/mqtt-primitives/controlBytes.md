---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

primitive ControlConnect fun apply() : U8 => 1  fun string() : String => "Connect"
primitive ControlConnAck fun apply() : U8 => 2 fun string() : String => "Conn Ack"
primitive ControlPublish  fun apply() : U8 => 3 fun string() : String => "Publish"
primitive ControlPubAck  fun apply() : U8 => 4 fun string() : String => "Pub Ack"
primitive ControlPubRec fun apply() : U8 => 5 fun string() : String => "Pub Rec"
primitive ControlPubRel fun apply() : U8 => 6 fun string() : String => "Pub Rel"
primitive ControlPubComp fun apply() : U8 => 7 fun string() : String => "Pub Comp"
primitive ControlSubscribe  fun apply() : U8 => 8 fun string() : String => "Subscribe"
primitive ControlSubAck fun apply() : U8 => 9 fun string() : String => "SubAck"
primitive ControlUnsubscribe  fun apply() : U8 => 10 fun string() : String => "Unsubscribe"
primitive ControlUnsubAck  fun apply() : U8 => 11 fun string() : String => "Unsub Ack"
primitive ControlPingReq fun apply() : U8 => 12 fun string() : String => "Ping Req"
primitive ControlPingResp fun apply() : U8 => 13 fun string() : String => "Ping Resp"
primitive ControlDisconnect fun apply() : U8 => 14 fun string() : String => "Disconnect"

type ControlArrayVal is (
 ControlConnect 
| ControlConnAck 
| ControlPublish  
| ControlPubAck   
| ControlPubRec  
| ControlPubRel  
| ControlPubComp 
| ControlSubscribe  
| ControlSubAck  
| ControlUnsubscribe 
| ControlUnsubAck 
| ControlPingReq 
| ControlPingResp
| ControlDisconnect 
)

// TODO - Change this subtype into types for subscribers and types for publishers
// Packet types where the id bytes are always Bytes 2 and 3
type PacketIdentifierType is (
//  ControlPublish  
 ControlPubAck   
| ControlPubRec  
| ControlPubComp 
//| ControlSubscribe  
//| ControlSubAck  
//| ControlUnsubscribe 
//| ControlUnsubAck 
)

type PacketNoIdentifierType is (
  ControlConnect 
| ControlConnAck 
| ControlPingReq 
| ControlPingResp
| ControlDisconnect 
)

type PacketWithTopicType is (
  ControlPublish
|  ControlSubscribe
|  ControlUnsubscribe
)

type CPWithFlags /*0, 0, 1, 0 */ is (
  ControlPubRel 
| ControlSubscribe 
| ControlUnsubscribe )

primitive CPFlags fun apply() : U8 => 0b00000010

type CPNoFlags /* 0, 0, 0, 0 */  is ( 
  ControlConnect 
| ControlConnAck 
| ControlPublish  
| ControlPubAck   
| ControlPubRec  
| ControlPubComp 
| ControlSubAck  
| ControlUnsubAck 
| ControlPingReq 
| ControlPingResp
| ControlDisconnect)


```````