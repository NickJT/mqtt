# Subscriber
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-12)</span>

Represents an application level subscription to one topic. 
Note - We're not implementing the multi-subscribe capability in the specification
because the saving in a few sub/unsub messages is outweighed by losing the one topic:
one subscriber model. The Broker cannot conflate multiple acks into one SubAck unless
the client subscribes to multiple topics in one subscribe message so we are protected 
from multiple unsub messages.  
Clients must continue to ack messages from the Broker while the unsubscribe process is
underway so we don't have an unsubscribe behaviour. Instead we have a onUnsubAck 
behaviour which is called when the Broker has acknowledged the unsubscirbe request. 
Only then, when we know there will be no more messages, do we start our clean-up.
TODO - Rather than implement timeouts here we should have router manage timeouts
for all messages - so we don't hang the app if we don't get a response to a 
subscribe or unsubscribe for example.
Note: The ids for sub/unsub and publish can conflict so must be kept within 
the relevant methods. Sub/unsub ids are issued by IdIssuer. Publish ids are issued
by the Broker.


```pony
actor tag Subscriber is
  MqActor ref
```

#### Implements

* [MqActor](mqtt-primitives-MqActor.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-37)</span>


```pony
new tag create(
  router: Router tag,
  topic: String val,
  qos: (Qos0 val | Qos1 val | Qos2 val))
: Subscriber tag^
```
#### Parameters

*   router: [Router](mqtt-router-Router.md) tag
*   topic: [String](builtin-String.md) val
*   qos: ([Qos0](mqtt-primitives-Qos0.md) val | [Qos1](mqtt-primitives-Qos1.md) val | [Qos2](mqtt-primitives-Qos2.md) val)

#### Returns

* [Subscriber](mqtt-subscriber-Subscriber.md) tag^

---

## Public Behaviours

### subscribe
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-48)</span>


The packet id is the last piece of the jigsaw. Once we have this we can build our 
subscribe packet and send it to the broker


```pony
be subscribe(
  cid: U16 val)
```
#### Parameters

*   cid: [U16](builtin-U16.md) val

---

### unsubscribe
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-56)</span>


The packet id is the last piece of the jigsaw. Once we have this we can build our 
unsubscribe packet and send it to the broker


```pony
be unsubscribe(
  cid: U16 val)
```
#### Parameters

*   cid: [U16](builtin-U16.md) val

---

### onTick
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-64)</span>


This is the target for the TickListener trait that is called by the system tick
tick timer. Each time we get this we scan the in-flight queue for expired messages


```pony
be onTick(
  sec: I64 val)
```
#### Parameters

*   sec: [I64](builtin-I64.md) val

---

### onDuckAndCover
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-73)</span>


We need to save state because the broker is disconnecting or something has gone awry.   


```pony
be onDuckAndCover()
```

---

### onDisconnect
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-80)</span>


All Subscribers get informed of a broker disconnect with a call to the onDisconnect behaviour.
This enables the Subscriber to take whatever application level action is to respond 
to this externally (to the actor) generated break in data. Actions depend on QoS of messages:
QoS 0 - Nothing to be done
QoS 1 - Nothing to be done. If we haven't acked a received packet the Broker will re-send it
QoS 2 - Save the _pktMap entries because the app may want to restore the session
Note - Disconnect may be a result of an error so we can't assume there is a Broker connection
at this point but we will try to unsubscribe anyway.
If we have packets in _pktMap onDisconnect and CleanSession is false then they are awaiting
PubRels from the Broker. We need to save these by sending them to main. 


```pony
be onDisconnect()
```

---

### onData
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-103)</span>


The Router sends data packets from the Broker, to actors who have requested it, using the
onData behaviour. Note that QoS 0 Publish messages don't have an id so we default this to 0.
As a Subscriber the only messages we get from the Broker are:
1. A SubAck to confirm our subscription
2. A Publish packet containing a payload
3. A PubRel message forming part three of the QoS 2 handshake
4. A UnSubAck to confirm out unsubscription

In response to a SubAck:
1. We notify the app of the result
2. We tell router we have finished processing the id of the subscribe packet
3. If the subscription is not accepted then we leave it to the app to take further action

In response to a Publish:
1. If QoS is Qos1 then the Subscriber must respond with a PubAck packet containing the id of 
the packet being acknowledged and then release the packet to the app
2. If QoS is Qos2 then Subscriber must respond with a PubRec and save the packet until 
a PubRel is received. 

In reponse to a PubRel
1. Subscriber must respond with a PubComp 
2. Subscriber must release the packet to the app

In response to an UnsubAck:
1. We notify the app (via Main) of the result
2. We tell router we have finished processing the id of the subscribe packet



```pony
be onData(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

## Public Functions

### onSubAck
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-144)</span>


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
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-164)</span>


Our unsubscribe has been acknowledged so we need to tell router to remove us from
the map of subscribers.
TODO - Why don't we respond directly to main instead of going via router?
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

### onPayload
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-185)</span>


Note - We name this function onPayload to avoid confusion with message publication.
We have received a publish message. The publish message is either:
1. A QoS 0 packet with no id
2. A QoS 1 or QoS2 packet with an id.

If it is QoS 0 then just release the packet

If it is QoS 1 then send a PubAck in return and release the message. Then tell
router we have completed processing the id. The packet is never stored in _pktMap

If it is QoS 2 then save the message, send a PubRec and wait for a PubRel


```pony
fun ref onPayload(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### doPubAck
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-216)</span>


All we have is an id, so make the pubAck packet and send it. No look-ups with id
so we don't care whether it is Broker or Client assigned.
Note that QoS 1 packets are never stored in _pktMap so there is no remove to do


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
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-231)</span>


We have received a publish message with QoS 2. We acknowledge this with a 
PubRec message and wait for a PubRel in response. No id lookup so we don't 
care whether this is a Bid or  Cid


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
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-246)</span>


We have received a publish release message for a QoS 2 packet. Send a pubComp
to ack this. The payload was stored when we received the publish message and 
we need to retrieve this from the packetMap to release it. 
Then we **delete the message** from the packet Map and tell router we have completed
processing.
Note - we do a lookup with id on _pktMap so we can't mix Bid and Cid in one
subscriber instance. 


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
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-272)</span>


We have received a PubRel from a sender so we acknowledge this with a PubComp 
message. We only have the id at this stage so there is little else to do. No
lookups on id so we don't care whether it is a Bid or a Cid.


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

### releasePkt
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-281)</span>


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

### payloadComplete
<span class="source-link">[[Source]](src/mqtt-subscriber/subscriber.md#L-0-297)</span>


Informs router that we have finished processing this id.


```pony
fun ref payloadComplete(
  bid: U16 val)
: None val
```
#### Parameters

*   bid: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

