---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

// Strings for the actors in the registrar 
// so we don't have string literals in the code

primitive KeyIssuer fun apply() : String val => "issuer"
primitive KeyClient fun apply() : String val => "main"
primitive KeyNetwork fun apply() : String val => "network"
primitive KeyPersistor fun apply() : String val => "persistor"
primitive KeyPinger fun apply() : String val => "pinger"
primitive KeyRouter fun apply() : String val => "router"
primitive KeySpawner fun apply() : String val => "spawner"
primitive KeyPerf fun apply() : String val => "perftest"
primitive KeyDisplay fun apply() : String val => "display"
primitive KeyTicker fun apply() : String val => "ticker"

```````