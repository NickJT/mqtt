---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "collections"

// String defines for the config.ini file so we have them all in one place 
use "debug"
primitive ConfigFile fun apply() : String val => 
"""
The name of the config file - currently assumed to be in the main source directory
"""
"config.ini"


primitive FullConfigParams fun apply() : Array[String val] val => 
"""
Add strings to this literal array to read them from an ini file. Any strings 
added here which are not represented as non-zero length strings in the ini
file will cause the overall ini read to fail (by design).
"""
[IniAddress(); IniPort(); IniId(); IniKeepalive(); IniCleansession(); IniName(); IniPassword(); IniTopic(); IniMessage(); IniQos()]


primitive MinConfigParams fun apply() : Array[String val] val => 
"""
Add strings to this literal array to read them from an ini file. Any strings 
added here which are not represented as non-zero length strings in the ini
file will cause the overall ini read to fail (by design).
"""
[IniAddress() ; IniPort(); IniId() ;IniKeepalive(); IniCleansession()]


primitive SupportedQos fun apply() : String val => "01"  // or "012"  or "0123"
"""
This string contains members of the set n = '0', '1', '2', '3' where each represents support
for QOSn. A subscription in the ini file which is not valid (e.g. specifies a QOS that is not)
 supported will be ignored and no furhter subscriptions will be read, but this will not cause  
 the overall ini read to fail.  
"""

primitive QosPrefix fun apply() : String => 
"""
In case we decide to change the case later (or something)
"""
"qos"

primitive  IsValidQos fun apply(qosString : String) : Bool =>
"""
The subscription validator function that checks the qos field
"""
  //Debug("Valid qos " + qosString.compare_sub(QosPrefix(),3,0,0,true).string() where stream = DebugErr)
  (qosString.size() == 4)  and
  (qosString.compare_sub(QosPrefix(),3,0,0,true) is Equal) and 
  (SupportedQos().contains(qosString.trim(3)))



primitive IniSectionBroker fun apply() : String val => "broker"
primitive IniAddress fun apply() : String val => "address" 
primitive IniPort fun apply() : String val => "port"

primitive IniSectionClient fun apply() : String val => "client"
primitive IniId fun apply() : String val => "id" 
primitive IniKeepalive fun apply() : String val => "keepalive"
primitive IniCleansession fun apply() : String val => "cleansession"

primitive IniSectionCredentials fun apply() : String val => "credentials"
primitive IniName fun apply() : String val => "name" 
primitive IniPassword fun apply() : String val => "password" 

primitive IniSectionWill fun apply() : String val => "will"
primitive IniTopic fun apply() : String val => "topic" 
primitive IniMessage fun apply() : String val =>  "message"
primitive IniQos fun apply() : String val => "qos"

primitive IniSectionSubscriptions fun apply() : String val => "subscriptions"


primitive DefaultBroker fun apply() : Map[String val, String val] val=>
          recover val
          var temp : Map[String val, String val] =   Map[String val, String val]
          temp.insert(IniAddress(),"localhost")
          temp.insert(IniPort(),"1883")
          temp
          end


```````