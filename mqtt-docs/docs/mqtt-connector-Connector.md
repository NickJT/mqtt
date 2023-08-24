# Connector
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-36)</span>

Responsible for:
1. building the connection packet and sending it to the Broker via router.send
2. receiving and interpreting the returned ConnAck packet
3. telling router whether to start a new session or to restore an established
session.


```pony
actor tag Connector
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-51)</span>


```pony
new tag create(
  router: Router tag)
: Connector tag^
```
#### Parameters

*   router: [Router](mqtt-router-Router.md) tag

#### Returns

* [Connector](mqtt-connector-Connector.md) tag^

---

## Public Behaviours

### connect
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-54)</span>


```pony
be connect(
  config: HashMap[String val, String val, HashEq[String val] val] val)
```
#### Parameters

*   config: [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

---

### onAck
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-64)</span>


```pony
be onAck(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

