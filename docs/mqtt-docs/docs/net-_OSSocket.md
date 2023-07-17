# _OSSocket
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-7)</span>

Socket type-independent wrapper functions for `getsockopt(2)` and
`setsockopt(2)` system calls for internal `net` package use.


```pony
primitive val _OSSocket
```

## Constructors

### create
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-7)</span>


```pony
new val create()
: _OSSocket val^
```

#### Returns

* [_OSSocket](net-_OSSocket.md) val^

---

## Public Functions

### get_so_error
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-13)</span>


Wrapper for the FFI call `getsockopt(fd, SOL_SOCKET, SO_ERROR, ...)`


```pony
fun box get_so_error(
  fd: U32 val)
: (U32 val , U32 val)
```
#### Parameters

*   fd: [U32](builtin-U32.md) val

#### Returns

* ([U32](builtin-U32.md) val , [U32](builtin-U32.md) val)

---

### get_so_rcvbuf
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-19)</span>


Wrapper for the FFI call `getsockopt(fd, SOL_SOCKET, SO_RCVBUF, ...)`


```pony
fun box get_so_rcvbuf(
  fd: U32 val)
: (U32 val , U32 val)
```
#### Parameters

*   fd: [U32](builtin-U32.md) val

#### Returns

* ([U32](builtin-U32.md) val , [U32](builtin-U32.md) val)

---

### get_so_sndbuf
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-25)</span>


Wrapper for the FFI call `getsockopt(fd, SOL_SOCKET, SO_SNDBUF, ...)`


```pony
fun box get_so_sndbuf(
  fd: U32 val)
: (U32 val , U32 val)
```
#### Parameters

*   fd: [U32](builtin-U32.md) val

#### Returns

* ([U32](builtin-U32.md) val , [U32](builtin-U32.md) val)

---

### get_so_connect_time
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-31)</span>


Wrapper for the FFI call `getsockopt(fd, SOL_SOCKET, SO_CONNECT_TIME, ...)`


```pony
fun box get_so_connect_time(
  fd: U32 val)
: (U32 val , U32 val)
```
#### Parameters

*   fd: [U32](builtin-U32.md) val

#### Returns

* ([U32](builtin-U32.md) val , [U32](builtin-U32.md) val)

---

### set_so_rcvbuf
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-37)</span>


Wrapper for the FFI call `setsockopt(fd, SOL_SOCKET, SO_RCVBUF, ...)`


```pony
fun box set_so_rcvbuf(
  fd: U32 val,
  bufsize: U32 val)
: U32 val
```
#### Parameters

*   fd: [U32](builtin-U32.md) val
*   bufsize: [U32](builtin-U32.md) val

#### Returns

* [U32](builtin-U32.md) val

---

### set_so_sndbuf
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-43)</span>


Wrapper for the FFI call `setsockopt(fd, SOL_SOCKET, SO_SNDBUF, ...)`


```pony
fun box set_so_sndbuf(
  fd: U32 val,
  bufsize: U32 val)
: U32 val
```
#### Parameters

*   fd: [U32](builtin-U32.md) val
*   bufsize: [U32](builtin-U32.md) val

#### Returns

* [U32](builtin-U32.md) val

---

### getsockopt
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-49)</span>


General wrapper for sockets to the `getsockopt(2)` system call.

The `option_max_size` argument is the maximum number of bytes that
the caller expects the kernel to return via the system call's
`void *` 4th argument.  This function will allocate a Pony
`Array[U8]` array of size `option_max_size` prior to calling
`getsockopt(2)`.

In case of system call success, this function returns the 2-tuple:
1. The integer `0`.
2. An `Array[U8]` of data returned by the system call's `void *`
   4th argument.  Its size is specified by the kernel via the
   system call's `sockopt_len_t *` 5th argument.

In case of system call failure, this function returns the 2-tuple:
1. The value of `errno`.
2. An undefined value that must be ignored.


```pony
fun box getsockopt(
  fd: U32 val,
  level: I32 val,
  option_name: I32 val,
  option_max_size: USize val = 4)
: (U32 val , Array[U8 val] iso^)
```
#### Parameters

*   fd: [U32](builtin-U32.md) val
*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val
*   option_max_size: [USize](builtin-USize.md) val = 4

#### Returns

