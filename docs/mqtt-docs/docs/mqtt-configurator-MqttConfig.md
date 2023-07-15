# MqttConfig
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-8)</span>

All we are doing here is reading from a config.ini file and compositing two maps of key value pairs. 
The first is the set of MQTT configuraton values that are used to make the initial user connection
 to the Broker. The format of these is parameter = argument.
The parameters considered valid are defined below in the _configParams array. If the params in the config
 file don't match these the read terminates.
The second map is a set of topics and QoS values representing the subscriptions to be requested from the 
Broker on connection. The format of these is topic = QoS. If any subscriptions are not valid they are simply ignored and the conenction
proceeds with no initial subscriptions (unlike for parameter reads)


```pony
class ref MqttConfig
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-46)</span>


```pony
new ref create(
  env: Env val,
  fileName: String val,
  params: Array[String val] val)
: MqttConfig ref^
```
#### Parameters

*   env: [Env](builtin-Env.md) val
*   fileName: [String](builtin-String.md) val
*   params: [Array](builtin-Array.md)\[[String](builtin-String.md) val\] val

#### Returns

* [MqttConfig](mqtt-configurator-MqttConfig.md) ref^

---

## Public Functions

### isValid
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-57)</span>


The ini file is read when the class is constructed and the _configOK flag is set if all the
 parameters have been found and no invalid subscriptions are present.  
This method should be called before calling getConfig or getSubscriptions
We do a belt and braces check for empty maps (if the file couldn't be opened for example) 
and zero length params and then return the result of the read we did in the constructor.  


```pony
fun box isValid()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### getConfig
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-74)</span>


Returns a map of key value pairs or keys with zero length strings if there were any errors  
in the ini file


```pony
fun ref getConfig()
: HashMap[String val, String val, HashEq[String val] val] val
```

#### Returns

* [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

---

### getSubscriptions
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-82)</span>


Returns an empty (but valid) array if no subscriptions were present or  
if there was an error in the ini file


```pony
fun ref getSubscriptions()
: HashMap[String val, String val, HashEq[String val] val] val
```

#### Returns

* [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

---

### hasSubscriptions
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-91)</span>


Convenience method that returns true is the ini file contained any initial 
subscriptions 


```pony
fun box hasSubscriptions()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### fileError
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-133)</span>


Converts file error codes to strings and sends to the debug printer is all


```pony
fun box fileError(
  errNo: (FileOK val | FileError val | FileEOF val | 
    FileBadFileNumber val | FileExists val | FilePermissionDenied val))
: String val
```
#### Parameters

*   errNo: ([FileOK](files-FileOK.md) val | [FileError](files-FileError.md) val | [FileEOF](files-FileEOF.md) val | 
    [FileBadFileNumber](files-FileBadFileNumber.md) val | [FileExists](files-FileExists.md) val | [FilePermissionDenied](files-FilePermissionDenied.md) val)

#### Returns

* [String](builtin-String.md) val

---

## Private Functions

### _readConfig
<span class="source-link">[[Source]](src/mqtt-configurator/mqttConfig.md#L-0-105)</span>


Read the config values from the ini file and return true if they are all 
found and are all non-zero length strings


```pony
fun ref _readConfig()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

