# Subscriber
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-10)</span>

Represents an application level subscription to one topic. 
Note - We're not implementing the multi-subscribe capability in the specification
because the saving in a few sub/unsub messages is outweighed by losing the one topic:
one subscriber model. The Broker cannot conflate multiple acks into one SubAck unless
the client subscribes to multiple topics in one subscribe message.


```pony
actor tag Subscriber is
  IdNotify ref,
  TickListener ref
```

#### Implements

* [IdNotify](mqtt-idIssuer-IdNotify.md) ref
* [TickListener](mqtt-primitives-TickListener.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-24)</span>


```pony
new tag create(
  reg: Registrar tag,
  topic: String val,
  qos: String val)
: Subscriber tag^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   topic: [String](builtin-String.md) val
*   qos: [String](builtin-String.md) val

#### Returns

* [Subscriber](mqtt-subscriber-Subscriber.md) tag^

---

## Public Behaviours

### apply
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-34)</span>


The packet id is the last piece of the jigsaw. Once we have this we can build our subscribe packet and
send it to the broker


```pony
be apply(
  id: U16 val)
```
#### Parameters

*   id: [U16](builtin-U16.md) val

---

### onTick
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-48)</span>


This is the target for the TickListener trait that is called by the system tick
tick timer. Each time we get this we scan the in-flight queue for expired messages


```pony
be onTick(
  sec: I64 val)
```
#### Parameters

*   sec: [I64](builtin-I64.md) val

---

### onDisconnect
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-57)</span>


All Subscribers get informed of a broker disconnect will a call to the onDisconnect behaviour.
This enables the Subscriber to take whatever application level action is to respond 
to this externally (to the actor) generated break in data. 
Note there is no Broker connection at this point so no point in unsubscribing


```pony
be onDisconnect()
```

---

### unSubscribe
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-67)</span>


```pony
be unSubscribe()
```

---

### onData
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-73)</span>


The Router sends data packets from the Broker, to actors who have requested it, using the
onData behaviour. Note that not all Publish messages have an id so we default this to 0.
As a Subscriber we only get:
1. A SubAck to confirm our subscription
2. A Publish packet containing a payload
3. A PubRel message forming part three of the QoS 2 handshake
4. A UnSubAck to confirm out unsubscription

In response to a SubAck:
1. We notify the app (via Main) of the result
2. If the subscription is not accepted then we shoould go out of scope because any action
Main takes will result in a new subscriber

In response to a Publish:
1. If QoS is Qos1 then the Subscriber must respond with a PubAck packet containing the id of 
the packet being acknowledged 
2. If QoS is Qos2 then Subscriber must respond with a PubRec and then wait for a PubRel

In reponse to a PubRel
1. Subscriber must respond with a PubComp 
2. Release the packet to the app


```pony
be onData(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

## Public Functions

### onSubAck
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-108)</span>


Our subscription has been acknowledged so we need to notify the app of the
result.


```pony
fun box onSubAck(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### onUnsubAck
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-126)</span>


Our unsubscribe has been acknowledged so we need to tell router to remove us from
the map of subscribers.
TODO - We may also have some packets in our queue and we need to decide what to do
about these


```pony
fun ref onUnsubAck(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### onPublish
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-149)</span>


We have received a publish message. It is either:
1. A QoS 0 packet with no id
2. A QoS 1 or QoS2 packet with an id.

If it is QoS 0 then just release the packet

If it is QoS 1 then send a PubAck in return and release the message

It it is QoS 2 then save the message, send a PubRec and wait for a PubRel


```pony
fun ref onPublish(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### doPubAck
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-179)</span>


All we have is an id, so make the pubAck packet and send it


```pony
fun box doPubAck(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### doPubRec
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-192)</span>


We have received a publish message with QoS 2. We acknowledge this with a 
PubRec message and wait for a PubRel in response.


```pony
fun ref doPubRec(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### onPubRel
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-207)</span>


We have received a publish release message for a QoS 2 packet. The payload was
stored when we received the publish message and we need to use this because
pubRel only contains the id


```pony
fun ref onPubRel(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### doPubComp
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-226)</span>


We have received a PubRel from a sender so we acknowledge this with a PubComp 
message. We only have the id at this stage so there is little to do


```pony
fun box doPubComp(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### savePacket
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-241)</span>


After receiving a QoS 2 publish packet we need to save it for when we get a PubRel
message. 
TODO - Add functionality to retransmit on reconnect if not cleansession


```pony
fun ref savePacket(
  id: U16 val,
  pubPacket: PublishPacket val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val
*   pubPacket: [PublishPacket](mqtt-publisher-PublishPacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### releasePktById
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-255)</span>


```pony
fun box releasePktById(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### retrievePkt
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-270)</span>


We are at an appropriate place in the protocol to release the message to the 
application. This can be:
1. After receiving a ControlPublish with QoS 0
2. After receiving a ControlPublish with QoS 1
2. After receiving a ControlPubRel with QoS 2


```pony
fun box retrievePkt(
  id: U16 val)
: (PublishPacket val | None val)
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* ([PublishPacket](mqtt-publisher-PublishPacket.md) val | [None](builtin-None.md) val)

---

### releasePkt
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-293)</span>


We are at an appropriate place in the protocol to release the message to the 
application. This can be:
1. After receiving a ControlPublish with QoS 0
2. After receiving a ControlPublish with QoS 1
2. After receiving a ControlPubRel with QoS 2


```pony
fun box releasePkt(
  pubPacket: PublishPacket val)
: None val
```
#### Parameters

*   pubPacket: [PublishPacket](mqtt-publisher-PublishPacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### subscribeComplete
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-313)</span>


Removes the packet with this id from the map of in-flight packets and informs 
router to do the same


```pony
fun ref subscribeComplete(
  id: U16 val)
: None val
```
#### Parameters

*   id: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

