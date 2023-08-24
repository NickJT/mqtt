# RuntimeOptions
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-1)</span>

Pony struct for the Pony runtime options C struct that can be used to
override the Pony runtime defaults via code compiled into the program.

The way this is done is by adding the following function to your `Main` actor:

```
  fun @runtime_override_defaults(rto: RuntimeOptions) =>
```

and then overriding the fields of `rto` (the `RuntimeOptions` instance) as
needed.

NOTE: Command line arguments still any values set via
      `@runtime_override_defaults`.


The following example overrides the `--ponyhelp` argument to default it to
`true` instead of `false` causing the compiled program to always display
the Pony runtime help:

```
actor Main
  new create(env: Env) =>
    env.out.print("Hello, world.")

  fun @runtime_override_defaults(rto: RuntimeOptions) =>
    rto.ponyhelp = true
```


```pony
struct ref RuntimeOptions
```

## Constructors

### create
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-1)</span>


```pony
new iso create()
: RuntimeOptions iso^
```

#### Returns

* [RuntimeOptions](builtin-RuntimeOptions.md) iso^

---

## Public fields

### var ponymaxthreads: [U32](builtin-U32.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-37)</span>

Use N scheduler threads. Defaults to the number of cores (not hyperthreads)
available.
This can't be larger than the number of cores available.




---

### var ponyminthreads: [U32](builtin-U32.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-44)</span>

Minimum number of active scheduler threads allowed.
Defaults to 0, meaning that all scheduler threads are allowed to be
suspended when no work is available.
This can't be larger than --ponymaxthreads if provided, or the physical
cores available.




---

### var ponynoscale: [Bool](builtin-Bool.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-53)</span>

Don't scale down the scheduler threads.
See --ponymaxthreads on how to specify the number of threads explicitly.
Can't be used with --ponyminthreads.




---

### var ponysuspendthreshold: [U32](builtin-U32.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-60)</span>

Amount of idle time before a scheduler thread suspends itself to minimize
resource consumption (max 1000 ms, min 1 ms).
Defaults to 1 ms.




---

### var ponycdinterval: [U32](builtin-U32.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-67)</span>

Run cycle detection every N ms (max 1000 ms, min 10 ms).
Defaults to 100 ms.




---

### var ponygcinitial: [USize](builtin-USize.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-73)</span>

Defer garbage collection until an actor is using at least 2^N bytes.
Defaults to 2^14.




---

### var ponygcfactor: [F64](builtin-F64.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-79)</span>

After GC, an actor will next be GC'd at a heap memory usage N times its
current value. This is a floating point value. Defaults to 2.0.




---

### var ponynoyield: [Bool](builtin-Bool.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-85)</span>

Do not yield the CPU when no work is available.




---

### var ponynoblock: [Bool](builtin-Bool.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-90)</span>

Do not send block messages to the cycle detector.




---

### var ponypin: [Bool](builtin-Bool.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-95)</span>

Pin scheduler threads to CPU cores. The ASIO thread can also be pinned if
`--ponypinasio` is set.




---

### var ponypinasio: [Bool](builtin-Bool.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-101)</span>

Pin the ASIO thread to a CPU the way scheduler threads are pinned to CPUs.
Requires `--ponypin` to be set to have any effect.




---

### var ponyprintstatsinterval: [U32](builtin-U32.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-107)</span>

Print actor stats before an actor is destroyed and print scheduler stats
every X seconds. Defaults to -1 (never).




---

### var ponyversion: [Bool](builtin-Bool.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-113)</span>

Print the version of the compiler and exit.




---

### var ponyhelp: [Bool](builtin-Bool.md) val
<span class="source-link">[[Source]](src/builtin/runtime_options.md#L-0-118)</span>

Print the runtime usage options and exit.




---

