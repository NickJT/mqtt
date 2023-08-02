# Router
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-24)</span>

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

>The Client and Server MUST store Session state for the entire duration of the Session
[MQTT-4.1.0-1]. A Session MUST last at least as long it has an active Network Connection

The implication of this is that if there is a network disconnection then the Session state 
**does not** need to be stored. So the client can request any saved state from the Broker
but the Broker cannot demand any saved state from a client unless CleanSession = 0. But if
the client does set CleanSession = 0 then it must be prepared for resent Publish and PubRel
packets.

Registrar usage  
- Router adds IdIssuer actor that issues ids to other actors
- Router adds the pinger actor that sends pingreq messages 


```pony
actor tag Router
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-86)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-93)</span>


This function demultiplexes the incomming packet stream according to packet type.
In comming Publish and PubRel packets have Broker assigned Ids (bids) so these 
use an id to subscriber map with Bid keys. Outgoing messages (from both publishers)
and subscribers use client assigned ids (cids). The two ids need to be indexed separately 
because the numeric ranges can overlap.
TODO - refactor into subtypes to reduce the number of matches


```pony
be route(
  basePacket: BasePacket val)
```
#### Parameters

*   basePacket: [BasePacket](mqtt-utilities-BasePacket.md) val

---

### onPayloadComplete
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-291)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-309)</span>


Called by a publisher to publish packet on topic. Comes through the router so we
have a central register of all publishers. Called with a Client allocated id (Cid).
So _actorById is indexed by Cid. 
TODO - During dev we have a duplicate check but this can be removed later


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-326)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-343)</span>


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
TODO - Duplicate id check can be removed after testing
TODO - Decide what to do if we already have a subscription for a topic. This could be a duplicate
application request or it could be because we have restored a session, got a message on one of the
stored subscriptions and completed our assigned message behaviour.


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-384)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-410)</span>


Called by a subscriber to unsubscribe to a topic. Subscribers can subscribe and
unsubscribe repeatedly throughout their lifetime. An unsubscribed subscriber is
still alive but does not appear in the router's subscriber map  
Note - The spec states that clients must continue to acknowledge messages until
an unsub request has been acknowledged - therefore we don't remove the subscriber
here, only in the onUnsubAck behaviour
TODO - During dev we have a duplicate check but this can be removed later


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-428)</span>


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

### onTick
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-472)</span>


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

### doPing
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-485)</span>


Ask the Broker for a pingResp and debit the number of times we have asked without
a response. If we have asked three times with no response then assume the broker
has gone away and start the clean-up process.  
We also send a disconnect packet just in case the Broker comes back in the meantime
and wonders where we are.


```pony
be doPing()
```

---

### onTcpConnect
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-513)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-524)</span>


When this is called we should have a valid Broker connection with our local 
state reflecting the (potentially saved) state in Broker.


```pony
be onBrokerConnect()
```

---

### onBrokerRestore
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-538)</span>


This behaviour is called by connector if the Broker has accepted a connection with
CleanSession = 0 and has a saved session for this client. 

>A Client with stored Session state will expect the Server to maintain its stored 
Session state. In the event that the value of Session Present received by the Client
from the Server is not as expected, the Client can choose whether to proceed with the
Session or to disconnect. The Client can discard the Session state on both Client and
Server by disconnecting, connecting with Clean Session set to 1 and then disconnecting
again.

This means that we should check here to see whether the value of cleansession returned
from the Broker matches our request in config

So, when this is behavior is called by connector:  
1. we have a valid Broker connection
2. the Broker may send us unack'd Publish and PubRel messages
3. we need to save our state and persist it on disconnect (!)

>When a Client reconnects with CleanSession set to 0, both the Client and Server MUST re-send any 
unacknowledged PUBLISH Packets (where QoS > 0) and PUBREL Packets using their original Packet 
Identifiers [MQTT-4.4.0-1]. This is the only circumstance where a Client or Server is REQUIRED to 
redeliver messages.

So:  
1.  we may have unack'd Publish and pubRel messages with Cids to be re-sent,    
2.  we may receive Publish messages with Bids for which we have no subscriber yet, and
3.  we may receive PubRel messages with Bids which we do not have in our map  
Yikes


```pony
be onBrokerRestore()
```

---

### onBrokerStateNotFound
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-585)</span>


This behaviour is called by connector if the Broker has accepted a connection with
CleanSession = 0 and but **cannot find a saved session for this client**. In this event
we must inform the app and await further instructions.   
TODO - Add main method for handling session not found?


```pony
be onBrokerStateNotFound()
```

---

### onBrokerRefusal
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-599)</span>


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

### onErrorOrDisconnect
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-607)</span>


Called if we detect a protocol error, broker timeout or network disconnect


```pony
be onErrorOrDisconnect(
  errorCode: (NoError val | ForbiddenType val | ForbiddenFlags val | 
    ForbiddenCode val | ForbiddenWillQos val | ForbiddenQos val | 
    InvalidType val | InvalidControl val | InvalidFlags val | 
    InvalidRemainingLength val | MalformedRequest val | MalformedResponse val | 
    CleanSessionRequired val | SubscribeFailed val | NotConnected val | 
    SocketError val | ConnectionClosed val | ReconnectFailed val | 
    ConnectionRefused val | UnknownError val))
