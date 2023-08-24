---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
"""
IdIssuer is responsible for managing the issuing and reissuing of message ids. Ids must be unique for 
in-flight messages so we need a check-in/check-out system so we don't overflow the U16.

> SUBSCRIBE, UNSUBSCRIBE, and PUBLISH (in cases where QoS > 0) Control Packets contain a non-zero
16-bit Packet Identifier in big endian format. If a Client re-sends a particular Control Packet,
then it MUST use the same Packet Identifier in subsequent re-sends of that packet.The Packet
Identifier becomes available for reuse after the Client has processed the corresponding  
acknowledgement packet. In the case of a QoS 1 PUBLISH this is the corresponding PUBACK  
In the case of QoS 2 it is PUBCOMP. For SUBSCRIBE or UNSUBSCRIBE it is the corresponding
SUBACK or UNSUBACK.  

"""

use "debug"
class IdIssuer
"""
Our approach for reissuing returned ids:    
- create an array of returned numbers (empty on creation)   
- when a request is received try to pop a number out of the array  
- if the list is empty issue a new number  
- when a number is returned push it back into the list  
- check that the list doesn't contain the returned number to prevent any duplicates  
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
  var _checkedOut : U64 = 0
  var _checkedIn : U64 = 0

/********************************************************************************/
  fun ref _nextId() : U16 =>
  """
  Returns the next available id from the array of returned Ids and if there are  
  no returned Ids in the list issues a new one
  """
    _checkedOut = _checkedOut + 1

    try // to re-issue an id that has been returned

      var id = _ids.pop()?
      //Debug.err("Re-issuing id " + id.string())
      return id
    else  // there is nothing in the bucket, so issue a new id
      _id = _id + 1
      //Debug.err("Issuing id " + _id.string())
      if _id == 0 then 
      Debug.err("Run out of ids -> Out = " + _checkedOut.string() + " In = " + _checkedIn.string())
      end
      return _id
    end
  
  fun ref checkOut() : U16 =>
    """
    Returns the next available Id. Because ids are returned and reassigned subsequent
     calls to checkOutSub may not return consecutive values
    """
    _nextId()

/********************************************************************************/
 fun ref checkIn(id : U16) =>
  """
  Called when the transaction the id was used for has been completed and the 
  id can be re-used
  """
    if (not _ids.contains(id, {(x,y) => x == y})) then  // put this in the returns bucket
      //Debug.err("Checking in id " + id.string() + " at " + __loc.file() + ":" +__loc.method_name() )
      _ids.push(id)
      _checkedIn = _checkedIn + 1
    else  // this id was already in the returns bucket - which shouldn't have happened
      Debug.err("Error - checking in id " + id.string() + " which hasn't been checked out")
    end

```````