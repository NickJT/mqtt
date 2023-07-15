# Router
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-38)</span>

Router accepts incomming MQTT packets and routes these by type to the appropriate 
handler actor. Router is also responsible for writing bytes back out to the Broker
via the TCP connection. 

Router is constructed by Client and passed the configuration details needed to 
establish the Broker connection. 

When the TCP connection is available, Client calls the onTCPConnect behaviour. This 
enables Router to start a Connector actor that is responsible for the connection and 
interpreting the Connack packet that the Broker sends back.

Router only deals with MQTT packet internals to the extent needed to route the packets
to the right handler actor. This means it can limit its interest to the fixed header of
the packet and not get involved in interpreting variable headers or payloads. This is 
why we have the DataPacket class which is used for routing and then re-interpreted 
according to its control byte on arrival.

Router constructs the idIssuer and maintains a map of subscribers keyed by id and so 
all subscription requests are sent via the router's subscribe behaviour.

Router also starts the Pinger actor responsible for keepAlive pings to the Broker, and the 
system ticker used for checking message timetouts.

Registrar usage  
- Router adds IdIssuer actor that issues ids to other actors
- Router adds the pinger actor that sends pingreq messages 


```pony
actor tag Router
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-83)</span>


```pony
new tag create(
  reg: Registrar tag,
  config: HashMap[String val, String val, HashEq[String val] val] val)
: Router tag^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   config: [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

#### Returns

* [Router](mqtt-Router.md) tag^

---

## Public Behaviours

### route
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-102)</span>


This function demultiplexes the incomming packet stream according to packet type
First we deal with Publish because this may or may not have an id. Then we deal with 
the messages that always have id bytes after a single remaining length byte. These are
ControlPubAck, ControlPubRec, ControlPubRel, ControlPubComp and ControlUnsubAck. 
Finally there are specific types which don't have packet ids. These are CONNECT,
CONNACK, PINGRESP, PINGREQ and DISCONNECT but only CONNACK and PINGRESP are valid
in this context because CONNECT has already been taken care of and PINGREQ and
DISCONNECT are outgoing messages (i.e. client to broker).  


```pony
be route(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

### doPing
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-286)</span>


Ask the Broker for a pingResp and debit the number of times we have asked without
a response. If we have asked three times with no response then assume the broker
has gone away and start the clean-up process.  
We also send a disconnect packet just in case the Broker comes back in the meantime
and wonders where we are.


```pony
be doPing()
```

---

### onTick
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-302)</span>


OnTick is called on every system tick by Ticker. Router then calls the onTick
behaviour on each of the publishers and subscribers in its maps.


```pony
be onTick(
  sec: I64 val)
```
#### Parameters

*   sec: [I64](builtin-I64.md) val

---

### onSubscribeComplete
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-313)</span>


Called by a subscriber when an id has completed its processing. This tells router
to remove the link between the id and the subscriber


```pony
be onSubscribeComplete(
  id: U16 val)
```
#### Parameters

*   id: [U16](builtin-U16.md) val

---

### onUnsubscribeComplete
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-328)</span>


Called when a subscriber has got confirmation that its Unsubscribe request has
been acknowledged by the Broker. At this point, router can remove the entry for
the topic from the subscriberByTopic map and remove the id from the subscriberById
map and check-in the id
Subscriber is an actor so we can't get its topic. To


```pony
be onUnsubscribeComplete(
  id: U16 val)
```
#### Parameters

*   id: [U16](builtin-U16.md) val

---

### onPublishComplete
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-360)</span>


Called by a publisher when an id has completed its processing. This tells router
to remove the link between the id and the publisher


```pony
be onPublishComplete(
  id: U16 val)
```
#### Parameters

*   id: [U16](builtin-U16.md) val

---

### onTcpConnect
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-374)</span>


Once we know that we have a TCP connection we can safely start the Connector 
actor to ask the Broker for a session. The reponse (a CONNACK) will return 
via a call to our .route behaviour from assemblr


```pony
be onTcpConnect(
  tcp: TCPConnection tag)