```
#### Parameters

*   errorCode: ([NoError](mqtt-primitives-NoError.md) val | [ForbiddenType](mqtt-primitives-ForbiddenType.md) val | [ForbiddenFlags](mqtt-primitives-ForbiddenFlags.md) val | 
    [ForbiddenCode](mqtt-primitives-ForbiddenCode.md) val | [ForbiddenWillQos](mqtt-primitives-ForbiddenWillQos.md) val | [ForbiddenQos](mqtt-primitives-ForbiddenQos.md) val | 
    [InvalidType](mqtt-primitives-InvalidType.md) val | [InvalidControl](mqtt-primitives-InvalidControl.md) val | [InvalidFlags](mqtt-primitives-InvalidFlags.md) val | 
    [InvalidRemainingLength](mqtt-primitives-InvalidRemainingLength.md) val | [MalformedRequest](mqtt-primitives-MalformedRequest.md) val | [MalformedResponse](mqtt-primitives-MalformedResponse.md) val | 
    [CleanSessionRequired](mqtt-primitives-CleanSessionRequired.md) val | [SubscribeFailed](mqtt-primitives-SubscribeFailed.md) val | [NotConnected](mqtt-primitives-NotConnected.md) val | 
    [SocketError](mqtt-primitives-SocketError.md) val | [ConnectionClosed](mqtt-primitives-ConnectionClosed.md) val | [ReconnectFailed](mqtt-primitives-ReconnectFailed.md) val | 
    [ConnectionRefused](mqtt-primitives-ConnectionRefused.md) val | [UnknownError](mqtt-primitives-UnknownError.md) val)

---

### disconnectBroker
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-615)</span>


This is called to disconnect cleanly from the Broker. DISCONNECT must be the last
message sent by the client to the server. The client must close the TCP connection
after sending DISCONNECT (so any clean-up from there on must be independent of the
network)


```pony
be disconnectBroker()
```

---

### cancelKeepAlive
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-639)</span>


We make this a behaviour so that main can cancel it in the event of an error. Otherwise
router can terminate but leave pinger pinging - which means the process won't terminate.


```pony
be cancelKeepAlive()
```

---

### send
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-673)</span>


Check the TCP connection is valid and use it to send our packet


```pony
be send(
  data: Array[U8 val] val)
```
#### Parameters

*   data: [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### showMessage
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-686)</span>


```pony
be showMessage(
  s1: String val,
  s2: String val)
```
#### Parameters

*   s1: [String](builtin-String.md) val
*   s2: [String](builtin-String.md) val

---

### showStatus
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-690)</span>


```pony
be showStatus(
  status: String val)
```
#### Parameters

*   status: [String](builtin-String.md) val

---

## Public Functions

### saveState
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-648)</span>


Called when we have lost connection with the Broker and need to save our state in
the sure and certain hope of the ressurection


```pony
fun box saveState()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### onControlConnect
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-699)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-710)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-725)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-731)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-739)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-132)</span>


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

### _findSubscriberByTopic
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-152)</span>


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
TODO - The duplicate check on Broker id can probably be optimised out.


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-197)</span>


We search the payload map by Bid to find the subscriber who is working this Bid.


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-210)</span>


Only called if we receive a Publish message and we have no record of a Subscriber that
has subscribed to that topic. Apparently, this is possible in Protocol 3.1.1. From the
specification:  

>A Client could receive messages that do not match any of its explicit Subscriptions.
This can happen if the Broker:   
1. automatically assigned a subscription to the Client  
2. sends a Publish or PubRel message while the unsubscribe message is in-flight  
3. **The client has connected with CleanSession=0 and is getting retransmissions** 

>The Client MUST acknowledge any Publish Packet it receives according to the
applicable QoS rules regardless of whether it elects to process the message it contains.  

Note - the receiver **does not** ack any Publish packets it received but hadn't ack'd
at the time of the disconnect. Therefore don't save the incomming publication list because
the sender will re-send anything we haven't ack'd.

Case 1. We can include the subscription in the local subscriber map then re-route
the packet to let nature take its course. We don't use router.subscribe() because
we don't want subscriber to send a another subscription request to the Broker. 
TODO - We need to remove this local only subscriber from the maps at some
point in the cleanup process

Case 2. We don't remove Subscription from router tables until we get a sub-ack so
we should be covered for 2 unless the broker continues to send pubRel after an
unsubscribe (which it might?).
TODO - Does the broker send a PubRel after getting an unsubscribe? If so, we probably
have a potential error condition here. 

Case 3 is expected behaviour and can result in a Publish or PubRel for which we have no 
subscriber. Publish messages will be caught by Case 1 but for PubRel all we will have
is the Bid. 

**If we implement Method A in 4.3.3 of the spec** then we need to retrieve the payload
by Bid, release it to the application and then send PubComp.  

**If we implement Method B in 4.3.3 of the spec** (release the payload on receipt of
the publish), then all we need to do is send a PubComp with the same Bid. But, note 
that in Method B we are responsible for ensuring that duplicates are not sent 
to the application. This means we need to save a list of Bids for which we have released
the payload but not yet got a PubRel. 

So the choice is: a) persist the payload and the Bid and rely on the Broker to prevent
duplicates, or b) persist only bid but check each incomming bid against this and filter
any bids that appear in this list (i.e. where the Broker did not get the pubrec). Delete
the Bid from the list when a PubRel is received for it 

In keeping with the spirit of QoS 2 we have implemented Method A. So Subscriber must
persist messages in the event of a disconnect.

Note - this section is synchronous so we know that the new subscriber is in the
subscriber map before we call router.route(). Keep this in mind when changing this 
function.  

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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-452)</span>


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
<span class="source-link">[[Source]](src/mqtt/router.md#L-0-501)</span>


When the broker responds to a ping response we credit the token count. This value 
is debited by doPing() each time we ask for a ping and we quit when it reaches zero.
TODO - The test isn't really needed unless we need to protect against missing 
an incomming Ping


```pony
fun ref _onPingResp()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

