---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"


primitive GoodPkt1 fun apply() : Array[U8] val =>
"""
Publish id 1: $SYS/broker/subscriptions/count = 0 
"""
[51; 36; 0; 31; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 115; 117; 98; 115; 99; 114; 105; 112; 116; 105; 111; 110; 115; 47; 99; 111; 117; 110; 116; 0; 1; 48]


primitive GoodPkt2 fun apply() : Array[U8] val =>
"""
Packet 2 QoS: Requested QoS 1 Approved QoS 1
"""
[144; 3; 0; 2; 1]


primitive GoodPkt3 fun apply() : Array[U8] val =>
"""
Publish id 2: $SYS/broker/load/publish/sent/1min = 12.63
"""
[51; 43; 0; 34; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 108; 111; 97; 100; 47; 112; 117; 98; 108; 105; 115; 104; 47; 115; 101; 110; 116; 47; 49; 109; 105; 110; 0; 2; 49; 50; 46; 54; 51]


primitive GoodPkt4 fun apply() : Array[U8] val =>
"""
Packet 3 QoS: Requested QoS 1 Approved QoS 1
"""
[144; 3; 0; 3; 1]


primitive GoodPkt5 fun apply() : Array[U8] val =>
"""
Publish id 3: $SYS/broker/load/bytes/received/1min = 502.63 
controlbyte = 51
fixed header length = 2
fixed header = 51 ; 46
variable header = 0;36 then 36 chars 
remaining length = 46
"""
[51; 46; 0; 36; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 108; 111; 97; 100; 47; 98; 121; 116; 101; 115; 47; 114; 101; 99; 101; 105; 118; 101; 100; 47; 49; 109; 105; 110; 0; 3; 53; 48; 50; 46; 54; 51]


primitive GoodPkt6 fun apply() : Array[U8] val =>
"""
Publish id 4: $SYS/broker/load/publish/dropped/1min = 0.00
"""
[51; 45; 0; 37; 36; 83; 89; 83; 47; 98; 114; 111; 107; 101; 114; 47; 108; 111; 97; 100; 47; 112; 117; 98; 108; 105; 115; 104; 47; 100; 114; 111; 112; 112; 101; 100; 47; 49; 109; 105; 110; 0; 4; 48; 46; 48; 48]

```````