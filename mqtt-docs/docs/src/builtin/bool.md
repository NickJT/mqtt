---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
primitive Bool is Stringable
  new create(from: Bool) => from

  fun eq(y: Bool): Bool => this == y
  fun ne(y: Bool): Bool => this != y
  fun op_and(y: Bool): Bool => this and y
  fun op_or(y: Bool): Bool => this or y
  fun op_xor(y: Bool): Bool => this xor y
  fun op_not(): Bool => not this

  fun string(): String iso^ =>
    (if this then "true" else "false" end).string()

```````