/** uses **/
  use "assert"
  use "bureaucracy"
  use "collections"
  use "debug"
  use "net"
  use "time"

  use ".."
  use "package:../assembler"
  use "package:../connector"
  use "package:../idIssuer"
  use "package:../mqtt"
  use "package:../primitives"
  use "package:../pinger"
  use "package:../publisher"
  use "package:../services"
  use "package:../subscriber"
  use "package:../terminal"
  use "package:../network"
  use "package:../utilities"

/********************************************************************************/
actor Router
  """
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

  """
  let _mqtt : Mqtt
  let _idIssuer : IdIssuer = IdIssuer
  var _pinger : (Pinger | None) = None
  var _connector : Connector
  var _pingTokens : USize = 3
  var _pingTokenCount : USize = _pingTokens

  let _subscriberByTopic : Map[String val, Subscriber tag ] = Map[String val, Subscriber tag ]
  
  let _subscriberByBid : Map[IdType, Subscriber tag] = Map[IdType, Subscriber tag]
  """
  _subscriberByBid tracks the incomming publish messages by the Broker Id (bid) 
  and their incomming and outgoing acks
  """

  let _publisherByTopic : Map[String val, Publisher tag] = Map[String val, Publisher tag]
  """
  We're using this during the R0.2 refactoring to ensure we don't create multiple publishers 
  on the same topic
  """

  let _actorById : Map[IdType, MqActor tag] = Map[IdType, MqActor tag] 
  """
  _actorById tracks the outgoing messages and their incomming and outgoing acks 
  """

  let _config :  Map[String val, String val] val

  var _tcpMaybe : (TCPConnection | None) = None
  var _cleanSession : Bool = true

  new create(mqtt : Mqtt, config :  Map[String val, String val] val) =>
    _mqtt = mqtt
    _config = config
    _connector = Connector(this)
    

