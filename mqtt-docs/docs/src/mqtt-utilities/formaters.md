---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "format"
use "time"
use "package:../primitives"
use "debug"

// Put any formating primitives here so we are consistent throughout

primitive FmtBin fun apply(v: U8): String =>
    Format.int[U8](v where width = 10, prec = 8, align = AlignRight, fill =0, fmt = FormatBinary)


primitive FmtHex fun apply(v: U8): String =>
    Format.int[U8](v where width = 4, prec = 2, align = AlignRight, fill =0, fmt = FormatHex)


primitive FmtDec fun apply(v: I32): String =>
    Format.int[I32](v where width = 2, prec = 2, align = AlignRight, fill =0, fmt = FormatDefault)


primitive DumpBin fun apply(name : String, data : Array[U8] val) =>
  Debug.err(name + " - " + data.size().string() + " bytes")
  var i : USize = 0
  while (i < data.size()) do 
    try 
      Debug.err("["+ i.string() + "]\t")
      Debug.err(FmtBin(data(i)?) + "\t" + FmtHex(data(i)?)) 
      i = i+ 1
    end 
  end   
  Debug.err("------------------")


primitive Dump fun apply(data : ArrayVal) =>
  var result : String val =
  recover val
    var i : USize = 0
    var def : String ref = String
    while (i < data.size()) do 
      try 
        def.append("["+ i.string() + "]\t")
       def.append(data(i)?.string())
       if ((data(i)? > 32) and (data(i)? < 127)) then 
       def.append("\t")
       def.push(data(i)?)
       end
       def.append("\n\r")
       i = i+ 1
      end 
    end   
    def.append("\n")
  consume def
  end

  Debug.err(result)


```````