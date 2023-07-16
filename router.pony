/** use **/
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
type IdMap is Map[U16, Subscriber tag]
  """
  A map of subscribers keyed by the id of the message they are processing. We need 
  this because ack messages don't contain topic
  """

/********************************************************************************/
type SubscriberMap is Map[String, Subscriber tag]
  """
  A map of subscribers keyed by the topic to which they are subscribed
  """

/********************************************************************************/
type PublicationMap is Map[IdType, Publisher tag]
  """
  A map of publications in progress and which publisher owns them. This is needed
  because the Ack protocol messages are keyed by id and don't contain topic
  """

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

  let _subscriberByTopic : SubscriberMap = SubscriberMap
  let _subscriberById : IdMap = IdMap
  let _publisherById : PublicationMap = PublicationMap

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
    
    Debug("Router got a " + basePacket.controlType().string())
    //Debug(basePacket.data())

    // Currently including the broker packets so we can use the same actor 
    // to mock a broker for testing
    match basePacket.controlType()
      | ControlConnAck => _connector.onAck(basePacket)
      | ControlPublish => _findSubscriberByTopic(basePacket)  // goes to subscriber but may not have an id so find by topic
      | ControlPubAck => _findPublisherById(basePacket) //  PubAck, PubRec, PubComp goes to publisher 
      | ControlPubRec => _findPublisherById(basePacket) // PubAck, PubRec, PubComp goes to publisher 
      | ControlPubRel  => _findSubscriberById(basePacket) // goes to subscriber and has id at bytes 2 and 3 
      | ControlPubComp => _findPublisherById(basePacket) // PubAck, PubRec, PubComp goes to publisher 
      | ControlSubAck => _findSubscriberById(basePacket) // Note: We are not implementing multisubscribe 
      | ControlUnsubAck => _findSubscriberById(basePacket) // goes to subscriber and has id at bytes 2 and 3
      | ControlPingResp => _onPingResp() 
      /*   BROKER PACKETS FOR TESTING ONLY  */
      | ControlConnect => onControlConnect(basePacket)
      | ControlSubscribe => onControlSubscribe(basePacket)
      | ControlUnsubscribe => onControlUnsubscribe(basePacket)
      | ControlPingReq => onControlPingReq(basePacket)
      | ControlDisconnect => onControlDisconnect(basePacket)
      /*   BROKER PACKETS FOR TESTING ONLY  */
    else
      Debug("Shouldn't get to " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    end

/*********************************************************************************/
fun ref _findSubscriberByTopic(basePacket : BasePacket val) =>
  """
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
  """     

  
  var pubPacket : PublishPacket val = PublishPacket.createFromPacket(basePacket)
  if (not pubPacket.isValid()) then
    Debug("Invalid packet found at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    return
  end  

  var topicOrNone : (String val | None) = pubPacket.topic()  // Publish will always have a topic
  var idOrNone : (IdType | None) = pubPacket.id()  //PublishPacket will return None for QoS 0
  
  try
    var topic : String val = topicOrNone as String val
    var subscriber = _subscriberByTopic(topic)?
    subscriber.onData(basePacket)
    if (pubPacket.qos() is Qos0 ) then return end 
    var id = idOrNone as IdType
    _subscriberById.insert(id, subscriber)
   else 
    Debug("Found an assigned subscription at" + __loc.file() + ":" +__loc.method_name())
    // either we have been assigned a topic by the Broker, or we are Mock Broker and our client has published a message
    _doAssignedSubscription(basePacket)
    return
  end

 
/********************************************************************************/
fun _findSubscriberById(basePacket : BasePacket val) =>
  """
  Get the packet id from a PubAck, PubRel, PubRec, PubComp and UnsubAck packets. For
  these packet types the RL field is always one byte (=0x02) and the id bytes are
  always in bytes 2 and 3.
  Because we are not implementing multi-subscriber the suback id will also be in 
  bytes 2 and 3.
  We search the subscriber map by Id to find the subscriber who is working this id.
  """ 
  try 
    _subscriberById(BytesToU16(basePacket.data().trim(2,4)))?.onData(basePacket)
  else
    Debug("Couldn't match id and subscriber at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    Debug("Id was " + BytesToU16(basePacket.data().trim(2,4)).string())
  end


/********************************************************************************/
fun ref _doAssignedSubscription(basePacket : BasePacket val) =>
  """
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
    //to provide the acks
    route(basePacket)
  else
    Debug("Got a Publish topic and couldn't create subscriber at " + __loc.file() + ":" +__loc.method_name())
  end


/*********************************************************************************/
be onPayloadComplete(id: IdType) =>

  """
  Called by a subscriber when it has completed processing of an incomming message
  This tells router to remove the link between the id and the subscriber.
  Note - This is called as the final step of an *incomming* message so the id was
  issued by the Broker and should not be checked-in
  """
  try
    _subscriberById.remove(id)?
    Debug("Completed processing payload with id " + id.string())
  else
    Debug("Router can't remove id " + id.string() + " at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end  

/*********************************************************************************/
fun saveState() =>
  """
  Called when we have lost connection with the Broker and need to save our state in
  the sure and certain hope of a ressurection
  """
  Debug("Save state not implemented at " + __loc.file() + ":" +__loc.method_name())

/*********************************************************************************/
fun ref _onPingResp() =>
  """
  When the broker responds to a ping response we credit the token count. This value 
  is debited by doPing() each time we ask for a ping and we quit when it reaches zero.
  """
  _pingTokenCount = _pingTokenCount + 1
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
be onTick(sec : I64) =>
  """
  OnTick is called on every system tick by Ticker. Router then calls the onTick
  behaviour on each of the publishers and subscribers in its maps.
  """
  //Debug("-> " + sec.string())
  for subscriber in _subscriberByTopic.values() do
    subscriber.onTick(sec)
  end

/*********************************************************************************/
be onPublish(pub : Publisher tag, topic: String, id : U16, packet : ArrayVal) =>
  """
  Called by a publisher to publish packet on topic. Comes through the router so we
  have a central register of all publishers 
  """
    _publisherById.update(id,pub)
    Debug("Publishing on topic : " + topic + " with id " + id.string() + " in " + __loc.file() + ":" +__loc.method_name())
    send(packet)


/*********************************************************************************/
fun _findPublisherById(basePacket : BasePacket val) =>
  """
  Get the packet id from a PubAck, PubRel or PubComp and search the publisher map by Id
  to find the publisher who is working this id.
  """ 
  try 
    _publisherById(BytesToU16(basePacket.data().trim(2,4)))?.onData(basePacket)
  else
    Debug("Couldn't match id and subscriber at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    Debug("Id was " + BytesToU16(basePacket.data().trim(2,4)).string())
  end


/*********************************************************************************/
be onPublishComplete(id: IdType) =>
  """
  Called by a publisher when an id has completed its processing. This tells router
  to remove the link between the id and the publisher
  """
  try
    _publisherById.remove(id)?
    _issuer.checkIn(id)
    Debug("Completed processing publish id " + id.string() + " in " + __loc.file() + ":" +__loc.method_name())
  else
    Debug("Router can't remove id " + id.string() + "at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end  

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
be onSubscribe(sub : Subscriber tag, topic: String, id : U16, packet : ArrayVal) =>
  """
  Called by a subscriber to subscribe to a new topic. Comes through router so we have
  a central register of who is subscribed to what 
  TODO - Decide what to do if we already have a subscription for that topic
  """
    _subscriberById.update(id,sub)
    _subscriberByTopic.update(topic, sub)
    send(packet)

/*********************************************************************************/
be onSubscribeComplete(id : IdType) =>
  """
  Called by a subscriber to subscribe to its topic. Subscribers can subscribe and
  unsubscribe repeatedly throughout their lifetime but always to the same topic.
  We only get the id back from the Broker so we need to do a look-up to find the
  subscriber whose subscription has been accepted (or rejected)
  TODO - Clean-up if the subscription is rejected
  """
  try
    _subscriberById.remove(id)?
    Debug("Completed processing subscription id " + id.string())
  else
    Debug("Router can't remove id " + id.string() + " from subscriber map at " + __loc.file() + ":" +__loc.method_name())
  end  
  // Whatever, we've finished with the id
  _issuer.checkIn(id)

/*********************************************************************************/
be onUnsubscribe(sub : Subscriber tag, id : U16, packet : ArrayVal) =>
  """
  Called by a subscriber to unsubscribe to a topic. Subscribers can subscribe and
  unsubscribe repeatedly throughout their lifetime. An unsubscribed subscriber is
  still alive but does not appear in the router's subscriber map  
  """
    _subscriberById.update(id,sub)
    send(packet)


/*********************************************************************************/
be onUnsubscribeComplete(id : IdType) =>
  """
  Called by a Subscriber when the subscriber has got confirmation that its Unsubscribe
  request has been acknowledged by the Broker. At this point, router can remove the entry
  for the topic from the subscriberByTopic map and remove the id from the subscriberById
  map and check-in the id.
  """

  var topic : String val = ""
  try
    var subscriberToRemove = _subscriberById(id)?
    for (key, subscriber) in _subscriberByTopic.pairs() do 
      if (subscriber is subscriberToRemove) then 
        topic = key
      end
    end
  else
    Debug("Router can't find subscriber with id of " + id.string() + " to remove at " + __loc.file() + ":" +__loc.method_name())
  end 

  try
    _subscriberById.remove(id)?
    _subscriberByTopic.remove(topic)?
    Debug("Completed processing unsubscription id " + id.string())
  else
    Debug("Router can't remove id " + id.string() + "or topic " + topic + " at " + __loc.file() + ":" +__loc.method_name())
  end  
  // Whatever, we've finished with the id
  _issuer.checkIn(id)


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
/*************   These mock broker functions are for dev testing only   **********/
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



