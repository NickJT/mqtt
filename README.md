# Pony MQTT Client #

A MQTT 3.1.1 client - currently part-way through release 0.1, supporting QoS 0/1/2 but
 not yet implementing session restoration. 

If you haven't used Pony, this is the best starting point -> [Pony Tutorial](https://tutorial.ponylang.io/index.html)


### Release Objectives ###
#### Release .1 ####
1. 100% coverage of the protocol for happy path with expected i/o.
2. Wide use of guards, debug checks and error tracing
3. Separate classes for each packet type so we don't miss any variations 
4. Consistent api to avoid programming errors while things stabiliise 
5. No hard split between library and application

#### Release .2 ####
1. Consider edge cases and errors
2. Split code into library and application
3. Consolidate similar classes into factory classes
4. Optimise the api (public: simple, private: efficient)  
5. Remove unnecessary intermediate variable, guards and debug checks
6. Simple GUI for testing

#### Release .3 ####
1. Performance 
2. Load and memory usage
3. Optimise
