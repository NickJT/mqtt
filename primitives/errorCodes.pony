use "files"
use "debug"




/*****************************************************/  
// Application Error Codes
/*****************************************************/  
primitive ForbiddenType fun apply() : U8 => 0 fun string() : String => "Forbidden Type" 
primitive ForbiddenFlags fun apply() : U8 => 1   fun string() : String => "Forbidden Flags" 
primitive ForbiddenCode fun apply() : U8 => 2 fun string() : String => "Forbidden Code" 
primitive ForbiddenWillQos fun apply() : U8 => 3  fun string() : String => "Forbidden Will QoS" 
primitive ForbiddenQos fun apply() : U8 => 4  fun string() : String => "Forbidden QoS" 

primitive InvalidType  fun apply() : U8 => 5 fun string() : String => "Invalid Type" 
primitive InvalidControl fun apply() : U8 => 6 fun string() : String => "Invalid Control" 
primitive InvalidFlags  fun apply() : U8 => 7 fun string() : String => "Invalid Flags" 
primitive InvalidRemainingLength fun apply() : U8 => 8 fun string() : String => "Invalid Remaining Length" 

primitive MalformedRequest fun apply() : U8 => 9 fun string() : String => "Malformed Request" 
primitive MalformedResponse fun apply() : U8 => 10 fun string() : String => "Malformed Response" 

primitive CleanSessionRequired fun apply() : U8 => 11  fun string() : String => "Clean Session Required" 

primitive NotConnected fun apply() : U8 => 13  fun string() : String => "Not Connected" 
primitive SocketError fun apply() : U8 => 14   fun string() : String => "Socket Error" 
primitive ConnectionClosed fun apply() : U8 => 15 fun string() : String => "Connection Closed" 

primitive ReconnectFailed fun apply() : U8 => 16  fun string() : String => "Reconnect Failed" 
primitive SubscribeFailed fun apply() : U8 => 17   fun string() : String => "Subscribe Failed" 
primitive ConnectionRefused fun apply() : U8 => 18 fun string() : String => "Connection Refused" 

primitive NotImplemented fun apply() : U8 => 19  fun string() : String => "Not Implemented" 
primitive UnknownError fun apply() : U8 => 255  fun string() : String => "Unknown error" 

type ErrorCode is (
  ForbiddenType 
| ForbiddenFlags 
| ForbiddenCode 
| ForbiddenWillQos
| ForbiddenQos  

| InvalidType   
| InvalidControl 
| InvalidFlags  
| InvalidRemainingLength

| MalformedRequest 
| MalformedResponse

| CleanSessionRequired
| SubscribeFailed 

| NotConnected  
| SocketError 
| ConnectionClosed 

| ReconnectFailed 
| ConnectionRefused

| UnknownError
)


/********************************************************************/  
primitive DecodeErr fun apply(err : ErrorCode, text : String = "") =>
"""
Compiles an information string from an error code
"""
  ("Error (" + err().string() + ") " + err.string() + " : " + text) 

