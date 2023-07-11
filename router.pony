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

  let _subscriberByTopic : SubscriberMap = SubscriberMap
  let _subscriberById : IdMap = IdMap
  let _publisherById : PublicationMap = PublicationMap

  let _subscriptions :  Map[String val, String val] val
  let _config :  Map[String val, String val] val

  var _brokerConnected : Bool = false

  var _tcpMaybe : (TCPConnection | None) = None

  new create(reg : Registrar, config :  Map[String val, String val] val, subs :  Map[String val, String val] val) =>
    _reg = reg
    _config = config
    _subscriptions = subs
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

    // This should be all of the incomming packet types.
    // TODO - Subtype to remove duplication 
    match basePacket.controlType()
      | ControlPublish => _findSubscriberByTopic(basePacket)  // goes to subscriber but may not have an id so find by topic
      | ControlPubRel  => _findSubscriberById(basePacket) // goes to subscriber and has id at bytes 2 and 3 
      | ControlUnsubAck => _findSubscriberById(basePacket) // goes to subscriber and has id at bytes 2 and 3
      | ControlPubAck => _findPublisherById(basePacket) //  PubAck, PubRec, PubComp goes to publisher 
      | ControlPubRec => _findPublisherById(basePacket) // PubAck, PubRec, PubComp goes to publisher 
      | ControlPubComp => _findPublisherById(basePacket) // PubAck, PubRec, PubComp goes to publisher 
      | ControlSubAck => _findSubscriberById(basePacket) // Note: We are not implementing multisubscribe 
      | ControlPingResp => _onPingResp() 
      | ControlConnAck => _connector.onAck(basePacket)
    else
      Debug("Shouldn't get to " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
    end

/*********************************************************************************/
fun ref _findSubscriberByTopic(basePacket : BasePacket val) =>
  """
  Process a Publish Packet and route to the appropriate subscriber. All publish packets
  have a topic and this is how we locate the subscriber. There is always a 1:1 mapping
  between topics and subscribers (at least in spec 3.1)  
  Note - From the specification: 
  The Client and Server assign Packet Identifiers independently of each other. As a result,
  Client Server pairs can participate in concurrent message exchanges using the same Packet
  Identifiers. It is possible for a Client to send a PUBLISH Packet with Packet 
  Identifier 0x1234 and then receive a different PUBLISH with Packet Identifier 0x1234
  from its Server before it receives a PUBACK for the PUBLISH that it sent.
  So - our outgoing publish with Id=3 is not the same as an incomming publish with id =3
  but this is OK because we are using the incomming id as a key into a subscriber map.
  We will have a separate publisher map to keep track of outgoing ids
  """     
  
  var pubPacket : PublishPacket val = PublishPacket.createFromPacket(basePacket)
  var topicOrNone : (String val | None) = pubPacket.topic()  // Publish will always have a topic
  var idOrNone : (IdType | None) = pubPacket.id()  //PublishPacket will return None for QoS 0

  try
    var topic : String val = topicOrNone as String val
    _subscriberByTopic(topic)?.onData(basePacket)
  else 
    Debug("Can't match topic and subscriber at" + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end

  try
    // The subscriber to this topic is now working another id. The old id may not be finished with 
    // yet so we just add the new one (as long as it is not QoS 0)
    _subscriberById.update(idOrNone as IdType,_subscriberByTopic(topicOrNone as String val)?)    // Fail silently for QoS 0 where id = None
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
fun _onPingResp() =>
  None
  //Debug("Got Ping reponse")

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
be onSubscribeComplete(id: IdType) =>
  """
  Called by a subscriber when an id has completed its processing. This tells router
  to remove the link between the id and the subscriber
  """
  try
    _subscriberById.remove(id)?
    _issuer.checkIn(id)
    Debug("Completed processing subscription id " + id.string())
  else
    Debug("Router can't remove id " + id.string() + "at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
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
    Debug("Completed processing publish id " + id.string())
  else
    Debug("Router can't remove id " + id.string() + "at " + __loc.file() + ":" +__loc.method_name() + " line " + __loc.line().string())
  end  

/*********************************************************************************/
be doPing() =>
  send(PingReqPacket.compose())


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
  state reflecting the (potentially saved) state in Broker. So we can:
  1. Spawn the set of initial subscribe actors that we got from the config.ini file (what seems like 
  a long time ago)
  2. Add the initial Subscribers to the _subscriberByTopic map as tags as they are created
  3. Tell Main that we have a Broker ready to receive Publish messsages
  """

    for (topic , qos) in _subscriptions.pairs() do 
      var subscriber : Subscriber = Subscriber(_reg, this, topic, qos)
      _subscriberByTopic.update(topic, subscriber)
      var promise = _reg[IdIssuer tag](KeyIssuer())  // a promise to return a IdIssuer tag
      promise.next[None](
        {(issuer) => 
          issuer.checkOut(subscriber)
        })
    end

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
  """
    _subscriberById.update(id,sub)
    _subscriberByTopic.update(topic, sub)
    send(packet)

/*********************************************************************************/
be onPublish(pub : Publisher tag, topic: String, id : U16, packet : ArrayVal) =>
  """
  Called by a publisher to publish packet on topic. Comes through router so we have
  a central register of all publishers 
  """
    _publisherById.update(id,pub)
    //Debug("Publishing id " + id.string())
    send(packet)

/*********************************************************************************/
be disconnectBroker() =>
  """
  This is called to disconnect cleanly from the Broker. DISCONNECT must be the last
  message sent by the client to the server. The client must close the TCP connection
  after sending DISCONNECT (so any clean-up from there on must be independent of the
  network)
  """
  Debug("Disconnecting Broker")
    // TODO -  
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


