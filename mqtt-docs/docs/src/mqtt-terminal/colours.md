---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
use "term"

primitive DisplayColour
  fun border(): String val => ANSI.grey()
  fun separator(): String val => ANSI.grey()
  fun cmd(): String val => ANSI.bright_blue()
  fun boxDormant(): String val => ANSI.grey()
  fun boxNormal(): String val => ANSI.white()
  fun boxChange(): String val => ANSI.bright_red()
  fun status(): String val => ANSI.green() 


```````