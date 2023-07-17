# UDPSocket
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-19)</span>

Creates a UDP socket that can be used for sending and receiving UDP messages.

The following examples create:

* an echo server that listens for connections and returns whatever message it
  receives
* a client that connects to the server, sends a message, and prints the
  message it receives in response

The server is implemented like this:

```pony
use "net"

class MyUDPNotify is UDPNotify
  fun ref received(
    sock: UDPSocket ref,
    data: Array[U8] iso,
    from: NetAddress)
  =>
    sock.write(consume data, from)

  fun ref not_listening(sock: UDPSocket ref) =>
    None

actor Main
  new create(env: Env) =>
    UDPSocket(UDPAuth(env.root),
      MyUDPNotify, "", "8989")
```

The client is implemented like this:

```pony
use "net"

class MyUDPNotify is UDPNotify
  let _out: OutStream
  let _destination: NetAddress

  new create(
    out: OutStream,
    destination: NetAddress)
  =>
    _out = out
    _destination = destination

  fun ref listening(sock: UDPSocket ref) =>
    sock.write("hello world", _destination)

  fun ref received(
    sock: UDPSocket ref,
    data: Array[U8] iso,
    from: NetAddress)
  =>
    _out.print("GOT:" + String.from_array(consume data))
    sock.dispose()

  fun ref not_listening(sock: UDPSocket ref) =>
    None

actor Main
  new create(env: Env) =>
    try
      let destination =
        DNS.ip4(DNSAuth(env.root), "localhost", "8989")(0)?
      UDPSocket(UDPAuth(env.root),
        recover MyUDPNotify(env.out, consume destination) end)
    end
```


```pony
actor tag UDPSocket is
  AsioEventNotify tag
```

#### Implements

* [AsioEventNotify](builtin-AsioEventNotify.md) tag

---

## Constructors

### create
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-102)</span>


Listens for both IPv4 and IPv6 datagrams.


```pony
new tag create(
  auth: UDPAuth val,
  notify: UDPNotify iso,
  host: String val = "",
  service: String val = "0",
  size: USize val = 1024)
: UDPSocket tag^
```
#### Parameters

*   auth: [UDPAuth](net-UDPAuth.md) val
*   notify: [UDPNotify](net-UDPNotify.md) iso
*   host: [String](builtin-String.md) val = ""
*   service: [String](builtin-String.md) val = "0"
*   size: [USize](builtin-USize.md) val = 1024

#### Returns

* [UDPSocket](net-UDPSocket.md) tag^

---

### ip4
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-122)</span>


Listens for IPv4 datagrams.


```pony
new tag ip4(
  auth: UDPAuth val,
  notify: UDPNotify iso,
  host: String val = "",
  service: String val = "0",
  size: USize val = 1024)
: UDPSocket tag^
```
#### Parameters

*   auth: [UDPAuth](net-UDPAuth.md) val
*   notify: [UDPNotify](net-UDPNotify.md) iso
*   host: [String](builtin-String.md) val = ""
*   service: [String](builtin-String.md) val = "0"
*   size: [USize](builtin-USize.md) val = 1024

#### Returns

* [UDPSocket](net-UDPSocket.md) tag^

---

### ip6
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-142)</span>


Listens for IPv6 datagrams.


```pony
new tag ip6(
  auth: UDPAuth val,
  notify: UDPNotify iso,
  host: String val = "",
  service: String val = "0",
  size: USize val = 1024)
: UDPSocket tag^
```
#### Parameters

*   auth: [UDPAuth](net-UDPAuth.md) val
*   notify: [UDPNotify](net-UDPNotify.md) iso
*   host: [String](builtin-String.md) val = ""
*   service: [String](builtin-String.md) val = "0"
*   size: [USize](builtin-USize.md) val = 1024

#### Returns

* [UDPSocket](net-UDPSocket.md) tag^

---

## Public Behaviours

### write
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-162)</span>


Write a single sequence of bytes.


```pony
be write(
  data: (String val | Array[U8 val] val),
  to: NetAddress val)
```
#### Parameters

*   data: ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)
*   to: [NetAddress](net-NetAddress.md) val

---

### writev
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-168)</span>


Write a sequence of sequences of bytes.


```pony
be writev(
  data: ByteSeqIter val,
  to: NetAddress val)
```
#### Parameters

*   data: [ByteSeqIter](builtin-ByteSeqIter.md) val
*   to: [NetAddress](net-NetAddress.md) val

---

### set_notify
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-176)</span>


Change the notifier.


```pony
be set_notify(
  notify: UDPNotify iso)
```
#### Parameters

*   notify: [UDPNotify](net-UDPNotify.md) iso

---

### set_broadcast
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-182)</span>


Enable or disable broadcasting from this socket.


```pony
be set_broadcast(
  state: Bool val)
```
#### Parameters

*   state: [Bool](builtin-Bool.md) val

---

### set_multicast_interface
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-194)</span>


By default, the OS will choose which address is used to send packets bound
for multicast addresses. This can be used to force a specific interface. To
revert to allowing the OS to choose, call with an empty string.


