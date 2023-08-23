# IdIssuer
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-3)</span>

Our approach for reissuing returned ids:    
- create an array of returned numbers (empty on creation)   
- when a request is received try to pop a number out of the array  
- if the list is empty issue a new number  
- when a number is returned push it back into the list  
- check that the list doesn't contain the returned number to prevent any duplicates  


```pony
class ref IdIssuer
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-3)</span>


```pony
new iso create()
: IdIssuer iso^
```

#### Returns

* [IdIssuer](mqtt-idIssuer-IdIssuer.md) iso^

---

## Public Functions

### checkOut
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-49)</span>


Returns the next available Id. Because ids are returned and reassigned subsequent
 calls to checkOutSub may not return consecutive values


```pony
fun ref checkOut()
: U16 val
```

#### Returns

* [U16](builtin-U16.md) val

---

### checkIn
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-57)</span>


Called when the transaction the id was used for has been completed and the 
id can be re-used


```pony
fun ref checkIn(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

## Private Functions

### _nextId
<span class="source-link">[[Source]](src/mqtt-idIssuer/idIssuer.md#L-0-28)</span>


Returns the next available id from the array of returned Ids and if there are  
no returned Ids in the list issues a new one


```pony
fun ref _nextId()
: U16 val
```

#### Returns

* [U16](builtin-U16.md) val

---

