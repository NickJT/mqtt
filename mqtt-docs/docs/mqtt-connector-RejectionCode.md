# RejectionCode
<span class="source-link">[[Source]](src/mqtt-connector/ConnAckCodes.md#L-0-24)</span>
```pony
primitive val RejectionCode
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-connector/ConnAckCodes.md#L-0-24)</span>


```pony
new val create()
: RejectionCode val^
```

#### Returns

* [RejectionCode](mqtt-connector-RejectionCode.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-connector/ConnAckCodes.md#L-0-24)</span>


Decodes the Connection rejection code from the Broker and add some text to the returned string


```pony
fun box apply(
  flags: U8 val)
: String val
```
#### Parameters

*   flags: [U8](builtin-U8.md) val

#### Returns

* [String](builtin-String.md) val

---

### eq
<span class="source-link">[[Source]](src/mqtt-connector/ConnAckCodes.md#L-0-24)</span>


```pony
fun box eq(
  that: RejectionCode val)
: Bool val
```
#### Parameters

*   that: [RejectionCode](mqtt-connector-RejectionCode.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-connector/ConnAckCodes.md#L-0-24)</span>


```pony
fun box ne(
  that: RejectionCode val)
: Bool val
```
#### Parameters

*   that: [RejectionCode](mqtt-connector-RejectionCode.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