```pony
be set_multicast_interface(
  from: String val = "")
```
#### Parameters

*   from: [String](builtin-String.md) val = ""

---

### set_multicast_loopback
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-204)</span>


By default, packets sent to a multicast address will be received by the
sending system if it has subscribed to that address. Disabling loopback
prevents this.


```pony
be set_multicast_loopback(
  loopback: Bool val)
```
#### Parameters

*   loopback: [Bool](builtin-Bool.md) val

---

### set_multicast_ttl
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-214)</span>


Set the TTL for multicast sends. Defaults to 1.


```pony
be set_multicast_ttl(
  ttl: U8 val)
```
#### Parameters

*   ttl: [U8](builtin-U8.md) val

---

### multicast_join
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-222)</span>


Add a multicast group. This can be limited to packets arriving on a
specific interface.


```pony
be multicast_join(
  group: String val,
  to: String val = "")
```
#### Parameters

*   group: [String](builtin-String.md) val
*   to: [String](builtin-String.md) val = ""

---

### multicast_leave
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-231)</span>


Drop a multicast group. This can be limited to packets arriving on a
specific interface. No attempt is made to check that this socket has
previously added this group.


```pony
be multicast_leave(
  group: String val,
  to: String val = "")
```
#### Parameters

*   group: [String](builtin-String.md) val
*   to: [String](builtin-String.md) val = ""

---

### dispose
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-241)</span>


Stop listening.


```pony
be dispose()
```

---

## Public Functions

### local_address
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-249)</span>


Return the bound IP address.


```pony
fun box local_address()
: NetAddress val
```

#### Returns

* [NetAddress](net-NetAddress.md) val

---

### getsockopt
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-420)</span>


General wrapper for UDP sockets to the `getsockopt(2)` system call.

The caller must provide an array that is pre-allocated to be
at least as large as the largest data structure that the kernel
may return for the requested option.

In case of system call success, this function returns the 2-tuple:
1. The integer `0`.
2. An `Array[U8]` of data returned by the system call's `void *`
   4th argument.  Its size is specified by the kernel via the
   system call's `sockopt_len_t *` 5th argument.

In case of system call failure, this function returns the 2-tuple:
1. The value of `errno`.
2. An undefined value that must be ignored.

Usage example:

```pony
// listening() is a callback function for class UDPNotify
fun ref listening(sock: UDPSocket ref) =>
  match sock.getsockopt(OSSockOpt.sol_socket(), OSSockOpt.so_rcvbuf(), 4)
    | (0, let gbytes: Array[U8] iso) =>
      try
        let br = Reader.create().>append(consume gbytes)
        ifdef littleendian then
          let buffer_size = br.u32_le()?
        else
          let buffer_size = br.u32_be()?
        end
      end
    | (let errno: U32, _) =>
      // System call failed
  end
```


```pony
fun ref getsockopt(
  level: I32 val,
  option_name: I32 val,
  option_max_size: USize val = 4)
: (U32 val , Array[U8 val] iso^)
```
#### Parameters

*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val
*   option_max_size: [USize](builtin-USize.md) val = 4

#### Returns

* ([U32](builtin-U32.md) val , [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] iso^)

---

### getsockopt_u32
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-460)</span>


Wrapper for UDP sockets to the `getsockopt(2)` system call where
the kernel's returned option value is a C `uint32_t` type / Pony
type `U32`.

In case of system call success, this function returns the 2-tuple:
1. The integer `0`.
2. The `*option_value` returned by the kernel converted to a Pony `U32`.

In case of system call failure, this function returns the 2-tuple:
1. The value of `errno`.
2. An undefined value that must be ignored.


```pony
fun ref getsockopt_u32(
  level: I32 val,
  option_name: I32 val)
: (U32 val , U32 val)
```
#### Parameters

*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val

#### Returns

* ([U32](builtin-U32.md) val , [U32](builtin-U32.md) val)

---

### setsockopt
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-476)</span>


General wrapper for UDP sockets to the `setsockopt(2)` system call.

The caller is responsible for the correct size and byte contents of
the `option` array for the requested `level` and `option_name`,
including using the appropriate CPU endian byte order.

This function returns `0` on success, else the value of `errno` on
failure.

Usage example:

```pony
// listening() is a callback function for class UDPNotify
fun ref listening(sock: UDPSocket ref) =>
  let sb = Writer

  sb.u32_le(7744)             // Our desired socket buffer size
  let sbytes = Array[U8]
  for bs in sb.done().values() do
    sbytes.append(bs)
  end
  match sock.setsockopt(OSSockOpt.sol_socket(), OSSockOpt.so_rcvbuf(), sbytes)
    | 0 =>
      // System call was successful
    | let errno: U32 =>
      // System call failed
  end
```


```pony
fun ref setsockopt(
  level: I32 val,
  option_name: I32 val,
  option: Array[U8 val] ref)
: U32 val
```
#### Parameters

*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val
*   option: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] ref

#### Returns

* [U32](builtin-U32.md) val

---

### setsockopt_u32
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-509)</span>


