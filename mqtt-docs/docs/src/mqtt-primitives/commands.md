---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

primitive Sub
primitive UnSub

type SubControl is (Sub | UnSub)

/*f1:Connect f2:Test f3:Stats f4:Unsub f5:Perf f6:Load B f9:Mute f10:Clear f11:Disc f12:Quit */

primitive Commands fun apply() : String val => 
    "f" + Connect().string() + ":" + Connect.string() + "  " 
  + "f" + SubscribeTest().string() + ":" + SubscribeTest.string() + "  " 
  + "f" + SubscribeStats().string() + ":" + SubscribeStats.string() + "  " 
  + "f" + UnSubscribe().string() + ":" + UnSubscribe.string() + "  " 
  + "f" + Service().string() + ":" + Service.string() + "  " 
  + "f" + LoadTest().string() + ":" + LoadTest.string() + "  " 
  + "f" + Mute().string() + ":" + Mute.string() + "  " 
  + "f" + Clear().string() + ":" + Clear.string() + "  " 
  + "f" + Discon().string() + ":" + Discon.string() + "  " 
  + "f" + Quit().string() + ":" + Quit.string() + "  " 


primitive Connect fun apply() : U8 =>         1  fun string() : String val => "Connect"
primitive SubscribeTest fun apply() : U8 =>   2  fun string() : String val => "Test"
primitive SubscribeStats fun apply() : U8 =>  3  fun string() : String val => "Stats"
primitive UnSubscribe fun apply() : U8 =>     4  fun string() : String val => "Unsub"
primitive Service fun apply() : U8 =>        5  fun string() : String val => "Service"
primitive LoadTest fun apply() : U8 =>        6  fun string() : String val => "Load"
primitive Mute fun apply() : U8 =>            8  fun string() : String val => "Mute"
primitive Clear fun apply() : U8 =>           10 fun string() : String val => "Clear"
primitive Discon fun apply() : U8 =>          11 fun string() : String val => "Disconnect"
primitive Quit fun apply() : U8 =>            12 fun string() : String val => "Quit"

type Command is (Connect | SubscribeTest | SubscribeStats | UnSubscribe | Service 
| LoadTest | Mute | Clear | Discon | Quit )  


primitive TestPrefix fun apply() : String val => "stats/"
primitive TestTopic fun apply() : String val => "Service"
primitive TestLength fun apply() : U64 => 10_000_000
primitive TestInterval fun apply() : U64 => 50_000_000
```````