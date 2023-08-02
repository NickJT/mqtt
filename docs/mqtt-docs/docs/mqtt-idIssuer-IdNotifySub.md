# IdNotifySub
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-5)</span>

Notifications for issuance of a packet Id.


```pony
interface ref IdNotifySub
```

## Public Behaviours

### apply
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-9)</span>


```pony
be apply(
  id: U16 val,
  sub: (Sub val | UnSub val))
```
#### Parameters

*   id: [U16](builtin-U16.md) val
*   sub: ([Sub](mqtt-primitives-Sub.md) val | [UnSub](mqtt-primitives-UnSub.md) val)

---

