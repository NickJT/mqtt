# IdIssuer
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-20)</span>

SUBSCRIBE, UNSUBSCRIBE, and PUBLISH (in cases where QoS > 0) Control Packets contain a  
non-zero 16-bit Packet Identifier in big endian format  
If a Client re-sends a particular Control Packet, then it MUST use the same Packet Identifier  
in subsequent re-sends of that packet.  
The Packet Identifier becomes available for reuse after the Client has processed the corresponding  
acknowledgement packet.  
In the case of a QoS 1 PUBLISH this is the corresponding PUBACK  
In the case of QoS 2 it is PUBCOMP.  
For SUBSCRIBE or UNSUBSCRIBE it is the corresponding SUBACK or UNSUBACK.  

Reissuing Returned Ids  
- create an array of returned numbers (empty on creation)  
- when a request is received try to pop a number out of the array  
- if the list is empty issue a new number  
- when a number is returned push it back into the list  
- check that the list doesn't contain the returned number to prevent any duplicates  
- no error checking on 16 bit overflow other than logging  


```pony
actor tag IdIssuer
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-20)</span>


```pony
new tag create()
: IdIssuer tag^
```

#### Returns

* [IdIssuer](mqtt-idIssuer-IdIssuer.md) tag^

---

## Public Behaviours

### checkOutSub
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-72)</span>


A request for an id to be returned in the provided callback. Because ids are returned  
and reassigned subsequent calls to checkOutSub may not return consecutive values


```pony
be checkOutSub(
  notifySub: IdNotifySub tag)
```
#### Parameters

*   notifySub: [IdNotifySub](mqtt-idIssuer-IdNotifySub.md) tag

---

### checkOutUnsub
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-80)</span>


A request for an id to be returned in the provided callback. Because ids are returned  
and reassigned subsequent calls to checkOutSub may not return consecutive values


```pony
be checkOutUnsub(
  notifySub: IdNotifySub tag)
```
#### Parameters

*   notifySub: [IdNotifySub](mqtt-idIssuer-IdNotifySub.md) tag

---

### checkOutPub
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-88)</span>


A request for an id to be returned with arguments in the provided callback. Because ids are returned  
and reassigned subsequent calls to checkOutSub may not return consecutive values


```pony
be checkOutPub(
  notifyArgs: IdNotifyPub tag,
  args: PublishArgs val)
```
#### Parameters

*   notifyArgs: [IdNotifyPub](mqtt-idIssuer-IdNotifyPub.md) tag
*   args: [PublishArgs](mqtt-primitives-PublishArgs.md) val

---

### checkIn
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-96)</span>


Called when the transaction the id was used for has been completed and the 
id can be re-used


```pony
be checkIn(
  id: U16 val)
```
#### Parameters

*   id: [U16](builtin-U16.md) val

---

## Private Functions

### _nextId
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-54)</span>


Returns the next available id from the array of returned Ids and if there are  
no returned Ids in the list issues a new one


```pony
fun ref _nextId()
: U16 val
```

#### Returns

* [U16](builtin-U16.md) val

---

