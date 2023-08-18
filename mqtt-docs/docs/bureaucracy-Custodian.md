# Custodian
<span class="source-link">[[Source]](src/bureaucracy/custodian.md#L-0-3)</span>

A Custodian keeps a set of actors to dispose. When the Custodian is disposed,
it disposes of the actors in its set and then clears the set.

## Example program

Imagine you have a program with 3 actors that you need to shutdown when it
receives a TERM signal. We can set up a Custodian that knows about each
of our actors and when a TERM signal is received, is disposed of.

```pony
use "bureaucracy"
use "signals"

actor Actor1
  be dispose() => None // dispose of resources here.

actor Actor2
  be dispose() => None // dispose of resources here.

actor Actor3
  be dispose() => None // dispose of resources here.

actor Main
  new create(env: Env) =>
    let actor1 = Actor1
    let actor2 = Actor2
    let actor3 = Actor3

    let custodian = Custodian
    custodian(actor1)
    custodian(actor2)
    custodian(actor3)

    SignalHandler(TermHandler(custodian), Sig.term())

class TermHandler is SignalNotify
  let _custodian: Custodian

  new iso create(custodian: Custodian) =>
    _custodian = custodian

  fun ref apply(count: U32): Bool =>
    _custodian.dispose()
    true
```


```pony
actor tag Custodian
```

## Constructors

### create
<span class="source-link">[[Source]](src/bureaucracy/custodian.md#L-0-3)</span>


```pony
new tag create()
: Custodian tag^
```

#### Returns

* [Custodian](bureaucracy-Custodian.md) tag^

---

## Public Behaviours

### apply
<span class="source-link">[[Source]](src/bureaucracy/custodian.md#L-0-53)</span>


Add an actor to be disposed of.


```pony
be apply(
  worker: DisposableActor tag)
```
#### Parameters

*   worker: [DisposableActor](builtin-DisposableActor.md) tag

---

### remove
<span class="source-link">[[Source]](src/bureaucracy/custodian.md#L-0-59)</span>


Removes an actor from the set of things to be disposed.


```pony
be remove(
  worker: DisposableActor tag)
```
#### Parameters

*   worker: [DisposableActor](builtin-DisposableActor.md) tag

---

### dispose
<span class="source-link">[[Source]](src/bureaucracy/custodian.md#L-0-65)</span>


Dispose of the actors in the set and then clear the set.


```pony
be dispose()
```

---

