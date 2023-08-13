"""
The conector actor is responsible for:  
1. building the connection packet and sending it to the Broker via router.send  
2. receiving and interpreting the returned ConnAck packet  
3. telling router whether to start a new session or to restore an established
session.  
Connector is a separate actor because we may want to add some error handling/re-try behaviour later
"""