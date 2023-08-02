# Pony MQTT Client #

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
5. Demo app


## Public Types

* [class Client](mqtt-Client.md)
* [actor Main](mqtt-Main.md)
* [actor Router](mqtt-Router.md)
