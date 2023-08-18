---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "package:../primitives"

/*****************************************************/  
// ConnAck Codes
/*****************************************************/  
primitive ConnAckAccepted  fun apply() : U8 =>  0  fun string() : String => "Accepted" 
primitive ConnAckRefusedProtocolVersion  fun apply() : U8 =>  1 fun string() : String => "Refused - Protcol Version" 
primitive ConnAckRefusedIdentifierRejected  fun apply() : U8 =>  2 fun string() : String => "Refused - Identifier Rejected" 
primitive ConnAckRefusedServerUnavailable  fun apply() : U8 =>  3 fun string() : String => "Refused - Server Unavailable" 
primitive ConnAckRefusedBadUserNameOrPassword  fun apply() : U8 =>  4 fun string() : String => "Refused - Bad User Name or Password" 
primitive ConnAckRefusedNotAuthorised  fun apply() : U8 =>  5 fun string() : String => "Refused - Not Authorised" 

type ConnAckReturnCode is (
  ConnAckAccepted  
| ConnAckRefusedProtocolVersion 
| ConnAckRefusedIdentifierRejected 
| ConnAckRefusedServerUnavailable 
| ConnAckRefusedBadUserNameOrPassword  
| ConnAckRefusedNotAuthorised    
)


/********************************************************************/  
primitive RejectionCode fun apply(flags : U8 val)  : String =>
"""
Decodes the Connection rejection code from the Broker and add some text to the returned string
"""
     match flags
    | ConnAckAccepted() => (InvalidControl.string() + ":" + "ConnAckAccepted control passed to Rejection actor")
    | ConnAckRefusedProtocolVersion() => (ConnectionRefused.string() + " (" + ConnAckRefusedProtocolVersion.string() + ")")
    | ConnAckRefusedIdentifierRejected() => (ConnectionRefused.string()+ " (" + ":" + ConnAckRefusedIdentifierRejected.string()+ ")")
    | ConnAckRefusedServerUnavailable()  => (ConnectionRefused.string() + " ("+ ":" + ConnAckRefusedServerUnavailable.string()+ ")")
    | ConnAckRefusedBadUserNameOrPassword()  =>(ConnectionRefused.string() + " ("+ ":" + ConnAckRefusedBadUserNameOrPassword.string()+ ")")
    | ConnAckRefusedNotAuthorised()   => (ConnectionRefused.string() + ":" + " ("+ ConnAckRefusedNotAuthorised.string()+ ")")
    else
      (UnknownError.string() +  "Unknown CONNACK flags passed to Rejection actor")
    end
        

```````