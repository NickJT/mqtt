# MqActor
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-67)</span>

This type def allows us to combine publishers and subscribers into one map of open
transactions. The map is indexed by client allocated id (cid) and cids are unique 
while checked-out so we know that we can't have clashing cids even if an actor 
has multiple transactions underway. A transaction finishing is denoted by the 
removal of the actor from the map and **then** the check-in of the cid. 
TODO - consider whether we need to add some safeguards for this (e.g. a single
router private function that atomically removes first and then checks-in)


```pony
trait ref MqActor
```

## Public Behaviours

### onData
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-77)</span>


```pony
be onData(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

### onTick
<span class="source-link">[[Source]](src/mqtt-primitives/typeDefs.md#L-0-78)</span>


```pony
be onTick(
  sec: I64 val)
```
#### Parameters

*   sec: [I64](builtin-I64.md) val

---

