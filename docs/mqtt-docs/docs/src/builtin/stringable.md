---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
interface box Stringable
  """
  Things that can be turned into a String.
  """
  fun string(): String iso^
    """
    Generate a string representation of this object.
    """

```````