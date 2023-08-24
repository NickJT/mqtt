# Ini package

The Ini package provides support for parsing
[INI file](https://en.wikipedia.org/wiki/INI_file) formatted text.

* Currently _does not_ support multi-line entries.
* Any keys not in a section will be placed in the section ""

# Example code
```pony
// Parses the file 'example.ini' in the current working directory
// Output all the content
use "ini"
use "files"

actor Main
  new create(env:Env) =>
    try
      let ini_file = File(FilePath(FileAuth(env.root), "example.ini"))
      let sections = IniParse(ini_file.lines())?
      for section in sections.keys() do
        env.out.print("Section name is: " + section)
        for key in sections(section)?.keys() do
          env.out.print(key + " = " + sections(section)?(key)?)
        end
      end
    end
```


## Public Types

* [primitive Ini](ini-Ini.md)
* [type IniError](ini-IniError.md)
* [primitive IniIncompleteSection](ini-IniIncompleteSection.md)
* [type IniMap](ini-IniMap.md)
* [primitive IniNoDelimiter](ini-IniNoDelimiter.md)
* [interface IniNotify](ini-IniNotify.md)
* [primitive IniParse](ini-IniParse.md)
