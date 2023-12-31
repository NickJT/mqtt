---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"

primitive Nanos
  """
  Collection of utility functions for converting various durations of time
  to nanoseconds, for passing to other functions in the time package.
  """
  fun from_seconds(t: U64): U64 =>
    t * 1_000_000_000

  fun from_millis(t: U64): U64 =>
    t * 1_000_000

  fun from_micros(t: U64): U64 =>
    t * 1_000

  fun from_seconds_f(t: F64): U64 =>
    (t * 1_000_000_000).trunc().u64()

  fun from_millis_f(t: F64): U64 =>
    (t * 1_000_000).trunc().u64()

  fun from_micros_f(t: F64): U64 =>
    (t * 1_000).trunc().u64()

  fun from_wall_clock(wall: (I64, I64)): U64 =>
    ((wall._1 * 1000000000) + wall._2).u64()

```````