```
#### Parameters

*   tcp: [TCPConnection](net-TCPConnection.md) tag

---

### onBrokerConnect
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-384)</span>


When this is called we should have a valid Broker connection with our local 
state reflecting the (potentially saved) state in Broker. So we cant tell Main
that we have a Broker ready to receive Publish messsages


```pony
be onBrokerConnect()
```

---

### subscribe
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-393)</span>


Called when router needs to add a subscription - either for the initial subscriptions
or for an assigned subscription.
TODO - It might be better to have this in Connector and then router doesn't need
to have a special case for handling subscriptions (but then we need to call
Connector out of context for assigned subscriptions - so, no)


```pony
be subscribe(
  topic: String val,
  qos: String val)
```
#### Parameters

*   topic: [String](builtin-String.md) val
*   qos: [String](builtin-String.md) val

---

### onBrokerRestore
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-410)</span>


When this is called we should have a valid Broker connection with a saved state in Broker.
Do the necessary to restore the session then call onBrokerConnect


```pony
be onBrokerRestore()
```

---

### onBrokerRefusal
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-420)</span>


Called by Connector if the Broker has refused the connection


```pony
be onBrokerRefusal(
  reason: (ConnAckAccepted val | ConnAckRefusedProtocolVersion val | ConnAckRefusedIdentifierRejected val | 
    ConnAckRefusedServerUnavailable val | ConnAckRefusedBadUserNameOrPassword val | ConnAckRefusedNotAuthorised val))
```
#### Parameters

*   reason: ([ConnAckAccepted](mqtt-connector-ConnAckAccepted.md) val | [ConnAckRefusedProtocolVersion](mqtt-connector-ConnAckRefusedProtocolVersion.md) val | [ConnAckRefusedIdentifierRejected](mqtt-connector-ConnAckRefusedIdentifierRejected.md) val | 
    [ConnAckRefusedServerUnavailable](mqtt-connector-ConnAckRefusedServerUnavailable.md) val | [ConnAckRefusedBadUserNameOrPassword](mqtt-connector-ConnAckRefusedBadUserNameOrPassword.md) val | [ConnAckRefusedNotAuthorised](mqtt-connector-ConnAckRefusedNotAuthorised.md) val)

---

### onSubscribe
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-428)</span>


Called by a subscriber to subscribe to a new topic. Comes through router so we have
a central register of who is subscribed to what 


```pony
be onSubscribe(
  sub: Subscriber tag,
  topic: String val,
  id: U16 val,
  packet: Array[U8 val] val)
```
#### Parameters

*   sub: [Subscriber](mqtt-subscriber-Subscriber.md) tag
*   topic: [String](builtin-String.md) val
*   id: [U16](builtin-U16.md) val
*   packet: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### onPublish
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-438)</span>


Called by a publisher to publish packet on topic. Comes through router so we have
a central register of all publishers 


```pony
be onPublish(
  pub: Publisher tag,
  topic: String val,
  id: U16 val,
  packet: Array[U8 val] val)
```
#### Parameters

*   pub: [Publisher](mqtt-publisher-Publisher.md) tag
*   topic: [String](builtin-String.md) val
*   id: [U16](builtin-U16.md) val
*   packet: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### disconnectBroker
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-448)</span>


This is called to disconnect cleanly from the Broker. DISCONNECT must be the last
message sent by the client to the server. The client must close the TCP connection
after sending DISCONNECT (so any clean-up from there on must be independent of the
network)


```pony
be disconnectBroker()
```

---

### send
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-467)</span>


Check the TCP connection is valid and use it to send our packet


```pony
be send(
  data: Array[U8 val] val)
```
#### Parameters

*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### sendToMain
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-480)</span>


```pony
be sendToMain(
  s1: String val,
  s2: String val)
