---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
/***uses***/
  use "files"
  use "ini"
  use "debug"
  use "net"
  use "collections"
  use "package:../primitives"
 
class MqttConfig
  """
  All we are doing here is reading from a config.ini file and compositing two maps of key value pairs. 
  The first is the set of MQTT configuraton values that are used to make the initial user connection
  to the Broker. The format of these is parameter = argument.
  The parameters considered valid are defined below in the _configParams array. If the params in the config
  file don't match these the read terminates.
  The second map is a set of topics and QoS values representing the subscriptions to be requested from the 
  Broker on connection. The format of these is topic = QoS. If any subscriptions are not valid they are simply ignored and the conenction
  proceeds with no initial subscriptions (unlike for parameter reads)
  """
  let _env : Env

  let _fileName : String
  """
  The name of the config file. Defaults to config.ini if no filename is provided
  """
  let _ini : Ini = Ini
  """
  Library funtion to read an ini file using a callback  
  """  
  let _reader : IniReader
  """
  The callback function whose .apply(section, key, value) is called for each line in the ini file
  """  
  var _config : Map[String val, String val] val = Map[String val, String val] 
  """
  Storage for the key value pairs used for the config parameters read from the ini file
  """  
  var _subscriptions : Map[String val, String val] val = Map[String val, String val] 
  """
  Storage for the strings used as topic subscriptions in the Subscriptions section of the ini file
  """  
  var _configOK : Bool = false
  """
  Set true if the config has been read and validated
  """  

new create(env : Env, fileName : String val, params : Array[String val] val) =>
  _env = env
  _fileName = fileName
  
  _reader = _reader.create(params)
  _configOK =_readConfig()
  _config = _reader.getConfig()
  _subscriptions = _reader.getSubs()


/********************************************************************************/
fun isValid() : Bool =>
  """
  The ini file is read when the class is constructed and the _configOK flag is set if all the
  parameters have been found and no invalid subscriptions are present.  
  This method should be called before calling getConfig or getSubscriptions
  We do a belt and braces check for empty maps (if the file couldn't be opened for example) 
  and zero length params and then return the result of the read we did in the constructor.  
  """

  if (_config.size() == 0 ) then return false end

  for value in _config.values() do
    if (value.size() == 0) then return false end
  end
  _configOK

/********************************************************************************/
fun ref getConfig() : Map[String val, String val] val  =>
  """
  Returns a map of key value pairs or keys with zero length strings if there were any errors  
  in the ini file
  """
  _config

/********************************************************************************/
fun ref getSubscriptions() : Map[String val, String val] val =>
  """
  Returns an empty (but valid) array if no subscriptions were present or  
  if there was an error in the ini file
  """
  _subscriptions

/********************************************************************************/
fun hasSubscriptions() : Bool =>
  """
  Convenience method that returns true is the ini file contained any initial 
  subscriptions 
  """
  (_subscriptions.size() != 0)

/********************************************************************************/
/*******************    Private Methods    **************************************/
/********************************************************************************/
fun ref _readConfig() : Bool => 
  """
  Read the config values from the ini file and return true if they are all 
  found and are all non-zero length strings
  """

  let path : FilePath = FilePath(FileAuth(_env.root), _fileName)

  if (not path.exists()) then
    Debug.err(_fileName + " does not exist")
    return false
  end   

  let ini_file = File(path)
    
  if (ini_file.errno() is FileOK) then 
      // Note _ini only returns false and stops processing if one of the two
      // _iniError types are found by the primitive. _reader returning false 
      // does not cause _ini to return false.
      return _ini(ini_file.lines(), _reader)
  else
    Debug.err(fileError(ini_file.errno()))
  end
  
  false


/********************************************************************/  
fun fileError(errNo : FileErrNo) : String val =>
  """
  Converts file error codes to strings and sends to the debug printer is all
  """
    match errNo 
    | FileError => "File Error"
    | FileEOF => "File EOF"
    | FileBadFileNumber => "Bad File Number"
    | FileExists => "File Exists"
    | FilePermissionDenied => "File Permission Denied"
    | FileOK => "File OK"
    end



