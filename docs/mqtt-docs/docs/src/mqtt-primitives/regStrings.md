---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

// Strings for the actors in the registrar 
// so we don't have string literals in the code

primitive KeyRouter fun apply() : String val => "router"
primitive KeyIssuer fun apply() : String val => "issuer"
primitive KeyTerminal fun apply() : String val => "main"
primitive KeyPinger fun apply() : String val => "pinger"

```````