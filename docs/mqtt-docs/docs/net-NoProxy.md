# NoProxy
<span class="source-link">[[Source]](src/net/proxy.md#L-0-5)</span>

Default implementation of a proxy that does not alter the supplied `TCPConnectionNotify`.

```pony
actor MyClient
  new create(host: String, service: String, proxy: Proxy = NoProxy) =>
    let conn: TCPConnection = TCPConnection.create(
      TCPConnectAuth(env.root),
      proxy.apply(MyConnectionNotify.create()),
      "localhost",
      "80")
```


```pony
class val NoProxy is
  Proxy ref
```

#### Implements

* [Proxy](net-Proxy.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/net/proxy.md#L-0-5)</span>


```pony
new iso create()
: NoProxy iso^
```

#### Returns

* [NoProxy](net-NoProxy.md) iso^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/net/proxy.md#L-0-19)</span>


```pony
fun box apply(
  wrap: TCPConnectionNotify iso)
: TCPConnectionNotify iso^
```
#### Parameters

*   wrap: [TCPConnectionNotify](net-TCPConnectionNotify.md) iso

#### Returns

* [TCPConnectionNotify](net-TCPConnectionNotify.md) iso^

---

