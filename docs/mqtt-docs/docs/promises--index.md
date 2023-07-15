# Promises Package

A `Promise` represents a value that will be available at a later
time. `Promise`s can either be fulfilled with a value or rejected. Any
number of function handlers can be added to the `Promise`, to be
called when the `Promise` is fulfilled or rejected. These handlers
themselves are also wrapped in `Promise`s so that they can be chained
together in order for the fulfilled value of one `Promise` to be used
to compute a value which will be used to fulfill the next `Promise` in
the chain, or so that if the `Promise` is rejected then the subsequent
reject functions will also be called. The input and output types of a
fulfill handler do not have to be the same, so a chain of fulfill
handlers can transform the original value into something new.

Fulfill and reject handlers can either be specified as classes that
implment the `Fulfill` and `Reject` interfaces, or as functions with
the same signatures as the `apply` methods in `Fulfill` and `Reject`.

In the following code, the fulfillment of the `Promise` causes the
execution of several fulfillment functions. The output is:

```
fulfilled + foo
fulfilled + bar
fulfilled + baz
```

```pony
use "promises"

class PrintFulfill is Fulfill[String, String]
  let _env: Env
  let _msg: String
  new create(env: Env, msg: String) =>
    _env = env
    _msg = msg
  fun apply(s: String): String =>
    _env.out.print(" + ".join([s; _msg].values()))
    s

actor Main
  new create(env: Env) =>
     let promise = Promise[String]
     promise.next[String](recover PrintFulfill(env, "foo") end)
     promise.next[String](recover PrintFulfill(env, "bar") end)
     promise.next[String](recover PrintFulfill(env, "baz") end)
     promise("fulfilled")
```

In the following code, the fulfill functions are chained together so
that the fulfilled value of the first one is used to generate a value
which fulfills the second one, which in turn is used to compute a
value which fulfills the third one, which in turn is used to compute a
value which fulfills the fourth one. The output is the average length
of the words passed on the command line or `0` if there are no command
line arguments.

```pony
use "promises"

primitive Computation
  fun tag string_to_strings(s: String): Array[String] val =>
    recover s.split() end
  fun tag strings_to_sizes(sa: Array[String] val): Array[USize] val =>
    recover
      let len = Array[USize]
      for s in sa.values() do
        len.push(s.size())
      end
      len
    end
  fun tag sizes_to_avg(sza: Array[USize] val): USize =>
    var acc = USize(0)
    for sz in sza.values() do
      acc = acc + sz
    end
    acc / sza.size()
  fun tag output(env: Env, sz: USize): None =>
    env.out.print(sz.string())

actor Main
  new create(env: Env) =>
     let promise = Promise[String]
     promise.next[Array[String] val](recover Computation~string_to_strings() end)
            .next[Array[USize] val](recover Computation~strings_to_sizes() end)
            .next[USize](recover Computation~sizes_to_avg() end)
            .next[None](recover Computation~output(env) end)
     promise(" ".join(env.args.slice(1).values()))
```


## Public Types

* [interface Fulfill](promises-Fulfill.md)
* [class FulfillIdentity](promises-FulfillIdentity.md)
* [actor Promise](promises-Promise.md)
* [primitive Promises](promises-Promises.md)
* [interface Reject](promises-Reject.md)
* [class RejectAlways](promises-RejectAlways.md)


## Private Types

* [interface _IThen](promises-_IThen.md)
* [actor _Join](promises-_Join.md)
* [primitive _None](promises-_None.md)
* [primitive _Pending](promises-_Pending.md)
* [class _PromiseFulFill](promises-_PromiseFulFill.md)
* [primitive _Reject](promises-_Reject.md)
* [class _Then](promises-_Then.md)
