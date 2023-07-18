---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
/** use **/
  use "assert"
  use "bureaucracy"
  use "collections"
  use "debug"
  use "net"

  use "assembler"
  use "connector"
  use "idIssuer"
  use "primitives"
  use "pinger"
  use "publisher"
  use "subscriber"
  use "ticker"
  use "utilities"


  /********************************************************************************/
  trait MqActor 
  """
  This type def allows us to combine publishers and subscribers into one map of open
  transactions. The map is indexed by client allocated id (cid) and cids are unique 
  while checked-out so we know that we can't have clashing cids even if an actor 
  has multiple transactions underway. A transaction finishing is denoted by the 
  removal of the actor from the map and **then** the check-in of the cid. 
  TODO - consider whether we need to add some safeguards for this (e.g. a single
  router private function that atomically removes first and then checks-in)
  """
  be onData(basePacket : BasePacket val) 
  be onTick(sec : I64)


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

  Registrar usage  
  - Router adds IdIssuer actor that issues ids to other actors
  - Router adds the pinger actor that sends pingreq messages 
  """
  let _reg : Registrar
  let _issuer : IdIssuer
  let _pinger : Pinger
  let _ticker : Ticker
  var _connector : Connector
  var _pingTokens : USize = 3
  var _pingTokenCount : USize = _pingTokens

  let _subscriberByTopic : Map[String val, Subscriber tag ] = Map[String val, Subscriber tag ]
  
  let _subscriberByBid : Map[IdType, Subscriber tag] = Map[IdType, Subscriber tag]
  """
  _subscriberByBid tracks the incomming publish messages by the Broker Id (bid) 
  and their incomming and outgoing acks
  """

  let _actorById : Map[IdType, MqActor tag] = Map[IdType, MqActor tag] 
  """
  _actorById tracks the outgoing messages and their incomming and outgoing acks 
  """

  let _config :  Map[String val, String val] val

  var _tcpMaybe : (TCPConnection | None) = None

  new create(reg : Registrar, config :  Map[String val, String val] val) =>
    _reg = reg
    _config = config
    _connector = Connector(this)
    _issuer = IdIssuer
    _reg.update(KeyIssuer(), _issuer)
    
    // The keepalive Pinger is currenty limited so that we disconnect
    // cleanly during testing. Pinger responds via _reg
    _pinger = Pinger(_reg, 5/* seconds delay*/, 50/*repetitions*/)
    _reg.update(KeyPinger(), _pinger)

    // System tick calls onTick every second. Tciker responds without going through 
    // reg for comparison with pinger.
    // TODO - Decide on best approach to router callbacks
    _ticker = Ticker(this)


/*********************************************************************************/
be route(basePacket : BasePacket val) =>
    """
    This function demultiplexes the incomming packet stream according to packet type
    First we deal with Publish because this may or may not have an id. Then we deal with 
    the messages that always have id bytes after a single remaining length byte. These are
    ControlPubAck, ControlPubRec, ControlPubRel, ControlPubComp and ControlUnsubAck. 
    Finally there are specific types which don't have packet ids. These are CONNECT,
    CONNACK, PINGRESP, PINGREQ and DISCONNECT but only CONNACK and PINGRESP are valid
    in this context because CONNECT has already been taken care of and PINGREQ and
    DISCONNECT are outgoing messages (i.e. client to broker).  
  
    """
    if (basePacket.isNotValid()) then
      Debug("Router got an invalid packet at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
      return
    end
    
    //Debug("Router got a " + basePacket.controlType().string())
    //Debug(basePacket.data())

    // Currently including the broker packets so we can use the same actor 
    // to mock a broker for testing
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
      Debug("Shouldn't get to " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
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
    Debug("Couldn't match id and subscriber at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    Debug(basePacket.controlType().string() + " with id " + BytesToU16(basePacket.data().trim(2,4)).string())
  end

/*********************************************************************************/
/*******************   Functions for incomming Payloads   ************************/
/*********************************************************************************/
fun ref _xfindSubscriberByTopic(basePacket : BasePacket val) =>
  var pubPacket : PublishPacket val = PublishPacket.createFromPacket(basePacket)
  if (not pubPacket.isValid()) then
    Debug("Invalid packet found at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    return
  end  

  try
    var topic : String val = pubPacket.topic() as String val         // A valid Publish will always have a topic
    var subscriber = _subscriberByTopic(topic)?                      // If we can't find a subscriber then we've been assigned a topic
    if (pubPacket.qos() is Qos0 ) then                               // QoS 0 has no id so fire and forget 
      subscriber.onData(basePacket)                                  // (duplication here to save code later)
      return
    end
    
    Assert((_subscriberByBid.contains(pubPacket.id() as IdType) == false),
      "Found duplicate id " + pubPacket.id().string() +" in " + __loc.file())?
    
    _subscriberByBid.update(pubPacket.id() as IdType, subscriber)    // We've done QoS 0 so we should have a unique Broker id
  else                                                               // we must have an assigned subscription 
      _doAssignedSubscription(basePacket)
  end  

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
  """     

  var pubPacket : PublishPacket val = PublishPacket.createFromPacket(basePacket)
  if (not pubPacket.isValid()) then
    Debug("Invalid packet found at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    return
  end  

  var topicOrNone : (String val | None) = pubPacket.topic()  // A valid Publish will always have a topic
  var idOrNone : (IdType | None) = pubPacket.id()  //PublishPacket will return None for QoS 0
  
  try
    var topic : String val = topicOrNone as String val
    var subscriber = _subscriberByTopic(topic)?

    subscriber.onData(basePacket)
    
    if (pubPacket.qos() is Qos0 ) then return end 
    
    var bid = idOrNone as IdType
    
    if (_subscriberByBid.contains(bid)) then 
      Debug("Found duplicate id " + bid.string() +" in _subscriberByBid at" + __loc.file() + ":" +__loc.method_name())
    end
    
    _subscriberByBid.update(bid, subscriber)
    //Debug("Inserted id " + id.string() +" in _subscriberByBid at" + __loc.file() + ":" +__loc.method_name())
  
  else  // We couldn't find a subscriber with this topic so we must have an assigned subscription 
    Debug("Found an assigned subscription at" + __loc.file() + ":" +__loc.method_name())
    // either we have been assigned a topic by the Broker, or we are a Mock Broker and our client has published a message
    _doAssignedSubscription(basePacket)
  end
 
/********************************************************************************/
fun _findPayloadById(basePacket : BasePacket val) =>
  """
  We search the payload map by BId to find the subscriber who is working this Bid.
  _subscriberByBid is indexed by Bid not Cid.
  """ 
  try 
    _subscriberByBid(BytesToU16(basePacket.data().trim(2,4)))?.onData(basePacket)
  else
    Debug("Couldn't match Bid and payload at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    Debug(basePacket.controlType().string() + " with id " + BytesToU16(basePacket.data().trim(2,4)).string())
  end


/********************************************************************************/
fun ref _doAssignedSubscription(basePacket : BasePacket val) =>
  """
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
  """ 

  var publishPacket : PublishPacket val = PublishPacket.createFromPacket(basePacket)
  if (not publishPacket.isValid()) then
    Debug("Invalid packet found at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    return
  end  

  var topic : String val = ""
  try 
    topic = publishPacket.topic() as String val
    var subscriber : Subscriber = Subscriber(_reg, topic, publishPacket.qos().string() )
    _subscriberByTopic.update(topic, subscriber)
    // now we route it again (synchronously), safe in the knowledge that there is a subscriber waiting
    //to provide the acks and that the base packet still contains the original Broker id
    route(basePacket)
  else
    Debug("Got an assigned Publish topic (!) and couldn't create subscriber at " + __loc.file() + ":" +__loc.method_name())
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
    //Debug("Removing Broker id " + bid.string() + " from _subscriberByBid at " + __loc.file() + ":" +__loc.method_name())
  else
    Debug("Router can't remove Broker id " + bid.string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end  

/*********************************************************************************/
/*****************   Functions for outgoing Publish messages   *******************/
/*********************************************************************************/
be onPublish(pub : Publisher tag, topic: String, id : IdType, packet : ArrayVal) =>
  """
  Called by a publisher to publish packet on topic. Comes through the router so we
  have a central register of all publishers. Called with a Client allocated id (Cid).
  So _actorById is indexed by Cid

  """
    _actorById.update(id,pub)
    //Debug("Publishing on topic : " + topic + " with id " + id.string() + " in " + __loc.file() + ":" +__loc.method_name())
    send(packet)


/*********************************************************************************/
be onPublishComplete(id: IdType) =>
  """
  Called by a publisher when an id has completed its processing. This tells router
  to remove the link between the id and the publisher
  """
  try
    _actorById.remove(id)?
    _issuer.checkIn(id)
    //Debug("Completed processing publish id " + id.string() + " in " + __loc.file() + ":" +__loc.method_name())
  else
    Debug("Router can't remove id " + id.string() + "at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end  

/*********************************************************************************/
/*******************   Functions for Subscribe/Unsubscribe    ********************/
/*********************************************************************************/
be onSubscribe(sub : Subscriber tag, topic: String, id : U16, packet : ArrayVal) =>
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
 
  TODO - Decide what to do if we already have a subscription for that topic
  """
    if (_actorById.contains(id)) then 
      Debug("Found duplicate id " + id.string() +" in _actorById at" + __loc.file() + ":" +__loc.method_name())
    end
    _actorById.update(id,sub)
      //Debug("Inserted id " + id.string() +" in _actorById at" + __loc.file() + ":" +__loc.method_name())
    _subscriberByTopic.update(topic, sub)
    send(packet)

/*********************************************************************************/
be onSubscribeComplete(sub : Subscriber tag, id : IdType, accepted : Bool) =>
  """
  Called by a subscriber to indicate that it has received a SubAck and so has finished
  processing its subscribe request. Subscribers can subscribe and unsubscribe 
  repeatedly throughout their lifetime but always to the same topic.
  We only get the Cid back from the Broker so we need to do a look-up to find the
  subscriber whose subscription processing has been completed.
  TODO - If accepted is false then remove the subscriber from the _subscriberByTopic
  map because we got a rejection (See comment to onSubscribe)
  """
  try
    _actorById.remove(id)? // always do this because the transaction is complete 
    //Debug("Removing id " + id.string() + " from _actorById at " + __loc.file() + ":" +__loc.method_name())
  else
    Debug("Router can't remove id " + id.string() + " from subscriber map at " + __loc.file() + ":" +__loc.method_name())
  end  
  // Whatever, we've finished with the id
  _issuer.checkIn(id)

  // If we were rejected then remove the preemptive insertion of subcriber into the
  //subscriberByTopic map
  if (not accepted) then 
    _removeSubscriber(sub)
  end

/*********************************************************************************/
be onUnsubscribe(sub : Subscriber tag, id : IdType, packet : ArrayVal) =>
  """
  Called by a subscriber to unsubscribe to a topic. Subscribers can subscribe and
  unsubscribe repeatedly throughout their lifetime. An unsubscribed subscriber is
  still alive but does not appear in the router's subscriber map  
  Note - The spec states that clients must continue to acknowledge messages until
  an unsub request has been acknowledged - therefore we don't remove the subscriber
  here, only in the onUnsubAck behaviour
  """
    _actorById.update(id,sub)
    //Debug("Inserted id " + id.string() +" in _actorById at" + __loc.file() + ":" +__loc.method_name())
    send(packet)


/*********************************************************************************/
fun ref _removeSubscriber(sub : Subscriber tag) =>
  """
  This function enables us to do a reverse lookup on the _subscriberByTopic map to
  determine which subscriber has been subscribed to or unsubscriber from. We need it 
  to remove a subscriber from the map in the event that it unsubscribes  
  """
  var topic : String val = ""
  for (key, subscriber) in _subscriberByTopic.pairs() do 
    if (subscriber is sub) then 
      topic = key
      break
    end
  end

  try 
    _subscriberByTopic.remove(topic)?
  else
    Debug("Router couldn't remove subscriber to topic: " + topic + " at " + __loc.file() + ":" +__loc.method_name())
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
    //Debug("Removing id " + id.string() + " from _actorById at " + __loc.file() + ":" +__loc.method_name())
  else
    Debug("Router can't remove id " + id.string() + " at " + __loc.file() + ":" +__loc.method_name())
  end  
  // Whatever, we've finished with the id

  _issuer.checkIn(id)
  _removeSubscriber(sub)
   //Debug("Completed processing unsubscribe with id " + id.string())



/*********************************************************************************/
/*******************   KeepAlive and Tick functions    ***************************/
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
    Debug("Broker has missed three pings - quitting")
    disconnectBroker()
  end  

/*********************************************************************************/
fun ref _onPingResp() =>
  """
  When the broker responds to a ping response we credit the token count. This value 
  is debited by doPing() each time we ask for a ping and we quit when it reaches zero.
  """
  _pingTokenCount = _pingTokenCount + 1

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
  state reflecting the (potentially saved) state in Broker. So we cant tell Main
  that we have a Broker ready to receive Publish messsages
  """
  _reg[Main](KeyMain()).next[None]({(m : Main) => m.onBrokerConnect("Broker Connected")},{()=>Debug("No main in registrar")})


/*********************************************************************************/
be onBrokerRestore() =>
  """
  When this is called we should have a valid Broker connection with a saved state in Broker.
  Do the necessary to restore the session then call onBrokerConnect
  """
  Debug("Got a Session is present flag - how do we restore a session??")
  onBrokerConnect()


/*********************************************************************************/
be onBrokerRefusal(reason : ConnAckReturnCode) =>
  """
  Called by Connector if the Broker has refused the connection
  """
  Debug("Router got a refusal - " + reason.string())



/*********************************************************************************/
be disconnectBroker() =>
  """
  This is called to disconnect cleanly from the Broker. DISCONNECT must be the last
  message sent by the client to the server. The client must close the TCP connection
  after sending DISCONNECT (so any clean-up from there on must be independent of the
  network)
  """
  Debug("Disconnecting Broker")
    // TODO - Add disconnect cleanup 
    // dispose all of the pubs and subs from reg
    // stop the ping timer
    // dispose issuer from reg// remove tcp from reg to stop any write attempts
    // remove this from reg
    
  _reg.remove("router", this)
  _pinger.cancel()
  send(DisconnectPacket.compose())

/*********************************************************************************/
fun saveState() =>
  """
  Called when we have lost connection with the Broker and need to save our state in
  the sure and certain hope of a ressurection
  """
  Debug("Save state not implemented at " + __loc.file() + ":" +__loc.method_name())

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
    Debug("Writing to invalid socket at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())  
  end      

/*********************************************************************************/
be sendToMain(s1 : String val, s2 : String val) =>
  _reg[Main](KeyMain()).next[None]({(m: Main)=>m.onMessage(s1, s2)})



/*********************************************************************************/
/*********************************************************************************/
/*************   These mock broker functions are for dev testing only   **********/
/*********************************************************************************/
/*********************************************************************************/
fun onControlConnect(basePacket : BasePacket val) =>
  """
  Mock Broker - for testing only
  """
  Debug("Mock Broker got a " + basePacket.controlType().string() + " at " + __loc.file() + ":" +__loc.method_name())
  let connack : ArrayVal = [32; 2; 0; 0]
  Debug("Mock Broker sending " )
  Debug(connack)
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
    Debug(basePacket.controlType().string())
  end

/*********************************************************************************/
fun onControlUnsubscribe(basePacket : BasePacket val) =>
  """
  Mock Broker - for testing only
  """
  Debug(basePacket.controlType().string())

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
  Debug("Mock Broker got " + basePacket.controlType().string())




```````