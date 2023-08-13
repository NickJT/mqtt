"""
Configurator reads a .ini file containing details of the broker, client credentials, connection options and initial subscriptions.
If no config file is provided (or found) an anonymous connection will be attempted to localhost:1883.  
The config file ```config.ini``` is located in the same directory as main. The .ini files located in the 
configurator package directory are for test purposes. 
"""