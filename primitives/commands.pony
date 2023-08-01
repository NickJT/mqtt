
/*f1:Connect f2:Subscribe f3:Stats f5:Test f6:Bench f9:Mute f10:Clear f11:Disc f12:Quit */

primitive Commands fun apply() : String val => 
    "f" + Connect().string() + ":" + Connect.string() + "  " 
  + "f" + Subscribe().string() + ":" + Subscribe.string() + "  " 
  + "f" + Stats().string() + ":" + Stats.string() + "  " 
  + "f" + RunTest().string() + ":" + RunTest.string() + "  " 
  + "f" + RunBench().string() + ":" + RunBench.string() + "  " 
  + "f" + Mute().string() + ":" + Mute.string() + "  " 
  + "f" + Clear().string() + ":" + Clear.string() + "  " 
  + "f" + Discon().string() + ":" + Discon.string() + "  " 
  + "f" + Quit().string() + ":" + Quit.string() + "  " 


primitive Connect fun apply() : U8 =>   1  fun string() : String val => "Connect"
primitive Subscribe fun apply() : U8 => 2  fun string() : String val => "Subscribe"
primitive Stats fun apply() : U8 =>     3  fun string() : String val => "Stats"
primitive RunTest fun apply() : U8 =>   5  fun string() : String val => "Test"
primitive RunBench fun apply() : U8 =>  6  fun string() : String val => "Benchmark"
primitive Mute fun apply() : U8 =>      9  fun string() : String val => "Mute"
primitive Clear fun apply() : U8 =>     10 fun string() : String val => "Clear"
primitive Discon fun apply() : U8 =>    11 fun string() : String val => "Disconnect"
primitive Quit fun apply() : U8 =>      12 fun string() : String val => "Quit"

type Command is (Connect | Subscribe | Stats | RunTest | RunBench | Mute | Clear | Discon | Quit )  