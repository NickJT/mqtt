
primitive Commands fun apply() : String val => 
  "f" + Connect().string() + ":Connect  f" + Disconnect().string() 
  + ":Disconnect  f" + Clear().string() + ":Clear  f" + Quit().string() + ":Quit"

primitive Connect fun apply() : U8 => 1 fun string() : String val => "Connect"
primitive Disconnect fun apply() : U8 => 5
primitive Start fun apply() : U8 => 6
primitive Stop fun apply() : U8 => 7
primitive Clear fun apply() : U8 => 9
primitive Quit fun apply() : U8 => 12

type Command is (Connect | Disconnect | Start | Stop | Clear | Quit )  