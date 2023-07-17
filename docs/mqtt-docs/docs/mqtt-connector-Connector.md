# Connector
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-8)</span>

Responsible for:
1. building the connection packet and sending it to the Broker via router.send
2. receiving and interpreting the returned ConnAck packet
3. telling router whether to start a new session or to restore an established
session.

Doesn't do much else at present but could be a repository for remedial actions if
the broker doesn't connect (depending on the return code)

It may be more consistent to pass connector the registrar and let it retrieve router from there.
However, as we are still early in the connection process and there is no need for async processes
at this stage we will pass connector a tag to router and let it call the router behaviours 
directly.


```pony
actor tag Connector
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-26)</span>


```pony
new tag create(
  router: Router tag)
: Connector tag^
```
#### Parameters

*   router: [Router](mqtt-Router.md) tag

#### Returns

* [Connector](mqtt-connector-Connector.md) tag^

---

## Public Behaviours

### connect
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-29)</span>


```pony
be connect(
  config: HashMap[String val, String val, HashEq[String val] val] val)
```
#### Parameters

*   config: [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

---

### onAck
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-40)</span>


```pony
be onAck(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

