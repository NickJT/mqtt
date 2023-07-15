# IdCallback
<span class="source-link">[[Source]](src/mqtt-idIssuer/idCallback.md#L-0-5)</span>

A callback class used by actors that need a unique id 


```pony
actor tag IdCallback is
  IdNotify ref
```

#### Implements

* [IdNotify](mqtt-idIssuer-IdNotify.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-idIssuer/idCallback.md#L-0-13)</span>


```pony
new tag create(
  reg: Registrar tag,
  topic: String val,
  qos: String val)
: IdCallback tag^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   topic: [String](builtin-String.md) val
*   qos: [String](builtin-String.md) val

#### Returns

* [IdCallback](mqtt-idIssuer-IdCallback.md) tag^

---

## Public Behaviours

### apply
<span class="source-link">[[Source]](src/mqtt-idIssuer/idCallback.md#L-0-19)</span>


```pony
be apply(
  id: U16 val)
```
#### Parameters

*   id: [U16](builtin-U16.md) val

---

