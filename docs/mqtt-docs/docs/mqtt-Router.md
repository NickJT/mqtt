# Router
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-35)</span>

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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-89)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-108)</span>


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

### onPayloadComplete
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-316)</span>


Called by a subscriber when it has completed processing of an incomming message
This tells router to remove the link between the Bid and the subscriber.
Note - This is called as the final step of an **incomming** message so it should 
always receive a Bid and the Bid was issued by the Broker and should not be
checked-in


```pony
be onPayloadComplete(
  bid: U16 val)
```
#### Parameters

*   bid: [U16](builtin-U16.md) val

---

### onPublish
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-334)</span>


Called by a publisher to publish packet on topic. Comes through the router so we
have a central register of all publishers. Called with a Client allocated id (Cid).
So _actorById is indexed by Cid



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

### onPublishComplete
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-347)</span>


Called by a publisher when an id has completed its processing. This tells router
to remove the link between the id and the publisher


```pony
be onPublishComplete(
  id: U16 val)
```
#### Parameters

*   id: [U16](builtin-U16.md) val

---

### onSubscribe
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-363)</span>


Called by a subscriber to subscribe to a new topic. Comes through router so we have
a central register of who is subscribed to what. Only called by a subscriber so
we know the id will always be a Cid
TODO - We should only add the subscriber to the subscriberByTopic map when we get a
SubAck with an approval but consider these two scenarios:
1. We don't put the Subscriber in the map here but wait until we get an Ack: We get a publish 
message before we have finished processing the ack and adding Subscriber to the map. The next
incomming publish looks in _subscriberByTopic, can't find subscriber and so decides this
is an allocated subscription... duplicate subscribers... bad things happen.
2. We put the Subscriber in the map here and then get rejected by the broker: The subscriber
sits in the map but gets nothing, the Nack is reported to the App and the App must unsubscribe
to remove it. No error but additional work for App

Compromise - Put subscriber in map here but **remove** it from Map if we get a Nack. Worst 
case is an unecessary insert/remove in the unlikely event of a rejection. This also matches
unsub case where we have to continue to ack messages between unsub and unsub ack
TODO - Decide what to do if we already have a subscription for that topic


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

### onSubscribeComplete
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-393)</span>


Called by a subscriber to indicate that it has received a SubAck and so has finished
processing its subscribe request. Subscribers can subscribe and unsubscribe 
repeatedly throughout their lifetime but always to the same topic.
We only get the Cid back from the Broker so we need to do a look-up to find the
subscriber whose subscription processing has been completed.
TODO - If accepted is false then remove the subscriber from the _subscriberByTopic
map because we got a rejection (See comment to onSubscribe)


```pony
be onSubscribeComplete(
  sub: Subscriber tag,
  id: U16 val,
  accepted: Bool val)
```
#### Parameters

*   sub: [Subscriber](mqtt-subscriber-Subscriber.md) tag
*   id: [U16](builtin-U16.md) val
*   accepted: [Bool](builtin-Bool.md) val

---

### onUnsubscribe
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-419)</span>


Called by a subscriber to unsubscribe to a topic. Subscribers can subscribe and
unsubscribe repeatedly throughout their lifetime. An unsubscribed subscriber is
still alive but does not appear in the router's subscriber map  
Note - The spec states that clients must continue to acknowledge messages until
an unsub request has been acknowledged - therefore we don't remove the subscriber
here, only in the onUnsubAck behaviour


```pony
be onUnsubscribe(
  sub: Subscriber tag,
  id: U16 val,
  packet: Array[U8 val] val)
```
#### Parameters

*   sub: [Subscriber](mqtt-subscriber-Subscriber.md) tag
*   id: [U16](builtin-U16.md) val
*   packet: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### onUnsubscribeComplete
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-455)</span>


Called by a Subscriber when the subscriber has got confirmation that its Unsubscribe
request has been acknowledged by the Broker. The id is a Cid because the Unsubscribe
message can only be generated by the client. 
At this point, router can remove the entry for the topic from the subscriberByTopic 
map and remove the id from the subscriberById map and check-in the id.
TODO - Note that this implies only **one subscriber per topic**


```pony
be onUnsubscribeComplete(
  sub: Subscriber tag,
  id: U16 val)
```
#### Parameters

*   sub: [Subscriber](mqtt-subscriber-Subscriber.md) tag
*   id: [U16](builtin-U16.md) val

---

### doPing
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-482)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-506)</span>


