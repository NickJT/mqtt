# TCPConnectionNotify
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-1)</span>

Notifications for TCP connections.

For an example of using this class please see the documentation for the
`TCPConnection` and `TCPListener` actors.


```pony
interface ref TCPConnectionNotify
```

## Public Functions

### accepted
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-8)</span>


Called when a TCPConnection is accepted by a TCPListener.


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

### proxy_via
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-14)</span>


Called before before attempting to connect to the destination server
In order to connect via proxy, return the host & service for the proxy
server.

An implementation of this function might look like:
```pony
let _proxy_host = "some-proxy.example.com"
let _proxy_service = "80"
var _destination_host: ( None | String )
var _destination_service: ( None | String )

fun ref proxy_via(host: String, service: String): (String, String) =>
  _destination_host = host
  _destination_service = service
  ( _proxy_host, _proxy_service )
```


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

### connecting
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-35)</span>


Called if name resolution succeeded for a TCPConnection and we are now
waiting for a connection to the server to succeed. The count is the number
of connections we're trying. The notifier will be informed each time the
count changes, until a connection is made or connect_failed() is called.


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

### connected
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-44)</span>


Called when we have successfully connected to the server.


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

### connect_failed
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-50)</span>


Called when we have failed to connect to all possible addresses for the
server. At this point, the connection will never be established.

It is expected to implement proper error handling. You need to opt in to
ignoring errors, which can be implemented like this:

```pony
fun ref connect_failed(conn: TCPConnection ref) =>
  None
```


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

### auth_failed
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-64)</span>


A raw TCPConnection has no authentication mechanism. However, when
protocols are wrapped in other protocols, this can be used to report an
authentication failure in a lower level protocol (e.g. SSL).


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
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-72)</span>


Called when data is sent on the connection. This gives the notifier an
opportunity to modify sent data before it is written. To swallow data,
return an empty string.


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
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-80)</span>


Called when multiple chunks of data are sent to the connection in a single
call. This gives the notifier an opportunity to modify the sent data chunks
before they are written. To swallow the send, return an empty
Array[String].


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

### received
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-89)</span>


Called when new data is received on the connection. Return true if you
want to continue receiving messages without yielding until you read
max_size on the TCPConnection. Return false to cause the TCPConnection
to yield now.

Includes the number of times during the current behavior, that received has
been called. This allows the notifier to end reads on a regular basis.


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

### expect
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-106)</span>


Called when the connection has been told to expect a certain quantity of
bytes. This allows nested notifiers to change the expected quantity, which
allows a lower level protocol to handle any framing (e.g. SSL).


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

### closed
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-114)</span>


Called when the connection is closed.


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

### throttled
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-120)</span>


Called when the connection starts experiencing TCP backpressure. You should
respond to this by pausing additional calls to `write` and `writev` until
you are informed that pressure has been released. Failure to respond to
the `throttled` notification will result in outgoing data queuing in the
connection and increasing memory usage.


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
<span class="source-link">[[Source]](src/net/tcp_connection_notify.md#L-0-130)</span>


Called when the connection stops experiencing TCP backpressure. Upon
receiving this notification, you should feel free to start making calls to
`write` and `writev` again.


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

