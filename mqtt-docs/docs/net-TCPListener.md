# TCPListener
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-9)</span>

Listens for new network connections.

The following program creates an echo server that listens for
connections on port 8989 and echoes back any data it receives.

```pony
use "net"

class MyTCPConnectionNotify is TCPConnectionNotify
  fun ref received(
    conn: TCPConnection ref,
    data: Array[U8] iso,
    times: USize)
    : Bool
  =>
    conn.write(String.from_array(consume data))
    true

  fun ref connect_failed(conn: TCPConnection ref) =>
    None

class MyTCPListenNotify is TCPListenNotify
  fun ref connected(listen: TCPListener ref): TCPConnectionNotify iso^ =>
    MyTCPConnectionNotify

  fun ref not_listening(listen: TCPListener ref) =>
    None

actor Main
  new create(env: Env) =>
    TCPListener(TCPListenAuth(env.root),
      recover MyTCPListenNotify end, "", "8989")
```


```pony
actor tag TCPListener is
  AsioEventNotify tag
```

#### Implements

* [AsioEventNotify](builtin-AsioEventNotify.md) tag

---

## Constructors

### create
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-56)</span>


Listens for both IPv4 and IPv6 connections.


```pony
new tag create(
  auth: TCPListenAuth val,
  notify: TCPListenNotify iso,
  host: String val = "",
  service: String val = "0",
  limit: USize val = 0,
  read_buffer_size: USize val = 16384,
  yield_after_reading: USize val = 16384,
  yield_after_writing: USize val = 16384)
: TCPListener tag^
```
#### Parameters

*   auth: [TCPListenAuth](net-TCPListenAuth.md) val
*   notify: [TCPListenNotify](net-TCPListenNotify.md) iso
*   host: [String](builtin-String.md) val = ""
*   service: [String](builtin-String.md) val = "0"
*   limit: [USize](builtin-USize.md) val = 0
*   read_buffer_size: [USize](builtin-USize.md) val = 16384
*   yield_after_reading: [USize](builtin-USize.md) val = 16384
*   yield_after_writing: [USize](builtin-USize.md) val = 16384

#### Returns

* [TCPListener](net-TCPListener.md) tag^

---

### ip4
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-79)</span>


Listens for IPv4 connections.


```pony
new tag ip4(
  auth: TCPListenAuth val,
  notify: TCPListenNotify iso,
  host: String val = "",
  service: String val = "0",
  limit: USize val = 0,
  read_buffer_size: USize val = 16384,
  yield_after_reading: USize val = 16384,
  yield_after_writing: USize val = 16384)
: TCPListener tag^
```
#### Parameters

*   auth: [TCPListenAuth](net-TCPListenAuth.md) val
*   notify: [TCPListenNotify](net-TCPListenNotify.md) iso
*   host: [String](builtin-String.md) val = ""
*   service: [String](builtin-String.md) val = "0"
*   limit: [USize](builtin-USize.md) val = 0
*   read_buffer_size: [USize](builtin-USize.md) val = 16384
*   yield_after_reading: [USize](builtin-USize.md) val = 16384
*   yield_after_writing: [USize](builtin-USize.md) val = 16384

#### Returns

* [TCPListener](net-TCPListener.md) tag^

---

### ip6
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-102)</span>


Listens for IPv6 connections.


```pony
new tag ip6(
  auth: TCPListenAuth val,
  notify: TCPListenNotify iso,
  host: String val = "",
  service: String val = "0",
  limit: USize val = 0,
  read_buffer_size: USize val = 16384,
  yield_after_reading: USize val = 16384,
  yield_after_writing: USize val = 16384)
: TCPListener tag^
```
#### Parameters

*   auth: [TCPListenAuth](net-TCPListenAuth.md) val
*   notify: [TCPListenNotify](net-TCPListenNotify.md) iso
*   host: [String](builtin-String.md) val = ""
*   service: [String](builtin-String.md) val = "0"
*   limit: [USize](builtin-USize.md) val = 0
*   read_buffer_size: [USize](builtin-USize.md) val = 16384
*   yield_after_reading: [USize](builtin-USize.md) val = 16384
*   yield_after_writing: [USize](builtin-USize.md) val = 16384

#### Returns

* [TCPListener](net-TCPListener.md) tag^

---

## Public Behaviours

### set_notify
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-125)</span>


Change the notifier.


```pony
be set_notify(
  notify: TCPListenNotify iso)
```
#### Parameters

*   notify: [TCPListenNotify](net-TCPListenNotify.md) iso

---

### dispose
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-131)</span>


Stop listening.


```pony
be dispose()
```

---

## Public Functions

### local_address
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-137)</span>


Return the bound IP address.


```pony
fun box local_address()
: NetAddress val
```

#### Returns

* [NetAddress](net-NetAddress.md) val

---

### close
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-246)</span>


Dispose of resources.


```pony
fun ref close()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

## Private Behaviours

### _event_notify
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-145)</span>


When we are readable, we accept new connections until none remain.


```pony
be _event_notify(
  event: Pointer[AsioEvent val] tag,
  flags: U32 val,
  arg: U32 val)
```
#### Parameters

*   event: [Pointer](builtin-Pointer.md)\[[AsioEvent](builtin-AsioEvent.md) val\] tag
*   flags: [U32](builtin-U32.md) val
*   arg: [U32](builtin-U32.md) val

---

### _conn_closed
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-162)</span>


An accepted connection has closed. If we have dropped below the limit, try
to accept new connections.


```pony
be _conn_closed()
```

---

## Private Functions

### _accept
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-174)</span>


Accept connections as long as we have spawned fewer than our limit.


```pony
fun ref _accept(
  ns: U32 val = 0)
: None val
```
#### Parameters

*   ns: [U32](builtin-U32.md) val = 0

#### Returns

* [None](builtin-None.md) val

---

### _spawn
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-223)</span>


Spawn a new connection.


```pony
fun ref _spawn(
  ns: U32 val)
: None val
```
#### Parameters

*   ns: [U32](builtin-U32.md) val

#### Returns

* [None](builtin-None.md) val

---

### _notify_listening
<span class="source-link">[[Source]](src/net/tcp_listener.md#L-0-235)</span>


Inform the notifier that we're listening.


```pony
fun ref _notify_listening()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

