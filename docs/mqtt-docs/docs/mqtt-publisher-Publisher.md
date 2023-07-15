# Publisher
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-10)</span>

Represents an application level publication topic. Provides a public Publish topic
that:
1. passes its arguments to IdIssuer to get the next unique id
2. provides a IdNotifyArgs behaviour that sends the completed publish packet to router

Publisher is responsible for managing its in-flight window. For 3.1.1 we will keep this
to one packet for now but with a view to parameterizing this for MQTT 5 compliance.

To manage the in-flight window we only allow n messages to be pending ack and queue any
that arrive before the ack arrives. For 3.1.1 compliance we only need to do this for QoS 1.

This first version queues the packets after then have been allocated an id. Not sure of
the trade-offs of doing this before or after yet... 

TODO - The classes for the Pub ack types are virtually identical and could all be 
replaced by a factory class once we have all the functions coded



```pony
actor tag Publisher is
  IdNotifyArgs ref
```

#### Implements

* [IdNotifyArgs](mqtt-idIssuer-IdNotifyArgs.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-45)</span>


```pony
new tag create(
  reg: Registrar tag,
  topic': String val)
: Publisher tag^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   topic': [String](builtin-String.md) val

#### Returns

* [Publisher](mqtt-publisher-Publisher.md) tag^

---

## Public Behaviours

### publish
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-52)</span>


Public API call to publish a payload


```pony
be publish(
  args: PublishArgs val)
```
#### Parameters

*   args: [PublishArgs](mqtt-primitives-PublishArgs.md) val

---

### apply
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-61)</span>


Called by IdIssuer once an id has been allocated. The id is the last of the 
arguments needed before building the publish packet so we have a complete
set of arguments to save to the queue


```pony
be apply(
  args: PublishArgs val)
```
#### Parameters

*   args: [PublishArgs](mqtt-primitives-PublishArgs.md) val

---

### onData
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-96)</span>


Called by router via the findPublisherById map when it receives one of the three
publish acknowledge packets (PubAck for QoS1, PubRec or PubComp for Qos2)


```pony
be onData(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

### onTick
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-260)</span>


This is the target for the TickListener trait that is called by the system tick
tick timer. Each time we get this we scan the in-flight queue for expired messages


```pony
be onTick(
  sec: I64 val)
```
#### Parameters

*   sec: [I64](builtin-I64.md) val

---

## Public Functions

### onPubAck
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-112)</span>


The single ack packet for QoS 1 messages. Once we get this we can discard the 
publish message and check-in the id


```pony
fun ref onPubAck(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### onPubRec
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-134)</span>


The first of the two acknowledgements for a QoS 2 transaction. Once we get a
PubRec we can discard the publish message then send (and store) a PubRel


```pony
fun ref onPubRec(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### onPubComp
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-150)</span>


The second of the two acknowledgement messages of the QoS 2 transaction. Once we
get a PubComp we can delete the saved PubRel message and check-in the id


```pony
fun ref onPubComp(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### doPubRel
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-167)</span>


Send a PubRelPacket with the passed id to the router. Includes a id = 0 guard but
this can probably be optimised out later


```pony
fun ref doPubRel(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### savePacket
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-181)</span>


Before sending a publish packet we save the already encoded packet data in case
we don't get a pubAck message and have to resend it.
TODO - Add functionality to retransmit on reconnect if not cleansession


```pony
fun ref savePacket(
  id: U16 val,
  data: Array[U8 val] val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val
*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

#### Returns

* [None](builtin-None.md) val

---

### deletePacket
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-195)</span>


Called after getting a pubAck or PubRec message when we know that we won't have
to resend it the data.


```pony
fun ref deletePacket(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### savePubRel
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-212)</span>


Before sending the pubRel packet we save the already encoded packet data in case
we don't get a pubComp message and have to resend it.


```pony
fun ref savePubRel(
  id: U16 val,
  data: Array[U8 val] val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val
*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

#### Returns

* [None](builtin-None.md) val

---

### deletePubRel
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-225)</span>


Called after getting a pubComp message when we know that we won't have to resend
the pubRel and we can delete it.


```pony
fun ref deletePubRel(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### publishComplete
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-242)</span>


Called when we have received our last publish acknowledgement. We can now
remove the pubRel message from the map and tell the router to do it's necessary
cleanup before it releases the id. 
This function should be preceded by deletion of the publish packet in the case
of QoS 1 publication and by deletion of the PubRel packet in the case of QoS 2.


```pony
fun box publishComplete(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### topic
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-256)</span>


```pony
fun box topic()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