/********************************************************************/  
class IniReader is IniNotify
  """
  Called once for each line in the .ini file. Currently written to terminate on the first error.
  Uses primitive SupportedQos to determine whether subscriptions are valild
  """
  var _config :  Map[String val, String val]
  """
  The map we eventually return with the key:value = parameter:argument
  """
  var _subscriptions : Map[String val, String val]
  """
  The map we eventually return with the key:value topic:QoS
  """

new create(params : Array[String val] val) => 
  _config = Map[String val, String val] 
  _subscriptions = Map[String val, String val]

  // Initialise the config map with the keys of the parameters we accept
  for param in params.values() do  
      _config.insert(param,"")
  end  


/********************************************************************************/
fun getConfig() : Map[String val, String val] val =>
  """
  Destructive read on new (unpopulated) map should return the old (populated) map
  but I can't get this to work, so resorting to copying
  """
  var result : Map[String val, String val] iso =  Map[String val, String val]
  for (k,v) in _config.pairs() do 
    result.insert(k,v)
  end
  consume result 

/********************************************************************************/
fun getSubs() : Map[String val, String val] val =>
  """
  Destructive read on new (unpopulated) map should return the old (populated) map
  """
  var result : Map[String val, String val] iso =  Map[String val, String val]
  for (k,v) in _subscriptions.pairs() do 
    result.insert(k,v)
  end
  consume result 

/********************************************************************************/
fun ref apply(section: String ,  key: String ,  value: String ) : Bool =>
  // Note that exiting early on an invalid subscription doesn't remove the valid
  // config prams that have already been loaded and doesn't unset the _configOK flag
  // This means we just ignore invalid subscriptions rather than terminating everything 
  // on encountering an invalid subscription 

  // A valid subscription requires only one character and a valid QoS field
  if (section == IniSectionSubscriptions()) then 
    if (_isValidSub(key, value)) then
      _subscriptions.insert(key,value) 
      return true
    else
      Debug.err("Invalid subscription " + key + " : " + value)
    end
  end

  // We have a QoS field in the will section that need special treatment
  if ((section == IniSectionWill()) and (key == IniQos()) and (IsValidQos(value))) then
    _config(key) = value
    return true
  end

  // If we get here we will have accepted anything that is a basic valid parameter
  if (_isValidParam(key, value)) then  
    _config(key) = value
    return true
  end

  // If we get here then something is wrong with our ini file  
  Debug.err("Invalid ini file entry => " + section + ": [" + key + "] = " + value)
  false

/********************************************************************************/
fun _isValidParam(p : String val, v : String val ) : Bool =>
  """
  The validator for parameters. Checks that the key is in our list of 
  key strings and that the value is a non-empty string
  """
  ((v.size() > 0) and (_config.contains(p)))


/********************************************************************************/
fun ref _isValidSub(sub: String, qos : String) : Bool =>
  """
  The subscription validator function that checks a topic of a topic:
  qos pair for a topic length of least one character (size in bytes so UTF-8 only) 
  """
  ((sub.size() != 0) and IsValidQos(qos))


/********************************************************************************/
fun add_section(section: String val): Bool =>
  """
  Part of the interface but we don't need it here
  """
    ///Debug.err("Ini file section " + section)
  true

/********************************************************************************/
fun ref errors(line: USize val,  err: (IniIncompleteSection val | IniNoDelimiter val)) : Bool =>
  """
  This is called for each error encountered. Returns false to halt processing.
  """
    var debugString : String = "ini file error in line " + line.string()
    match err
    | IniIncompleteSection => Debug.err(debugString + " Incomplete Section" )
    | IniNoDelimiter => Debug.err(debugString + " No Delimiter")
    end
  false  //Terminate further processing


```````