```
#### Parameters

*   s1: [String](builtin-String.md) val
*   s2: [String](builtin-String.md) val

---

## Public Functions

### saveState
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-271)</span>


Called when we have lost connection with the Broker and need to save our state in
the sure and certain hope of a ressurection


```pony
fun box saveState()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### onControlConnect
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-487)</span>


Mock Broker - for testing only


```pony
fun box onControlConnect(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### onControlSubscribe
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-498)</span>


Mock Broker - for testing only


```pony
fun ref onControlSubscribe(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### onControlUnsubscribe
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-513)</span>


Mock Broker - for testing only


```pony
fun box onControlUnsubscribe(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### onControlPingReq
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-520)</span>


Mock Broker - for testing only


```pony
fun box onControlPingReq(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### onControlDisconnect
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-528)</span>


Mock Broker - for testing only


```pony
fun box onControlDisconnect(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

## Private Functions

### _findSubscriberByTopic
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-146)</span>


Process a Publish Packet and route to the appropriate subscriber. All publish packets
have a topic and this is how we locate the subscriber. There is always a 1:1 mapping
between topics and subscribers (at least in spec 3.1.1)  
Note - From the specification: 
The Client and Server assign Packet Identifiers independently of each other. As a result,
Client Server pairs can participate in concurrent message exchanges using the same Packet
Identifiers. It is possible for a Client to send a PUBLISH Packet with Packet 
Identifier 0x1234 and then receive a different PUBLISH with Packet Identifier 0x1234
from its Server before it receives a PUBACK for the PUBLISH that it sent.
So - our outgoing publish with Id=3 is not the same as an incomming publish with id=3
but this is OK because we are using the incomming id as a key into a subscriber map.
We will have a separate publisher map to keep track of outgoing ids.


```pony
fun ref _findSubscriberByTopic(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### _findSubscriberById
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-188)</span>


Get the packet id from a PubAck, PubRel, PubRec, PubComp and UnsubAck packets. For
these packet types the RL field is always one byte (=0x02) and the id bytes are
always in bytes 2 and 3.
Because we are not implementing multi-subscriber the suback id will also be in 
bytes 2 and 3.
We search the subscriber map by Id to find the subscriber who is working this id.


```pony
fun box _findSubscriberById(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### _doAssignedSubscription
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-206)</span>


Only called if we recieve a Publish message and we have no record of a Subscriber that
has subscribed to that topic.  
From the specification: A Client could receive messages that do not match any of 
its explicit Subscriptions. This can happen if the Broker:  
1. automatically assigned a subscription to the Client
2. send a Publish or PubRel message while the unsubscribe message is in-flight  

The Client MUST acknowledge any Publish Packet it receives according to the
applicable QoS rules regardless of whether it elects to process the message it contains.  

We don't remove Subscription from router tables until we get a sub-ack so we should
be covered for 2 unless the broker continues to send pubRel after an unsubscribe 
(which it might?).
TODO - Does the broker send a PubRel after getting an unsubscribe? If so, we probably
have a potential error condition here. 

Assuming we only have to handle case 1. We can include the subscription in the
local subscriber map then re-route the packet to let nature take its course. We don't
use router.subscribe() because we don't want subscriber to send a another subscription
request to the Broker.  
Note - this section is synchronous so we know that the new subscriber is in the
subscriber map before we call router.route(). Keep this in mind when chaning this 
function.  
TODO - We need to remove this local only subscriber from the maps at some
point in the cleanup process

Also - during dev, this could be because are are a Mock Broker. In this event the 
acks should just flow as required


```pony
fun ref _doAssignedSubscription(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### _findPublisherById
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-258)</span>


Get the packet id from a PubAck, PubRel or PubComp and search the publisher map by Id
to find the publisher who is working this id.


```pony
fun box _findPublisherById(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### _onPingResp
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-279)</span>


When the broker responds to a ping response we credit the token count. This value 
is debited by doPing() each time we ask for a ping and we quit when it reaches zero.


```pony
fun ref _onPingResp()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

