# Publisher
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-12)</span>

Represents an application level publication topic. Provides a public Publish topic
that:
1. takes the payload and qos
1. passes these arguments to IdIssuer to get the next unique id
2. provides an apply behaviour so IdNotifyPub can call us back and trigger sending
 the completed publish packet to router

Publisher is responsible for managing its in-flight window. For 3.1.1 we will keep this
to one packet for now but with a view to parameterizing this for MQTT 5 compliance.

To manage the in-flight window we only allow n messages to be pending ack and queue any
that arrive before the ack arrives. For 3.1.1 compliance we only need to do this for QoS 1.

TODO - The classes for the Pub ack types are virtually identical and could all be 
replaced by a factory class once we have all the functions coded



```pony
actor tag Publisher is
  IdNotifyPub ref,
  MqActor ref
```

#### Implements

* [IdNotifyPub](mqtt-idIssuer-IdNotifyPub.md) ref
* [MqActor](mqtt-primitives-MqActor.md) ref

---

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-61)</span>


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
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-70)</span>


Public API call to publish a payload


```pony
be publish(
  args: PublishArgs val)
```
#### Parameters

*   args: [PublishArgs](mqtt-primitives-PublishArgs.md) val

---

### apply
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-82)</span>


Called by IdIssuer once an id has been allocated and we have a complete
set of arguments to send and/or save to the queue. NextQosnArgs determines
whether we:
1. continue to publish the current set of args
2. pull a different set of args of the pending queue and send those instead,
queuing our current set
3. queue the current set and wait for a space to open in the in-flight window
In the case of QoS 0, we have already sent the packet via the publish behaviour
because there is no id 


```pony
be apply(
  args: PublishArgs val)
```
#### Parameters

*   args: [PublishArgs](mqtt-primitives-PublishArgs.md) val

---

### onData
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-166)</span>


Called by router via the findPublisherById map [Cid,Published] when it receives
one of the three publish acknowledge packets (PubAck for QoS1, PubRec or PubComp for Qos2)


```pony
be onData(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

### onTick
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-189)</span>


```pony
be onTick(
  sec: I64 val)
```
#### Parameters

*   sec: [I64](builtin-I64.md) val

---

### onDuckAndCover
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-288)</span>


We need to save state because the broker is disconnecting or something has gone awry.   


```pony
be onDuckAndCover()
```

---

## Public Functions

### nextQos1Args
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-101)</span>


Manages the in-flight window for QoS 1 messages and saves the packet in case we
don't get a pubAck

If we are passed args we push them onto the back of the pending queue. Then we 
check whether the in-flight window is open. If it is we take the args at the head
of the queue, send them to router and add the packet to the in-flight map.

If we are passed None, we check whether the in-flight window is open. If it is we
take the args at the head of the queue, if there are any, and send them to router, 
addding the packet to the in-flight map.


```pony
fun ref nextQos1Args(
  argsOrNone: (PublishArgs val | None val))
: None val
```
#### Parameters

*   argsOrNone: ([PublishArgs](mqtt-primitives-PublishArgs.md) val | [None](builtin-None.md) val)

#### Returns

* [None](builtin-None.md) val

---

### inFlightLimitReached
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-143)</span>


Returns true if there are fewer messages in-flight than our in-flight limit


```pony
fun box inFlightLimitReached()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### nextQos2Args
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-150)</span>


For protocol Vsn 3.1.1 there is no in-flight limit for QoS 2 messages. This means 
the all we need to do is save the packet in case we don't get a pubRec. We're
doing it like this though because protocol Vsn 5 has in-flight windows for all QoS.
Only called from within publisher so must be using Cid


```pony
fun ref nextQos2Args(
  argsOrNone: (PublishArgs val | None val))
: None val
```
#### Parameters

*   argsOrNone: ([PublishArgs](mqtt-primitives-PublishArgs.md) val | [None](builtin-None.md) val)

#### Returns

* [None](builtin-None.md) val

---

### sendToRouter
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-181)</span>


Make a publish packet with the passed arguments and send it to router


```pony
fun box sendToRouter(
  args: PublishArgs val)
: None val
```
#### Parameters

*   args: [PublishArgs](mqtt-primitives-PublishArgs.md) val

#### Returns

* [None](builtin-None.md) val

---

### onPubAck
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-197)</span>


The single ack packet for QoS 1 messages. Once we get this we can discard the 
publish message. The onPubAck can only be called in response to a routed PubAck
generated by the Broker in response to a Publish with a Cid. So id is Cid


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
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-221)</span>


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

### doPubRel
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-243)</span>


Send a PubRelPacket with the passed Cid to the router.


```pony
fun ref doPubRel(
  cid: U16 val)
: None val
```
#### Parameters

*   cid: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

### onPubComp
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-255)</span>


The second of the two acknowledgement messages of the QoS 2 transaction. Once we
get a PubComp we can delete the saved PubRel message and check-in the id. Always
called with a Cid


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

### publishComplete
<span class="source-link">[[Source]](src/mqtt-publisher/publisher.md#L-0-277)</span>


Called when we have received our last publish acknowledgement. We can now
remove the pubRel message from the map and tell the router to do it's necessary
cleanup before it releases the id. 
This function should be preceded by deletion of the publish packet in the case
of QoS 1 publication and by deletion of the PubRel packet in the case of QoS 2.


```pony
fun ref publishComplete(
  cid: U16 val)
: None val
```
#### Parameters

*   cid: [U16](builtin-U16.md) val

#### Returns

* [None](builtin-None.md) val

---

