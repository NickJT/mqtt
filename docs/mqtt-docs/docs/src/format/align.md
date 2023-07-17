---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
primitive AlignLeft
primitive AlignRight
primitive AlignCenter

type Align is
  ( AlignLeft
  | AlignRight
  | AlignCenter )

```````