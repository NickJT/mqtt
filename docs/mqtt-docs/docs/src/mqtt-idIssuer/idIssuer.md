---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "debug"
use "../primitives"

/********************************************************************************/
interface IdNotifySub
  """
  Notifications for issuance of a packet Id.
  """
  be apply(id: U16, sub : Bool)


/********************************************************************************/
interface IdNotifyPub
  """
  Notifications for issuance of a packet Id.
  """
  be apply(args: PublishArgs val )


actor IdIssuer
"""
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
"""

  var _id : U16 = 0
  """
  The little endian non-zero U16 counter. We pre-increment before use to keep
   zero as an error marker
  """

  let _ids : Array[U16] = Array[U16]
  """
  An array of ids that have been issued and returned and are available
  for re-issue
  """

/********************************************************************************/
  fun ref _nextId() : U16 =>
  """
  Returns the next available id from the array of returned Ids and if there are  
  no returned Ids in the list issues a new one
  """
    try // to re-issue an id that has been returned

      var id = _ids.pop()?
      //Debug("Re-issuing id " + id.string())
      return id
    else  // there is nothing in the bucket, so issue a new id
      _id = _id + 1
      //Debug("Issuing id " + _id.string())
      return _id
    end
  

/********************************************************************************/
  be checkOutSub(notifySub :IdNotifySub tag) =>
  """
  A request for an id to be returned in the provided callback. Because ids are returned  
  and reassigned subsequent calls to checkOutSub may not return consecutive values
  """
  notifySub(_nextId(), true)

/********************************************************************************/
  be checkOutUnsub(notifySub :IdNotifySub tag) =>
  """
  A request for an id to be returned in the provided callback. Because ids are returned  
  and reassigned subsequent calls to checkOutSub may not return consecutive values
  """
  notifySub(_nextId(), false)

/********************************************************************************/
  be checkOutPub(notifyArgs : IdNotifyPub tag, args : PublishArgs val) =>
  """
  A request for an id to be returned with arguments in the provided callback. Because ids are returned  
  and reassigned subsequent calls to checkOutSub may not return consecutive values
  """
  notifyArgs(PublishArgs.createWithId(args,_nextId())) 

/********************************************************************************/
 be checkIn(id : U16) =>
  """
  Called when the transaction the id was used for has been completed and the 
  id can be re-used
  """
    if (not _ids.contains(id, {(x,y) => x == y})) then  // put this in the returns bucket
      //Debug("Checking in id " + id.string() + " at " + __loc.file() + ":" +__loc.method_name() )
      _ids.push(id)
    else  // this id was already in the returns bucket - which shouldn't have happened
      Debug("Error - checking in id " + id.string() + " which hasn't been checked out")
    end

```````