OnTick is called on every system tick by Ticker. Router then calls all of the
Publishers and Subscribers who have transactions in-flight. Publishers and 
Subscribers that don't have transactions in-flight don't need to be notified
because they have no in-flight messages to time-out 


```pony
be onTick(
  sec: I64 val)
```
#### Parameters

*   sec: [I64](builtin-I64.md) val

---

### onTcpConnect
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-521)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-532)</span>


When this is called we should have a valid Broker connection with our local 
state reflecting the (potentially saved) state in Broker. So we cant tell Main
that we have a Broker ready to receive Publish messsages


```pony
be onBrokerConnect()
```

---

### onBrokerRestore
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-542)</span>


When this is called we should have a valid Broker connection with a saved state in Broker.
Do the necessary to restore the session then call onBrokerConnect


```pony
be onBrokerRestore()
```

---

### onBrokerRefusal
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-552)</span>


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

### disconnectBroker
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-561)</span>


This is called to disconnect cleanly from the Broker. DISCONNECT must be the last
message sent by the client to the server. The client must close the TCP connection
after sending DISCONNECT (so any clean-up from there on must be independent of the
network)


```pony
be disconnectBroker()
```

---

### send
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-590)</span>


Check the TCP connection is valid and use it to send our packet


```pony
be send(
  data: Array[U8 val] val)
```
#### Parameters

*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### sendToMain
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-603)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-580)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-613)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-624)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-639)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-646)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-654)</span>


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

### _findActorById
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-152)</span>


Get the packet id from a PubAck, PubRel, PubRec, PubComp and UnsubAck packets. For
these packet types the RL field is always one byte (=0x02) and the id bytes are
always in bytes 2 and 3.
Because we are not implementing multi-subscriber the suback id will also be in 
bytes 2 and 3.
We search the subscriber map by Id to find the subscriber who is working this id.
Note - **This will not work if we implement multi-subscribe**


```pony
fun box _findActorById(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### _xfindSubscriberByTopic
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-172)</span>


```pony
fun ref _xfindSubscriberByTopic(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### _findSubscriberByTopic
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-195)</span>


Process a Publish Packet and route to the appropriate subscriber. All publish packets
have a topic and this is how we locate the subscriber. There is always a 1:1 mapping
between topics and subscribers (at least in spec 3.1.1)  
Note - From the specification:  

>The Client and Server assign Packet Identifiers independently of each other. As a result,
Client Server pairs can participate in concurrent message exchanges using the same Packet
Identifiers. It is possible for a Client to send a PUBLISH Packet with Packet 
Identifier 0x1234 and then receive a different PUBLISH with Packet Identifier 0x1234
from its Server before it receives a PUBACK for the PUBLISH that it sent.

So - our outgoing publish with Id=3 is not the same as an incomming publish with id=3
but this is OK because we are using the Broker allocated id (bid) for incomming publish 
messages and the Client allocated id (cid) for outgoing messages. 

_findSubscriberByTopic is only called in response to an incomming publish so uses Bid.


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

### _findPayloadById
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-248)</span>


We search the payload map by BId to find the subscriber who is working this Bid.
_subscriberByBid is indexed by Bid not Cid.


```pony
fun box _findPayloadById(
  basePacket: BasePacket val)
: None val
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

#### Returns

* [None](builtin-None.md) val

---

### _doAssignedSubscription
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-262)</span>


Only called if we receive a Publish message and we have no record of a Subscriber that
has subscribed to that topic.  
From the specification:  

>A Client could receive messages that do not match any of its explicit Subscriptions.
This can happen if the Broker:   
1. automatically assigned a subscription to the Client  
2. sends a Publish or PubRel message while the unsubscribe message is in-flight  

>The Client MUST acknowledge any Publish Packet it receives according to the
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

### _removeSubscriber
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-434)</span>


This function enables us to do a reverse lookup on the _subscriberByTopic map to
determine which subscriber has been subscribed to or unsubscriber from. We need it 
to remove a subscriber from the map in the event that it unsubscribes  


```pony
fun ref _removeSubscriber(
  sub: Subscriber tag)
: None val
```
#### Parameters

*   sub: [Subscriber](mqtt-subscriber-Subscriber.md) tag

#### Returns

* [None](builtin-None.md) val

---

### _onPingResp
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-498)</span>


When the broker responds to a ping response we credit the token count. This value 
is debited by doPing() each time we ask for a ping and we quit when it reaches zero.


```pony
fun ref _onPingResp()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

