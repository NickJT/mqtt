"""
The actor and classes needed to subscribe to messages from the Broker and handle the ensuing 
handshakes.  
Note - This package includes suback codes on the basis that it may be better to interpret these
within the library code and return a string to the app than to return a code. 
"""