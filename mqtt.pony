actor MqttClient 
"""
Provides message access to the MQTT broker identified in config.ini or, if no config.ini can be
found, to localhost:1883.
"""
  new create() =>
    None

  be connect(cb : {(String val)} iso) =>
    """
    Connect to the Broker initialised during instantiation. Takes a callback that is called when
    the Broker is ready to accept subscribe and publish messages or if the Broker connection does
    not succeed.
    """
    None

  be disconnect() =>
    """
    Gracefully disconnect from the Broker so that the last will and testament message is not sent. If
    disconnect is not called before the Mqtt actor terminates the Broker will send the LW&T message as
    configured in config.ini.
    """
    None   

  be publish(topic : String val, qos : String val, payload : Array[U8] val ) =>
    """
    Publish the payload on the passed topic with the passed QoS. 
    """
    None

  be subscribe(topic : String val, qos : String val, cb : {(String val,String val)} iso ) =>
    """
    Subscribe to the passed topic, requesting messages be returned with the passed qos. Takes a callback
    that is called with optic and payload when a message is received.
    """
    None
