The terminal package provide a simple text based interface to the library. Mostly intended for testing but 
could be used as a default demo application later. In release 0.1 the terminal package and the library code were intermixed so one of the objectives of R0.2 is to separate these. 

### Terminal ###
The keyboard handler actor - takes ownership of stdin and routes messages to the library code via the public api

### Display ###
An ANSI character-based display that enables messages and status to be displayed. Note that the ANSI
codes don't work on windows terminals.

## Usage ##

![Operation](../assets/Interface.png)



## Public Types

* [type Areas](mqtt-terminal-Areas.md)
* [class BoxLine](mqtt-terminal-BoxLine.md)
* [primitive CMD](mqtt-terminal-CMD.md)
* [actor Display](mqtt-terminal-Display.md)
* [primitive DisplayColour](mqtt-terminal-DisplayColour.md)
* [primitive FRM](mqtt-terminal-FRM.md)
* [class Handler](mqtt-terminal-Handler.md)
* [primitive HighlightPeriod](mqtt-terminal-HighlightPeriod.md)
* [class KbdInput](mqtt-terminal-KbdInput.md)
* [primitive MSG](mqtt-terminal-MSG.md)
* [actor Main](mqtt-terminal-Main.md)
* [primitive STS](mqtt-terminal-STS.md)
* [class StatusLine](mqtt-terminal-StatusLine.md)
* [actor Terminal](mqtt-terminal-Terminal.md)
* [actor UIManager](mqtt-terminal-UIManager.md)
* [class UiNotify](mqtt-terminal-UiNotify.md)