Wrapper for UDP sockets to the `setsockopt(2)` system call where
the kernel expects an option value of a C `uint32_t` type / Pony
type `U32`.

This function returns `0` on success, else the value of `errno` on
failure.


```pony
fun ref setsockopt_u32(
  level: I32 val,
  option_name: I32 val,
  option: U32 val)
: U32 val
```
#### Parameters

*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val
*   option: [U32](builtin-U32.md) val

#### Returns

* [U32](builtin-U32.md) val

---

### get_so_error
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-521)</span>


Wrapper for the FFI call `getsockopt(fd, SOL_SOCKET, SO_ERROR, ...)`


```pony
fun ref get_so_error()
: (U32 val , U32 val)
```

#### Returns

* ([U32](builtin-U32.md) val , [U32](builtin-U32.md) val)

---

### get_so_rcvbuf
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-527)</span>


Wrapper for the FFI call `getsockopt(fd, SOL_SOCKET, SO_RCVBUF, ...)`


```pony
fun ref get_so_rcvbuf()
: (U32 val , U32 val)
```

#### Returns

* ([U32](builtin-U32.md) val , [U32](builtin-U32.md) val)

---

### get_so_sndbuf
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-533)</span>


Wrapper for the FFI call `getsockopt(fd, SOL_SOCKET, SO_SNDBUF, ...)`


```pony
fun ref get_so_sndbuf()
: (U32 val , U32 val)
```

#### Returns

* ([U32](builtin-U32.md) val , [U32](builtin-U32.md) val)

---

### set_ip_multicast_loop
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-540)</span>


Wrapper for the FFI call `setsockopt(fd, SOL_SOCKET, IP_MULTICAST_LOOP, ...)`


```pony
fun ref set_ip_multicast_loop(
  loopback: Bool val)
: U32 val
```
#### Parameters

*   loopback: [Bool](builtin-Bool.md) val

#### Returns

* [U32](builtin-U32.md) val

---

### set_ip_multicast_ttl
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-548)</span>


Wrapper for the FFI call `setsockopt(fd, SOL_SOCKET, IP_MULTICAST_TTL, ...)`


```pony
fun ref set_ip_multicast_ttl(
  ttl: U8 val)
: U32 val
```
#### Parameters

*   ttl: [U8](builtin-U8.md) val

#### Returns

* [U32](builtin-U32.md) val

---

### set_so_broadcast
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-555)</span>


Wrapper for the FFI call `setsockopt(fd, SOL_SOCKET, SO_BROADCAST, ...)`


```pony
fun ref set_so_broadcast(
  state: Bool val)
: U32 val
```
#### Parameters

*   state: [Bool](builtin-Bool.md) val

#### Returns

* [U32](builtin-U32.md) val

---

### set_so_rcvbuf
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-563)</span>


Wrapper for the FFI call `setsockopt(fd, SOL_SOCKET, SO_RCVBUF, ...)`


```pony
fun ref set_so_rcvbuf(
  bufsize: U32 val)
: U32 val
```
#### Parameters

*   bufsize: [U32](builtin-U32.md) val

#### Returns

* [U32](builtin-U32.md) val

---

### set_so_sndbuf
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-569)</span>


Wrapper for the FFI call `setsockopt(fd, SOL_SOCKET, SO_SNDBUF, ...)`


```pony
fun ref set_so_sndbuf(
  bufsize: U32 val)
: U32 val
```
#### Parameters

*   bufsize: [U32](builtin-U32.md) val

#### Returns

* [U32](builtin-U32.md) val

---

## Private Behaviours

### _event_notify
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-255)</span>


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

### _read_again
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-283)</span>


Resume reading.


```pony
be _read_again()
```

---

## Private Functions

### _pending_reads
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-291)</span>


Read while data is available, guessing the next packet length as we go. If
we read 4 kb of data, send ourself a resume message and stop reading, to
avoid starving other actors.


```pony
fun ref _pending_reads()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### _complete_reads
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-329)</span>


The OS has informed as that len bytes of pending reads have completed.
This occurs only with IOCP on Windows.


```pony
fun ref _complete_reads(
  len: U32 val)
: None val
```
#### Parameters

*   len: [U32](builtin-U32.md) val

#### Returns

* [None](builtin-None.md) val

---

### _start_next_read
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-356)</span>


Start our next receive.
This is used only with IOCP on Windows.


```pony
fun ref _start_next_read()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### _write
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-371)</span>


Write the datagram to the socket.


```pony
fun ref _write(
  data: (String val | Array[U8 val] val),
  to: NetAddress val)
: None val
```
#### Parameters

*   data: ([String](builtin-String.md) val | [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val)
*   to: [NetAddress](net-NetAddress.md) val

#### Returns

* [None](builtin-None.md) val

---

### _notify_listening
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-383)</span>


Inform the notifier that we're listening.


```pony
fun ref _notify_listening()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### _close
<span class="source-link">[[Source]](src/net/udp_socket.md#L-0-393)</span>


Inform the notifier that we've closed.


```pony
fun ref _close()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