/*********************************************************************************/
be route(basePacket : BasePacket val) =>
    """
    This function demultiplexes the incomming packet stream according to packet type.
    In comming Publish and PubRel packets have Broker assigned Ids (bids) so these 
    use an id to subscriber map with Bid keys. Outgoing messages (from both publishers)
    and subscribers use client assigned ids (cids). The two ids need to be indexed separately 
    because the numeric ranges can overlap.
    TODO - refactor into subtypes to reduce the number of matches
    """
    if (basePacket.isNotValid()) then
      Debug.err("Router got an invalid packet at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
      return
    end
    
    //Debug.err("Router got a " + basePacket.controlType().string())
    //Debug.err(basePacket.data())

    match basePacket.controlType()
      | ControlConnAck => _connector.onAck(basePacket)
      | ControlPublish => _findSubscriberByTopic(basePacket)  // goes to subscriber but may not have an id so find by topic and put Bid in _subscriberByBid
      | ControlPubRel  => _findPayloadById(basePacket) // goes to subscriber, uses Bid 
      | ControlSubAck => _findActorById(basePacket) // Goes to subscriber, uses Cid 
      | ControlUnsubAck => _findActorById(basePacket) // goes to subscriber, uses Cid 
      | ControlPubAck => _findActorById(basePacket) //  PubAck goes to publisher, uses Cid 
      | ControlPubRec => _findActorById(basePacket) // PubRec goes to publisher, uses Cid 
      | ControlPubComp => _findActorById(basePacket) // PubComp goes to publisher, uses Cid 
      | ControlPingResp => _onPingResp() 
      /*   BROKER PACKETS FOR DEV TESTING ONLY  */
      | ControlConnect => onControlConnect(basePacket)
      | ControlSubscribe => onControlSubscribe(basePacket)
      | ControlUnsubscribe => onControlUnsubscribe(basePacket)
      | ControlPingReq => onControlPingReq(basePacket)
      | ControlDisconnect => onControlDisconnect(basePacket)
      /*   BROKER PACKETS FOR DEV TESTING ONLY  */
    else
      Debug.err("Shouldn't get to " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    end

/********************************************************************************/
fun _findActorById(basePacket : BasePacket val) =>
  """
  Get the packet id from a PubAck, PubRel, PubRec, PubComp and UnsubAck packets. For
  these packet types the RL field is always one byte (=0x02) and the id bytes are
  always in bytes 2 and 3.
  Because we are not implementing multi-subscriber the suback id will also be in 
  bytes 2 and 3.
  We search the subscriber map by Id to find the subscriber who is working this id.
  Note - **This will not work if we implement multi-subscribe**
  """ 
  try 
    _actorById(BytesToU16(basePacket.data().trim(2,4)))?.onData(basePacket)
  else
    Debug.err("Couldn't match id and subscriber at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string() )
    Debug.err(basePacket.controlType().string() + " with id " + BytesToU16(basePacket.data().trim(2,4)).string())
  end

/*********************************************************************************/
/*******************   Functions for incomming Payloads   ************************/
/*********************************************************************************/
fun ref _findSubscriberByTopic(basePacket : BasePacket val) =>
  """
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
  """   
  var pubPacket : PublishPacket val = PublishPacket.createFromPacket(basePacket)
  if (not pubPacket.isValid()) then
    Debug.err("Invalid packet in " + __loc.file() + ":" +__loc.method_name())
    return
  end  

  try
    var topic : String val = pubPacket.topic() as String val         // A valid Publish will always have a topic   
    var subscriber = _subscriberByTopic(topic)?                      // If we can't find a subscriber then we've been assigned a topic
    if (pubPacket.qos() is Qos0 ) then                               // QoS 0 has no id so there is no map entry, just fire and forget 
      subscriber.onData(basePacket)
      return
    end
    
    if ((_subscriberByBid.contains(pubPacket.id() as IdType))) then  //If the Broker has sent a duplicate id we can't proceed
      Debug.err("Found duplicate id " + pubPacket.id().string() +" in " + __loc.file())
      return
    end

    _subscriberByBid.update(pubPacket.id() as IdType, subscriber)    // Now we can link our unique bid to the subscriber
    subscriber.onData(basePacket)                                    // we could combine this with the .onData above but that risks
  else                                                               // a subsequent packet before the subscriber is in the map   
     _doAssignedSubscription(basePacket)                             // Could be because of a restored session 
  end  

/********************************************************************************/
fun _findPayloadById(basePacket : BasePacket val) =>
  """
  We search the payload map by Bid to find the subscriber who is working this Bid.
  """ 
  try 
    _subscriberByBid(BytesToU16(basePacket.data().trim(2,4)))?.onData(basePacket)
  else
    Debug.err("Couldn't match Bid and payload at " + __loc.file() + ":" +__loc.method_name() + " This could be a re-transmission of a PubRel")
    Debug.err(basePacket.controlType().string() + " with id " + BytesToU16(basePacket.data().trim(2,4)).string())
  end


/********************************************************************************/
fun ref _doAssignedSubscription(basePacket : BasePacket val) =>
  """
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
  point in the _cleanup process

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
  """ 

  var publishPacket : PublishPacket val = PublishPacket.createFromPacket(basePacket)
  if (not publishPacket.isValid()) then
    Debug.err("Invalid packet found at " + __loc.file() + ":" +__loc.method_name())
    return
  end  

  var topic : String val = ""
  try 
    topic = publishPacket.topic() as String val
    //Debug.err("Assigned subscription to " + topic)
    var subscriber : Subscriber = Subscriber(this, topic, publishPacket.qos())
    _subscriberByTopic.update(topic, subscriber)
    // now we route it again (synchronously), safe in the knowledge that there is a subscriber waiting
    //to provide the acks and that the base packet still contains the original Broker id
    route(basePacket)
  else
    Debug.err("Got an assigned Publish topic (!) and couldn't create subscriber at " + __loc.file() + ":" +__loc.method_name())
  end


/*********************************************************************************/
be onPayloadComplete(bid: IdType) =>
  """
  Called by a subscriber when it has completed processing of an incomming message
  This tells router to remove the link between the Bid and the subscriber.
  Note - This is called as the final step of an **incomming** message so it should 
  always receive a Bid and the Bid was issued by the Broker and should not be
  checked-in
  """
  try
    _subscriberByBid.remove(bid)?
    //Debug.err("Removing Broker id " + bid.string() + " from _subscriberByBid at " + __loc.file() + ":" +__loc.method_name())
  else
    Debug.err("Router can't remove Broker id " + bid.string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end  

/*********************************************************************************/
/*****************   Functions for outgoing Publish messages   *******************/
/*********************************************************************************/
be onPublish(topic : String val, payload : Array[U8] val, qos : Qos) =>
  """
  Called by the MQTT actor to publish payload on topic. Requires a Client allocated
  id (Cid). So _actorById is indexed by Cid. 
  TODO - During dev we have a QoS0 check but this can be removed later
  """
  if (qos is Qos0) then 
    Debug.err("Error sending QoS 0 publication found in  " + __loc.file() + ":" +__loc.method_name())
  end
  
  var pub : Publisher
  try
    pub = _publisherByTopic(topic)? 
  else
    pub = Publisher(this, topic)
    _publisherByTopic.insert(topic, pub)
  end

  // link the id and publisher so we can trace the acks
  var cid : IdType = _idIssuer.checkOut()
  _actorById.update(cid,pub)
 
  // create the publish args
  var args: PublishArgs val = PublishArgs(where topic' = topic, payload' = payload, cid' = cid)
  pub.publish(args)

/*********************************************************************************/
be onPublishQos0(topic : String val, payload : Array[U8] val) =>
  """
  Called by a publisher to publish a QoS 0 packet on topic. Because there is no id and 
  ack processing we don't create a publisher actor for Qos0
  """
  send(PublishPacket.compose(PublishArgs(topic,payload)))


/*********************************************************************************/
be onPublishComplete(id: IdType) =>
  """
  Called by a publisher when an id has completed its processing. This tells router
  to remove the link between the id and the publisher. Note that QoS0 packets never
  get into the _actorById map and do not result in a call to onPublishComplete
  """
  _idIssuer.checkIn(id)
  try
    _actorById.remove(id)?
  end  

/*********************************************************************************/
/*******************   Functions for Subscribe/Unsubscribe    ********************/
/*********************************************************************************/
be onSubscribe(topic: String, qos: Qos) =>
  """
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
  """

  if (_subscriberByTopic.contains(topic)) then return end
  
  var sub : Subscriber = Subscriber(this, topic, qos)
  _subscriberByTopic.update(topic, sub)

  var cid : IdType = _idIssuer.checkOut()
  _actorById.update(cid,sub)
    
  sub.subscribe(cid)

/*********************************************************************************/
be onSubscribeComplete(sub : Subscriber tag, topic: String val, id : IdType, msg: String val, approvedQos : (String val | None)) =>
  """
  Called by a subscriber to indicate that it has received a SubAck and so has finished
  processing its subscribe request. Subscribers can subscribe and unsubscribe 
  repeatedly throughout their lifetime but always to the same topic.
  We only get the Cid back from the Broker so we need to do a look-up to find the
  subscriber whose subscription processing has been completed.
  TODO - If accepted is false then remove the subscriber from the _subscriberByTopic
  map because we got a rejection (See comment to onSubscribe)
  """
  // If we were rejected then remove the preemptive insertion of subcriber into the
  //subscriberByTopic map
  if (approvedQos is None) then _removeSubscriber(sub) end

  try
    _actorById.remove(id)? // always do this because the transaction is complete 
  else
    Debug.err("Router can't remove id " + id.string() + " from subscriber map at " + __loc.file() + ":" +__loc.method_name())
  end  
  // Whatever, we've finished with the id
    _idIssuer.checkIn(id)
    
  // Tell the Mqtt actor that we have finished subscribing  
  _mqtt.onSubscribed(topic, approvedQos)  
  onMessage(topic, msg.array())  

/*********************************************************************************/
be onUnsubscribe(topic : String val) =>
  """
  Called by the mqtt actor to unsubscribe to a topic. Subscribers can subscribe and
  unsubscribe repeatedly throughout their lifetime. An unsubscribed subscriber is
  still alive but does not appear in the router's subscriber map  
  Note - The spec states that clients must continue to acknowledge messages until
  an unsub request has been acknowledged - therefore we don't remove the subscriber
  here, only in the onUnsubAck behaviour
  """
  try 
    var sub = _subscriberByTopic(topic)?
    var cid = _idIssuer.checkOut()
    _actorById.update(cid,sub)
    sub.unsubscribe(cid)
  end

/*********************************************************************************/
be onUnsubscribeComplete(sub : Subscriber tag, id : IdType) =>
  """
  Called by a Subscriber when the subscriber has got confirmation that its Unsubscribe
  request has been acknowledged by the Broker. The id is a Cid because the Unsubscribe
  message can only be generated by the client. 
  At this point, router can remove the entry for the topic from the subscriberByTopic 
  map and remove the id from the subscriberById map and check-in the id.
  TODO - Note that this implies only **one subscriber per topic**
  """

  try
    _actorById.remove(id)?
    //Debug.err("Removing id " + id.string() + " from _actorById at " + __loc.file() + ":" +__loc.method_name())
  else
    Debug.err("Router can't remove id " + id.string() + " at " + __loc.file() + ":" +__loc.method_name())
  end  

  // Whatever, we've finished with the id
  _idIssuer.checkIn(id)


  _removeSubscriber(sub)
   //Debug.err("Completed processing unsubscribe with id " + id.string())

/*********************************************************************************/
fun ref _removeSubscriber(sub : Subscriber tag) =>
  """
  This function enables us to do a reverse lookup on the _subscriberByTopic map to
  determine which subscriber has been subscribed to or unsubscriber from. We need it 
  to remove a subscriber from the map in the event that it unsubscribes  
  """
  for (key, subscriber) in _subscriberByTopic.pairs() do 
    if (subscriber is sub) then 
      try 
        _subscriberByTopic.remove(key)?
      else
        Debug.err("Router couldn't remove subscriber to topic: " + key + " at " + __loc.file() + ":" +__loc.method_name())
      end 
      return
    end
  end


/*********************************************************************************/
/*******************   KeepAlive and Tick functions    ***************************/
/*********************************************************************************/
be onTick(sec : I64) =>
  """
  OnTick is called on every system tick by Ticker. Router then calls all of the
  Publishers and Subscribers who have transactions in-flight. Publishers and 
  Subscribers that don't have transactions in-flight don't need to be notified
  because they have no in-flight messages to time-out 
  """
  for mqActor in _actorById.values() do
    mqActor.onTick(sec)
  end


/*********************************************************************************/
be doPing() =>
  """
  Ask the Broker for a pingResp and debit the number of times we have asked without
  a response. If we have asked three times with no response then assume the broker
  has gone away and start the clean-up process.  
  We also send a disconnect packet just in case the Broker comes back in the meantime
  and wonders where we are.
  """
  send(PingReqPacket.compose())
  _pingTokenCount = _pingTokenCount - 1
  if (_pingTokenCount == 0) then // The Broker has missed three pings - time to quit
    onStatus("Broker has missed three pings - quitting")
    disconnectBroker()
  end  

/*********************************************************************************/
fun ref _onPingResp() =>
  """
  When the broker responds to a ping response we credit the token count. This value 
  is debited by doPing() each time we ask for a ping and we quit when it reaches zero.
  TODO - Add a _pingTokenCount increment on mesage activity otherwise we could reach
  zero if ping messages get queued 
  """
  if (_pingTokenCount < 3) then _pingTokenCount = _pingTokenCount + 1 end

/*********************************************************************************/
/*******************   Connect and Disconnect functions    ************************/
/*********************************************************************************/
be onTcpConnect(tcp : TCPConnection) =>
  """
    Once we know that we have a TCP connection we can safely start the Connector 
    actor to ask the Broker for a session. The reponse (a CONNACK) will return 
    via a call to our .route behaviour from assemblr
  """
    _connector.connect(_config)
    _tcpMaybe = tcp   


/*********************************************************************************/
be onBrokerConnect() =>
  """
  When this is called we should have a valid Broker connection with our local 
  state reflecting the (potentially saved) state in Broker.
  """
  onStatus("Broker connected")
  _mqtt.onConnection(true)

  _pinger = Pinger(this, 3/* seconds delay*/)

/*********************************************************************************/
be onBrokerRestore() =>
  """
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
  """
  _cleanSession = false
  onStatus("Got a Session is present flag")
  // 1.
  // resend unacknowledged PUBLISH Packets (where QoS > 0) 
  // we will get back PubAck messages for which we have no publisher yet
  // resend and PUBREL Packets using their original Packet Identifiers
  // we will get back PubComp messages for which we have no publisher yet

  // 2.
  // we will get Publish messages for which we have no subscriber but these will be
  // picked-up as assigned subscriptions

  onBrokerConnect()


/*********************************************************************************/
be onBrokerStateNotFound() =>
  """
  This behaviour is called by connector if the Broker has accepted a connection with
  CleanSession = 0 and but **cannot find a saved session for this client**. In this event
  we must inform the app and await further instructions.   
  TODO - Add main method for handling session not found?
  """
  onStatus("Session restoration requested but Broker has no saved session at " + __loc.file() + ":" +__loc.method_name())
  // TODO - Drop saved state here

  _cleanSession = true


/*********************************************************************************/
be onBrokerRefusal(reason : ConnAckReturnCode) =>
  """
  Called by Connector if the Broker has refused the connection
  """
  onStatus(ConnectionRefused.string() + " " + reason.string())
  _mqtt.onConnection(false)


/*********************************************************************************/
be onTCPDisconnect(errorCode : ErrorCode) =>
  """
    Called if the TCP connection is closed in client
  """
  Debug.err("TCP Disconnect: " + errorCode.string() + " at " + __loc.file() + ":" +__loc.method_name())
  _cleanup()

/*********************************************************************************/
be disconnectBroker() =>
  """
  Most of the disconnect work is done by the Mqtt actor now. We'll keep this in just
  in case there is more to do later (e.g. saving state).
  Note that the tcp client calls _cleanup when it has disconnected so don't call it here
  """
  send(DisconnectPacket.compose())
  cancelKeepAlive()
  // client calls _cleanup when it has disconnected so don't call it here

/*********************************************************************************/
fun ref _cleanup() =>
  _tcpMaybe = None

  if (not _cleanSession) then
    onStatus("Saving session")
    saveState()
  end  

  _subscriberByTopic.clear()
  _subscriberByBid.clear()
  _publisherByTopic.clear()
  _actorById.clear()
  Debug.err("router exiting at " + __loc.file() + ":" +__loc.method_name())
  _mqtt.onConnection(false)
/*********************************************************************************/
be cancelKeepAlive() =>
  """
  We make this a behaviour so that main can cancel it in the event of an error. Otherwise
  router can terminate but leave pinger pinging - which means the process won't terminate.
  """
    try (_pinger as Pinger).cancel() end


/*********************************************************************************/
fun saveState() =>
  """
  Called when we have lost connection with the Broker and need to save our state in
  the sure and certain hope of the ressurection
  """

  for (topic, subscriber) in _subscriberByTopic.pairs() do 
    onStatus("Saving subscription" + topic)
    subscriber.onDuckAndCover()
  end

  for (id, mqActor) in _actorById.pairs() do 
    try 
      var publisher : Publisher = mqActor as Publisher
      Debug.err("Saving Publish state for publisher id " + id.string())
      publisher.onDuckAndCover()
    end
    

  end

/*********************************************************************************/
/**********************   Sending to other Actors    *****************************/
/*********************************************************************************/
be send(data : ArrayVal) =>
  """
  Check the TCP connection is valid and use it to send our packet
  """
  try
    var tcp : TCPConnection 
    tcp = _tcpMaybe as TCPConnection
    tcp.write(data)
  else
    onStatus("Writing to invalid socket at " + __loc.file() + ":" +__loc.method_name() + " line " +  __loc.line().string())  
  end      

/*********************************************************************************/
be onMessage(s1 : String val, s2 : Array[U8] val) =>
  """
  The final message release behaviour that send the broker message to the client 
  application.
  """
  _mqtt.onMessage(s1,s2)

/*********************************************************************************/
be onStatus(status : String val) =>
  """
  Provides an out of band channel for the library functions to notify the app of 
  staus or anything else that is not a broker message
  """
  _mqtt.onStatus(status)

/*********************************************************************************/
/*********************************************************************************/
/*************   These mock broker functions are for dev testing only   **********/
/*********************************************************************************/
/*********************************************************************************/
fun onControlConnect(basePacket : BasePacket val) =>
  """
  Mock Broker - for testing only
  """
  Debug.err("Mock Broker got a " + basePacket.controlType().string() + " at " + __loc.file() + ":" +__loc.method_name())
  let connack : ArrayVal = [32; 2; 0; 0]
  Debug.err("Mock Broker sending " )
  Debug(connack where stream = DebugErr)
  send(connack)

/*********************************************************************************/
fun ref onControlSubscribe(basePacket : BasePacket val)  => 
  """
  Mock Broker - for testing only
  """
  var subscribePacket = SubscribePacket.createFromPacket(basePacket)
  if (subscribePacket.isValid()) then
    let subAck : Array[U8] iso = [144; 3] // ; 0; 1; 0]
    subAck.append(basePacket.data().trim(2,4))
    subAck.push_u8(0)
   send(consume subAck)
  else  
    Debug.err(basePacket.controlType().string())
  end

/*********************************************************************************/
fun onControlUnsubscribe(basePacket : BasePacket val) =>
  """
  Mock Broker - for testing only
  """
  Debug.err(basePacket.controlType().string())
/*********************************************************************************/
fun onControlPingReq(basePacket : BasePacket val) =>
  """
  Mock Broker - for testing only
  """
  let pingResp : ArrayVal = [208; 0]
  send(pingResp)
  
/*********************************************************************************/
fun onControlDisconnect(basePacket : BasePacket val) =>
  """
  Mock Broker - for testing only
  """
  Debug.err("Mock Broker got " + basePacket.controlType().string())



