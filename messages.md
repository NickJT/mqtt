### Bidirectional ###  
|   Message   | Value |                 Usage                       |
|-------------|-------|---------------------------------------------|
|PUBLISH      |3      | Publish message                             |  
|PUBACK       |4      | Publish acknowledgment                      |
|PUBREC       |5      | Publish received (assured delivery part 1)  |
|PUBREL       |6      | Publish release (assured delivery part 2)   |
|PUBCOMP      |7      | Publish complete (assured delivery part 3)  |

### Client to Server ###  
|   Message   | Value |                 Usage                       |
|-------------|-------|---------------------------------------------|
|CONNECT      |1      | Client request to connect to Server         |
|SUBSCRIBE    |8      | Client subscribe request                    |
|UNSUBSCRIBE  |10     | Unsubscribe request                         |
|PINGREQ      |12     | PING request                                |
|DISCONNECT   |14     | Client is disconnecting                     |

### Server to Client ###  
|   Message   | Value |                 Usage                       |
|-------------|-------|---------------------------------------------|
|CONNACK      |2      | Connect acknowledgment                      |
|SUBACK       |9      | Subscribe acknowledgment                    |
|UNSUBACK     |11     | Unsubscribe acknowledgment                  |
|PINGRESP     |13     | PING response                               |