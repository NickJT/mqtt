# ConnectPacket
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-7)</span>

Fixed header  
B1  Control byte (must be 0b00010000)  
B2  Remaining Length - This is the length of variable header (10) plus the  
 length of the payload (string length + 2).  

Variable header  
B1 - B6   Protocol name (must be 0,4,M,Q,T,T)  
B7 -      Protocol Level (must be 0x04)  
B8 -      Connect Flags (see below)
B9 - B10  Keep Alive (MSB, LSB)  

Payload  
The payload of the CONNECT Packet contains one or more length-prefixed fields as  
determined by the flags in the variable header.  These fields, if present, MUST  
appear in the order
- Client Identifier  
- Will Topic  
- Will Message  
- User Name  
- Password 



```pony
class ref ConnectPacket
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-106)</span>


Create an instance of a connect packet using the passed config parameters


```pony
new ref create(
  config: HashMap[String val, String val, HashEq[String val] val] val)
: ConnectPacket ref^
```
#### Parameters

*   config: [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

#### Returns

* [ConnectPacket](mqtt-connector-ConnectPacket.md) ref^

---

## Public fields

### let defaultKeepAlive: [U8](builtin-U8.md) val
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-56)</span>

This is a default value of the _keepAlive LSB which is used in the event we can't retrieve the 
the string in the .ini file or convert it into a valid 16 bit number.




---

## Public Functions

### getPacket
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-126)</span>


Return a connect packet ready to send to the broker


```pony
fun box getPacket()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### isValid
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-132)</span>


This is set false on instantiation and only set true if we have valid data


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### isSet
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-183)</span>


Test the value of the passed flag in the class field and returns
true if it is set


```pony
fun box isSet(
  flag: (ConnectUserName val | ConnectPassword val | ConnectWill val | 
    ConnectWQos0 val | ConnectWQos1 val | ConnectWQos2 val | 
    ConnectWRetain val | ConnectClean val))
: Bool val
```
#### Parameters

*   flag: ([ConnectUserName](mqtt-connector-ConnectUserName.md) val | [ConnectPassword](mqtt-connector-ConnectPassword.md) val | [ConnectWill](mqtt-connector-ConnectWill.md) val | 
    [ConnectWQos0](mqtt-connector-ConnectWQos0.md) val | [ConnectWQos1](mqtt-connector-ConnectWQos1.md) val | [ConnectWQos2](mqtt-connector-ConnectWQos2.md) val | 
    [ConnectWRetain](mqtt-connector-ConnectWRetain.md) val | [ConnectClean](mqtt-connector-ConnectClean.md) val)

#### Returns

* [Bool](builtin-Bool.md) val

---

## Private Functions

### _assemble
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-138)</span>


Build a connect packet based on the current state of the local variables for each field


```pony
fun box _assemble()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### _makeKeepAlive
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-199)</span>


Sets the class variable _keepAlive that determines the keep alive time is seconds
If we fail any of the validation tests we do not set the class variable and leave
the packet builder to use a default value of 60 seconds


```pony
fun ref _makeKeepAlive(
  kaString: String val)
: Array[U8 val] val
```
#### Parameters

*   kaString: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### _makeSession
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-219)</span>


Sets the field controling whether we start with a clean session or restore a past 
session. If it is true then client and broker delete the old session. If it is false
then the client and the Broker must restore from disc and save the session after the 
network disconnect.


```pony
fun ref _makeSession(
  csString: String val)
: Bool val
```
#### Parameters

*   csString: [String](builtin-String.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### _setWill
<span class="source-link">[[Source]](src/mqtt-connector/connectPacket.md#L-0-234)</span>


Sets the will topic, message and handling flags  


```pony
fun ref _setWill(
  topic: String val,
  msg: String val,
  qos: String val,
  retain: Bool val = true)
: None val
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   msg: [String](builtin-String.md) val
*   qos: [String](builtin-String.md) val
*   retain: [Bool](builtin-Bool.md) val = true

#### Returns

* [None](builtin-None.md) val

---

