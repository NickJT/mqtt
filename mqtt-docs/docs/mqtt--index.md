# Pony MQTT Client #

A MQTT 3.1.1 client - supports QoS 0/1/2 cleansession only. Currently part-way through release 0.2 (see package doc).

If you haven't used Pony, this is the best starting point -> [Pony Tutorial](https://tutorial.ponylang.io/index.html)

## How to Run ##

main.pony is a minimal example of an actor implementing the MqttApplication trait to connect, subscribe, publish and disconnect from an MQTT broker.

The broker address and user credentials can be configured in config.ini. If no config.ini is provided the app will attempt an anonymous connection to localhost:1883.

Main will connect to the broker, subscribe to one of its system topics and to an example application topic. It will then publish ten timestamp messages before disconnecting and quiting.



## Public Types

* [actor Main](mqtt-Main.md)