* ([U32](builtin-U32.md) val , [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] iso^)

---

### getsockopt_u32
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-71)</span>


Wrapper for sockets to the `getsockopt(2)` system call where
the kernel's returned option value is a C `uint32_t` type / Pony
type `U32`.

In case of system call success, this function returns the 2-tuple:
1. The integer `0`.
2. The `*option_value` returned by the kernel converted to a Pony `U32`.

In case of system call failure, this function returns the 2-tuple:
1. The value of `errno`.
2. An undefined value that must be ignored.


```pony
fun box getsockopt_u32(
  fd: U32 val,
  level: I32 val,
  option_name: I32 val)
: (U32 val , U32 val)
```
#### Parameters

*   fd: [U32](builtin-U32.md) val
*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val

#### Returns

* ([U32](builtin-U32.md) val , [U32](builtin-U32.md) val)

---

### setsockopt
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-98)</span>


General wrapper for sockets to the `setsockopt(2)` system call.

The caller is responsible for the correct size and byte contents of
the `option` array for the requested `level` and `option_name`,
including using the appropriate CPU endian byte order.

This function returns `0` on success, else the value of `errno` on
failure.


```pony
fun box setsockopt(
  fd: U32 val,
  level: I32 val,
  option_name: I32 val,
  option: Array[U8 val] ref)
: U32 val
```
#### Parameters

*   fd: [U32](builtin-U32.md) val
*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val
*   option: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] ref

#### Returns

* [U32](builtin-U32.md) val

---

### setsockopt_u32
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-111)</span>


Wrapper for sockets to the `setsockopt(2)` system call where
the kernel expects an option value of a C `uint32_t` type / Pony
type `U32`.

This function returns `0` on success, else the value of `errno` on
failure.


```pony
fun box setsockopt_u32(
  fd: U32 val,
  level: I32 val,
  option_name: I32 val,
  option: U32 val)
: U32 val
```
#### Parameters

*   fd: [U32](builtin-U32.md) val
*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val
*   option: [U32](builtin-U32.md) val

#### Returns

* [U32](builtin-U32.md) val

---

### get_so
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-123)</span>


Low-level interface to `getsockopt(2)`.

In case of system call success, this function returns the 2-tuple:
1. The integer `0`.
2. An `Array[U8]` of data returned by the system call's `void *`
   4th argument.  Its size is specified by the kernel via the
   system call's `sockopt_len_t *` 5th argument.

In case of system call failure, `errno` is returned in the first
element of the 2-tuple, and the second element's value is junk.


```pony
fun box get_so(
  fd: U32 val,
  level: I32 val,
  option_name: I32 val,
  option_max_size: USize val)
: (U32 val , Array[U8 val] iso^)
```
#### Parameters

*   fd: [U32](builtin-U32.md) val
*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val
*   option_max_size: [USize](builtin-USize.md) val

#### Returns

* ([U32](builtin-U32.md) val , [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] iso^)

---

### set_so
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-149)</span>


```pony
fun box set_so(
  fd: U32 val,
  level: I32 val,
  option_name: I32 val,
  option: Array[U8 val] ref)
: U32 val
```
#### Parameters

*   fd: [U32](builtin-U32.md) val
*   level: [I32](builtin-I32.md) val
*   option_name: [I32](builtin-I32.md) val
*   option: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] ref

#### Returns

* [U32](builtin-U32.md) val

---

### bytes4_to_u32
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-166)</span>


```pony
fun box bytes4_to_u32(
  b: Array[U8 val] ref)
: U32 val ?
```
#### Parameters

*   b: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] ref

#### Returns

* [U32](builtin-U32.md) val ?

---

### u32_to_bytes4
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-169)</span>


```pony
fun box u32_to_bytes4(
  option: U32 val)
: Array[U8 val] ref
```
#### Parameters

*   option: [U32](builtin-U32.md) val

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] ref

---

### eq
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-13)</span>


```pony
fun box eq(
  that: _OSSocket val)
: Bool val
```
#### Parameters

*   that: [_OSSocket](net-_OSSocket.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/net/ossocket.md#L-0-13)</span>


```pony
fun box ne(
  that: _OSSocket val)
: Bool val
```
#### Parameters

*   that: [_OSSocket](net-_OSSocket.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

