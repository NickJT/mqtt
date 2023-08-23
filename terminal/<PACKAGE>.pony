"""
The terminal package provide a simple text based interface to the library. Mostly intended for testing but 
could be used as a default demo application later. In release 0.1 the terminal package and the library code were intermixed so one of the objectives of R0.2 is to separate these. 

### Terminal ###
The keyboard handler actor - takes ownership of stdin and routes messages to the library code via the public api

### Display ###
An ANSI character-based display that enables messages and status to be displayed. Note that the ANSI
codes don't work on windows terminals.

## Usage ##

![Operation](assets/Interface.png)

"""