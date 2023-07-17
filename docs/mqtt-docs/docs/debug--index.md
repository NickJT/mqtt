# Debug package

Provides facilities to create output to either `STDOUT` or `STDERR` that will
only appear when the platform is debug configured. To create a binary with
debug configured, pass the `-d` flag to `ponyc` when compiling e.g.:

`ponyc -d`

## Example code

```pony
use "debug"

actor Main
  new create(env: Env) =>
    Debug.out("This will only be seen when configured for debug info")
    env.out.print("This will always be seen")
```


## Public Types

* [primitive Debug](debug-Debug.md)
* [primitive DebugErr](debug-DebugErr.md)
* [primitive DebugOut](debug-DebugOut.md)
* [type DebugStream](debug-DebugStream.md)
