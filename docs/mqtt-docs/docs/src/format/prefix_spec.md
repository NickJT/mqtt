---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
trait val PrefixSpec

primitive PrefixDefault is PrefixSpec

primitive PrefixSpace is PrefixSpec
primitive PrefixSign is PrefixSpec

type PrefixNumber is
  ( PrefixDefault
  | PrefixSpace
  | PrefixSign )

```````