# Pony MQTT Client #

A MQTT 3.1.1 client - currently part-way through release 0.1, supporting QoS 0/1/2 but
 not yet implementing session restoration.

If you haven't used Pony, this is the best starting point -> [Pony Tutorial](https://tutorial.ponylang.io/index.html)

## Release Objectives ##

### Release .1 ###

1. 100% coverage of the protocol for happy path with expected i/o.
2. Wide use of guards, debug checks and error tracing
3. Separate classes for each packet type so we don't miss any variations
4. Consistent api to avoid programming errors while things stabiliise
5. No hard split between library and application
6. Simple ui for start/stop

### Release .2 ###

1. Consider edge cases and errors
2. Split code into library and application
3. Consolidate similar classes into factory classes
4. Optimise the api (public: simple, private: efficient)  
5. Remove unnecessary intermediate variable, guards and debug checks
6. Simple text terminal for testing

### Release .3 ###

1. Performance  
2. Load and memory usage  
3. Optimise
4. Build as library
5. Add a simple demo app

## Architecture ##

The architecture of the R.1 is highly decomposed:

1. to help understanding how the protocol works
2. to facilitate perf testing each component later

This is probably not the most effective approach for performance so expect to see components
being consolidated later. The main purpose of each of the packages (in order of typical programe flow) is as follows.

### Main ###

Uses a configurator actor to reads the configuration from config.ini. Passes the config to
the other actors it creates and then starts the terminal handler. Actors are stored in a
Registrar so then can be disposed later - when main's onExit behaviour is called.

### Network ###

Connects to the server in the config.ini file (or localhost:1883 a default). Creates a Client as a callback for events.

### Client ###

The TCP class that tells Router when the network is connected (not the MQTT broker yet, just the TCP connection). The Client received method is called when data is available and send this
data to Assembler.

### Assembler ###

TCP knows nothing of MQTT messages so we may receive multiple MQTT messages in a TCP packet,
or fractions of a message, or any combination thereof. Assembler is responsible for assembling
valid MQTT messages from these TCP packets. If you were expecting sections of the code to be
written in assembler, I am sorry to disappoint...

### Router ###

The hub of the library - carries out minimal interpretation of the incomming message and send
it to the appropriate handlers. Keeps track of the incomming and outgoing message ids as acks
are only tied to messages by id.
