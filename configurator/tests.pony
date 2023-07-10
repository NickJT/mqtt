
use "pony_test"
use "collections"
use "../primitives"

//type Map[String val, String val] val is Map[String val, String val] val 

primitive FullConfig fun apply() : Map[String val, String val] val =>
  recover val
    let config : Map[String val, String val] = Map[String val, String val]
    config.insert(IniAddress(), "192.168.86.98")
    config.insert(IniPort(), "1883")
    config.insert(IniId(),"PonyClient")
    config.insert(IniKeepalive(),"10")

    config.insert(IniTopic(),"LWandT")
    config.insert(IniMessage(),"Goodbye, and thanks for all the fish!")
    config.insert(IniQos(),"qos1")

    config.insert(IniName(),"nick")
    config.insert(IniPassword(),"sVx3!bj")
    consume config
  end

primitive FullConfigFile fun apply(): String val =>
"""
The name of the full configuration ini file in this directory
"""
"/home/nick/pony/mqtt/configurator/fullConfig.ini"

primitive MinConfigFile fun apply(): String val =>
"""
The name of the minimum configuration ini file in this directory
"""
"/home/nick/pony/mqtt/configurator/minConfig.ini"

primitive MinConfig fun apply() : Map[String val, String val] val =>
  recover val
    let config : Map[String val, String val] = Map[String val, String val]
    config.insert(IniAddress(), "192.168.86.98")
    config.insert(IniPort(), "1883")
    config.insert(IniId(),"PonyClient")
    config.insert(IniKeepalive(),"10")
    consume config
  end

primitive FullSubs fun apply(): Map[String val, String val] val =>
  recover val
    let subs : Map[String, String] =  Map[String, String]
    subs.insert("$SYS/broker/subscriptions/count", "Qos1")
    subs.insert("$SYS/broker/bytes/received", "Qos0")
    subs.insert("$SYS/broker/bytes/sent", "Qos1")
    subs.insert("$SYS/broker/messages/received", "Qos0")
    subs.insert("$SYS/broker/messages/sent", "Qos1")
    subs.insert("$SYS/broker/retained messages/count", "Qos1")
    subs.insert("$SYS/broker/messages/inflight", "Qos1")
    subs.insert("$SYS/broker/messages/dropped", "Qos1")
    subs.insert("$SYS/broker/publish/messages/received", "Qos1")
    subs.insert("$SYS/broker/publish/messages/sent", "Qos1")
    subs.insert("$SYS/broker/load/bytes/received/1min", "Qos1")
    subs.insert("$SYS/broker/load/bytes/sent/1min", "Qos1")
    subs.insert("$SYS/broker/load/publish/sent/1min", "Qos1")
    subs.insert("$SYS/broker/load/publish/received/1min", "Qos1")
    subs.insert("$SYS/broker/load/publish/dropped/1min", "Qos1")
    consume subs
  end


primitive MiniSubs fun apply(): Map[String val, String val] val =>
  recover val
    let subs : Map[String, String] =  Map[String, String]
    subs.insert("$SYS/broker/bytes/received", "QOS0")
    consume subs
  end


actor Main is TestList

    new create(env : Env) =>
      PonyTest(env, this)

    new make() =>
      None

    fun tag tests(test: PonyTest) =>
        test(_BadFile)

        test(_OKMini)
        test(_ArgsMini)
        test(_SubsMini)

        test(_OKFull)
        test(_ArgsFull)
        test(_SubsFull)


class iso _BadFile is UnitTest
    fun name() : String => "Missing File"
    fun apply(h: TestHelper) =>
      var conf : MqttConfig = MqttConfig(h.env, "noFile.ini", FullConfigParams())
      h.assert_eq[Bool](false, conf.isValid()) 


class iso _OKMini is UnitTest
    fun name() : String => "OK - Mini"
    fun apply(h: TestHelper) =>
      var conf : MqttConfig = MqttConfig(h.env, MinConfigFile(), MinConfigParams())
      var map : Map[String val, String val] val = conf.getConfig()
      for key in map.keys() do 
        try
          h.assert_eq[String val](MinConfig()(key)?,map(key)?)
        else
          h.fail("Mismatched " + key + " entry")
        end  
      end  
      h.assert_eq[Bool](true, conf.isValid()) 


class iso _ArgsMini is UnitTest
    fun name() : String => "Args - Mini"
    fun apply(h: TestHelper) =>
      var conf : MqttConfig = MqttConfig(h.env, MinConfigFile(), MinConfigParams())
      var map : Map[String val, String val] val = conf.getConfig()

      for key in map.keys() do 
        try
          h.assert_eq[String val](MinConfig()(key)?,map(key)?)
        else
          h.fail("Mismatched " + key + " entry")
        end  
      end      

class iso _SubsMini is UnitTest
    fun name() : String => "Subs - Mini"
    fun apply(h: TestHelper) =>
      var conf : MqttConfig = MqttConfig(h.env, MinConfigFile(), MinConfigParams())
      var map : Map[String val, String val] val = conf.getSubscriptions()
      // Subscriptions map is empty for miniconfig.ini 
      h.assert_eq[Bool](true, map.size() == 0)

class iso _OKFull is UnitTest
    fun name() : String => "OK - Full"
    fun apply(h: TestHelper) =>
      var conf : MqttConfig = MqttConfig(h.env, FullConfigFile(), FullConfigParams())
      h.assert_eq[Bool](true, conf.isValid()) 



class iso _ArgsFull is UnitTest
    fun name() : String => "Args - Full"
    fun apply(h: TestHelper) =>
      var conf : MqttConfig = MqttConfig(h.env, FullConfigFile(), FullConfigParams())
      var map : Map[String val, String val] val = conf.getConfig()

      for key in map.keys() do 
        try
          h.assert_eq[Bool](true,map(key)?.size() > 0)
          h.assert_eq[String val](FullConfig()(key)?,map(key)?)
        else
          h.fail("Mismatched " + key + " entry")
        end  
      end



class iso _SubsFull is UnitTest
    fun name() : String => "Subs - Full"
    fun apply(h: TestHelper) =>
      var conf : MqttConfig = MqttConfig(h.env, FullConfigFile(), FullConfigParams())
      var map : Map[String val, String val] val = conf.getSubscriptions()

      for key in map.keys() do 
        try
          h.assert_eq[Bool](true, map(key)?.size()>0)
          h.assert_eq[String val](FullSubs()(key)?.lower(),map(key)?.lower())
        else
          h.fail("Mismatched " + key + " entry")
        end  
      end

