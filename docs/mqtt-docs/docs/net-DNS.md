# DNS
<span class="source-link">[[Source]](src/net/dns.md#L-0-9)</span>

Helper functions for resolving DNS queries.


```pony
primitive val DNS
```

## Constructors

### create
<span class="source-link">[[Source]](src/net/dns.md#L-0-9)</span>


```pony
new val create()
: DNS val^
```

#### Returns

* [DNS](net-DNS.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/net/dns.md#L-0-13)</span>


Gets all IPv4 and IPv6 addresses for a host and service.


```pony
fun box apply(
  auth: DNSAuth val,
  host: String val,
  service: String val)
: Array[NetAddress val] iso^
```
#### Parameters

*   auth: [DNSAuth](net-DNSAuth.md) val
*   host: [String](builtin-String.md) val
*   service: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[NetAddress](net-NetAddress.md) val\] iso^

---

### ip4
<span class="source-link">[[Source]](src/net/dns.md#L-0-21)</span>


Gets all IPv4 addresses for a host and service.


```pony
fun box ip4(
  auth: DNSAuth val,
  host: String val,
  service: String val)
: Array[NetAddress val] iso^
```
#### Parameters

*   auth: [DNSAuth](net-DNSAuth.md) val
*   host: [String](builtin-String.md) val
*   service: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[NetAddress](net-NetAddress.md) val\] iso^

---

### ip6
<span class="source-link">[[Source]](src/net/dns.md#L-0-29)</span>


Gets all IPv6 addresses for a host and service.


```pony
fun box ip6(
  auth: DNSAuth val,
  host: String val,
  service: String val)
: Array[NetAddress val] iso^
```
#### Parameters

*   auth: [DNSAuth](net-DNSAuth.md) val
*   host: [String](builtin-String.md) val
*   service: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[NetAddress](net-NetAddress.md) val\] iso^

---

### broadcast_ip4
<span class="source-link">[[Source]](src/net/dns.md#L-0-37)</span>


Link-local IP4 broadcast address.


```pony
fun box broadcast_ip4(
  auth: DNSAuth val,
  service: String val)
: Array[NetAddress val] iso^
```
#### Parameters

*   auth: [DNSAuth](net-DNSAuth.md) val
*   service: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[NetAddress](net-NetAddress.md) val\] iso^

---

### broadcast_ip6
<span class="source-link">[[Source]](src/net/dns.md#L-0-45)</span>


Link-local IP6 broadcast address.


```pony
fun box broadcast_ip6(
  auth: DNSAuth val,
  service: String val)
: Array[NetAddress val] iso^
```
#### Parameters

*   auth: [DNSAuth](net-DNSAuth.md) val
*   service: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[NetAddress](net-NetAddress.md) val\] iso^

---

### is_ip4
<span class="source-link">[[Source]](src/net/dns.md#L-0-53)</span>


Returns true if the host is a literal IPv4 address.


```pony
fun box is_ip4(
  host: String val)
: Bool val
```
#### Parameters

*   host: [String](builtin-String.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### is_ip6
<span class="source-link">[[Source]](src/net/dns.md#L-0-59)</span>


Returns true if the host is a literal IPv6 address.


```pony
fun box is_ip6(
  host: String val)
: Bool val
```
#### Parameters

*   host: [String](builtin-String.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### eq
<span class="source-link">[[Source]](src/net/dns.md#L-0-13)</span>


```pony
fun box eq(
  that: DNS val)
: Bool val
```
#### Parameters

*   that: [DNS](net-DNS.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/net/dns.md#L-0-13)</span>


```pony
fun box ne(
  that: DNS val)
: Bool val
```
#### Parameters

*   that: [DNS](net-DNS.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

## Private Functions

### _resolve
<span class="source-link">[[Source]](src/net/dns.md#L-0-65)</span>


Turns an addrinfo pointer into an array of addresses.


```pony
fun box _resolve(
  auth: DNSAuth val,
  family: U32 val,
  host: String val,
  service: String val)
: Array[NetAddress val] iso^
```
#### Parameters

*   auth: [DNSAuth](net-DNSAuth.md) val
*   family: [U32](builtin-U32.md) val
*   host: [String](builtin-String.md) val
*   service: [String](builtin-String.md) val

#### Returns

* [Array](builtin-Array.md)\[[NetAddress](net-NetAddress.md) val\] iso^

---

