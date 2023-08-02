# OsNetwork
<span class="source-link">[[Source]](src/mqtt-network/osNetwork.md#L-0-10)</span>
```pony
actor tag OsNetwork
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-network/osNetwork.md#L-0-18)</span>


```pony
new tag create(
  env: Env val,
  router: Router tag,
  config: HashMap[String val, String val, HashEq[String val] val] val)
: OsNetwork tag^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   router: [Router](mqtt-Router.md) tag
*   config: [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

#### Returns

* [OsNetwork](mqtt-network-OsNetwork.md) tag^

---

## Public Behaviours

### connect
<span class="source-link">[[Source]](src/mqtt-network/osNetwork.md#L-0-32)</span>


```pony
be connect()
```

---

### disconnect
<span class="source-link">[[Source]](src/mqtt-network/osNetwork.md#L-0-37)</span>


```pony
be disconnect()
```

---

## Public Functions

### toIPv4
<span class="source-link">[[Source]](src/mqtt-network/osNetwork.md#L-0-45)</span>


Convert a string to an ip4 address or None if it is not valid


```pony
fun box toIPv4(
  env: Env val,
  arg: String val)
: (String val | None val)
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   arg: [String](builtin-String.md) val

#### Returns

* ([String](builtin-String.md) val | [None](builtin-None.md) val)

---

