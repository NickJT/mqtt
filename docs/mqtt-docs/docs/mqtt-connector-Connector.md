# Connector
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-8)</span>

Responsible for:
1. building the connection packet and sending it to the Broker via router.send
2. receiving and interpreting the returned ConnAck packet
3. telling router whether to start a new session or to restore an established
session.

If we are not accepted then we call the onBrokerRefusal behavior on the router and 
exit. The app needs to sort it out.
  
If we are accepted and requested a clean session the Broker will always give us one
so we can just call the onBrokerConnect() behaviour.

If we asked for a session restore (cleansession == 0) then we need to check whether
we got one - and if we did then call _router.onBrokerRestore().

If we asked for a restore and the Broker couldn't oblige then we can't do a
disconnect and reconnect here because as soon as we send a disconnect the Broker
will drop the network connection. Hence we must inform the app and let it go back
through the network connection process. We do this by calling onBrokerStateNotFound()
on router.

Note - Because we are still early in the connection process we will pass connector a
tag to router when it is created and let it call the router behaviours directly instead
of going through the registrar.


```pony
actor tag Connector
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-42)</span>


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
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-45)</span>


```pony
be connect(
  config: HashMap[String val, String val, HashEq[String val] val] val)
```
#### Parameters

*   config: [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

---

### onAck
<span class="source-link">[[Source]](src/mqtt-connector/connector.md#L-0-55)</span>


```pony
be onAck(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

