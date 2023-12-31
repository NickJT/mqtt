# DecodeErr
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-72)</span>
```pony
primitive val DecodeErr
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-72)</span>


```pony
new val create()
: DecodeErr val^
```

#### Returns

* [DecodeErr](mqtt-primitives-DecodeErr.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-72)</span>


Compiles an information string from an error code


```pony
fun box apply(
  err: (NoError val | ForbiddenType val | ForbiddenFlags val | 
    ForbiddenCode val | ForbiddenWillQos val | ForbiddenQos val | 
    InvalidType val | InvalidControl val | InvalidFlags val | 
    InvalidRemainingLength val | MalformedRequest val | MalformedResponse val | 
    CleanSessionRequired val | SubscribeFailed val | NotConnected val | 
    SocketError val | ConnectionClosed val | ReconnectFailed val | 
    ConnectionRefused val | UnknownError val),
  text: String val = "")
: None val
```
#### Parameters

*   err: ([NoError](mqtt-primitives-NoError.md) val | [ForbiddenType](mqtt-primitives-ForbiddenType.md) val | [ForbiddenFlags](mqtt-primitives-ForbiddenFlags.md) val | 
    [ForbiddenCode](mqtt-primitives-ForbiddenCode.md) val | [ForbiddenWillQos](mqtt-primitives-ForbiddenWillQos.md) val | [ForbiddenQos](mqtt-primitives-ForbiddenQos.md) val | 
    [InvalidType](mqtt-primitives-InvalidType.md) val | [InvalidControl](mqtt-primitives-InvalidControl.md) val | [InvalidFlags](mqtt-primitives-InvalidFlags.md) val | 
    [InvalidRemainingLength](mqtt-primitives-InvalidRemainingLength.md) val | [MalformedRequest](mqtt-primitives-MalformedRequest.md) val | [MalformedResponse](mqtt-primitives-MalformedResponse.md) val | 
    [CleanSessionRequired](mqtt-primitives-CleanSessionRequired.md) val | [SubscribeFailed](mqtt-primitives-SubscribeFailed.md) val | [NotConnected](mqtt-primitives-NotConnected.md) val | 
    [SocketError](mqtt-primitives-SocketError.md) val | [ConnectionClosed](mqtt-primitives-ConnectionClosed.md) val | [ReconnectFailed](mqtt-primitives-ReconnectFailed.md) val | 
    [ConnectionRefused](mqtt-primitives-ConnectionRefused.md) val | [UnknownError](mqtt-primitives-UnknownError.md) val)
*   text: [String](builtin-String.md) val = ""

#### Returns

* [None](builtin-None.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-72)</span>


```pony
fun box eq(
  that: DecodeErr val)
: Bool val
```
#### Parameters

*   that: [DecodeErr](mqtt-primitives-DecodeErr.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-primitives/errorCodes.md#L-0-72)</span>


```pony
fun box ne(
  that: DecodeErr val)
: Bool val
```
#### Parameters

*   that: [DecodeErr](mqtt-primitives-DecodeErr.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

