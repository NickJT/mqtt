"""
The OsNetwork actor provides the default (localhost:1883) settings if the config.ini file isn't provided. It is also
our interface to DNS in the event that the provided broker address isn't numeric.
We can probably combine this with the client actor at a later stage.
I still haven't quite worked out how the DNS call works - because it looks synchronous and I'd have thought it would need to be async...
"""