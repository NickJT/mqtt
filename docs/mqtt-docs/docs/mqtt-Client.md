# Client
<span class="source-link">[[Source]](src/mqtt/client.md#L-0-10)</span>

This class manages the TCP level connection and any set-up or tear-down necessary on network connection and 
disconnection. It doesn't get involved in Broker level connections.

Assume that the TCP buffers returned by received() are of arbitrary size and may have:
1. One or more MQTT packets
2. A trailing fragment of an MQTT packet 
3. Both of the above

Client constructs the Router with the config details from main and then adds the router to the registrar.
Once Client gets an established TCP connection Router is passed this in its OnTcpConnect behaviour. Router
can then start the Broker connection process. This is a bit of a long way around but we need to be sure 
we don't generate any incomming messages before the connection is available. 

Assembler is constructed and passed the tag of the router so that it knows where to send the 
assembled packets. Assembler is not added to registrar because only client needs to access it.

Otherwise, the client contains the callbacks called by TCPConnection when the connection state
changes.

Registrar usage  
- Client adds the router to reg 


```pony
class ref Client is
  TCPConnectionNotify ref
```

#### Implements

* [TCPConnectionNotify](net-TCPConnectionNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt/client.md#L-0-43)</span>


```pony
new iso create(
  env: Env val,
  reg: Registrar tag,
  config: HashMap[String val, String val, HashEq[String val] val] val)
: Client iso^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   config: [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

#### Returns

* [Client](mqtt-Client.md) iso^

---

## Public Functions

### connecting
<span class="source-link">[[Source]](src/mqtt/client.md#L-0-54)</span>


```pony
fun ref connecting(
  conn: TCPConnection ref,
  count: U32 val)
: None val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref
*   count: [U32](builtin-U32.md) val

#### Returns

* [None](builtin-None.md) val

---

### accepted
<span class="source-link">[[Source]](src/mqtt/client.md#L-0-57)</span>


```pony
fun ref accepted(
  conn: TCPConnection ref)
: None val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref

#### Returns

* [None](builtin-None.md) val

---

### connected
<span class="source-link">[[Source]](src/mqtt/client.md#L-0-60)</span>


```pony
fun ref connected(
  conn: TCPConnection ref)
: None val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref

#### Returns

* [None](builtin-None.md) val

---

### received
<span class="source-link">[[Source]](src/mqtt/client.md#L-0-69)</span>


```pony
fun ref received(
  conn: TCPConnection ref,
  data: Array[U8 val] iso,
  times: USize val)
: Bool val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref
*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] iso
*   times: [USize](builtin-USize.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### connect_failed
<span class="source-link">[[Source]](src/mqtt/client.md#L-0-73)</span>


```pony
fun ref connect_failed(
  conn: TCPConnection ref)
: None val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref

#### Returns

* [None](builtin-None.md) val

---

### closed
<span class="source-link">[[Source]](src/mqtt/client.md#L-0-76)</span>


```pony
fun ref closed(
  conn: TCPConnection ref)
: None val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref

#### Returns

* [None](builtin-None.md) val

---

### proxy_via



```pony
fun ref proxy_via(
  host: String val,
  service: String val)
: (String val , String val)
```
#### Parameters

*   host: [String](builtin-String.md) val
*   service: [String](builtin-String.md) val

#### Returns

* ([String](builtin-String.md) val , [String](builtin-String.md) val)

---

### auth_failed



```pony
fun ref auth_failed(
  conn: TCPConnection ref)
: None val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref

#### Returns

* [None](builtin-None.md) val

---

### sent



```pony
fun ref sent(
  conn: TCPConnection ref,
  data: (String val | Array[U8 val] val))
: (String val | Array[U8 val] val)
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref
*   data: ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)

#### Returns

* ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)

---

### sentv



```pony
fun ref sentv(
  conn: TCPConnection ref,
  data: ByteSeqIter val)
: ByteSeqIter val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref
*   data: [ByteSeqIter](builtin-ByteSeqIter.md) val

#### Returns

* [ByteSeqIter](builtin-ByteSeqIter.md) val

---

### expect



```pony
fun ref expect(
  conn: TCPConnection ref,
  qty: USize val)
: USize val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref
*   qty: [USize](builtin-USize.md) val

#### Returns

* [USize](builtin-USize.md) val

---

### throttled



```pony
fun ref throttled(
  conn: TCPConnection ref)
: None val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref

#### Returns

* [None](builtin-None.md) val

---

### unthrottled



```pony
fun ref unthrottled(
  conn: TCPConnection ref)
: None val
```
#### Parameters

*   conn: [TCPConnection](net-TCPConnection.md) ref

#### Returns

* [None](builtin-None.md) val

---

