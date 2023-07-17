---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
primitive None is Stringable
  fun string(): String iso^ =>
    "None".string()

```````