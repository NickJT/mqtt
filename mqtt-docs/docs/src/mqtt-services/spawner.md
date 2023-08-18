---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

/* Uses *******************************************************************/
  use "collections"
  use "debug"

  use "package:../mqtt"

actor Spawner
  var _subscribers : Map[String val, String val] val = Map[String val, String val]  
  var _services : Map[String val, MqttService tag] = Map[String val, MqttService tag]  

  new create(subs : Map[String val, String val] val) =>
    _subscribers = subs


```````