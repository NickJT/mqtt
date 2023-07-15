# Promise\[A: [Any](builtin-Any.md) #share\]
<span class="source-link">[[Source]](src/promises/promise.md#L-0-3)</span>

A promise to eventually produce a result of type A. This promise can either
be fulfilled or rejected.

Any number of promises can be chained after this one.


```pony
actor tag Promise[A: Any #share]
```

## Constructors

### create
<span class="source-link">[[Source]](src/promises/promise.md#L-0-3)</span>


```pony
new tag create()
: Promise[A] tag^
```

#### Returns

* [Promise](promises-Promise.md)\[A\] tag^

---

## Public Behaviours

### apply
<span class="source-link">[[Source]](src/promises/promise.md#L-0-13)</span>


Fulfill the promise.


```pony
be apply(
  value: A)
```
#### Parameters

*   value: A

---

### reject
<span class="source-link">[[Source]](src/promises/promise.md#L-0-29)</span>


Reject the promise.


```pony
be reject()
```

---

## Public Functions

### next\[B: [Any](builtin-Any.md) #share\]
<span class="source-link">[[Source]](src/promises/promise.md#L-0-45)</span>


Chain a promise after this one.

When this promise is fulfilled, the result of type A is passed to the
fulfill function, generating in an intermediate result of type B. This
is then used to fulfill the next promise in the chain.

If there is no fulfill function, or if the fulfill function raises an
error, then the next promise in the chain will be rejected.

If this promise is rejected, this step's reject function is called with no
input, generating an intermediate result of type B which is used to
fulfill the next promise in the chain.

If there is no reject function, of if the reject function raises an error,
then the next promise in the chain will be rejected.


```pony
fun tag next[B: Any #share](
  fulfill: Fulfill[A, B] iso,
  rejected: Reject[B] iso = qualify)
: Promise[B] tag
```
#### Parameters

*   fulfill: [Fulfill](promises-Fulfill.md)\[A, B\] iso
*   rejected: [Reject](promises-Reject.md)\[B\] iso = qualify

#### Returns

* [Promise](promises-Promise.md)\[B\] tag

---

### flatten_next\[B: [Any](builtin-Any.md) #share\]
<span class="source-link">[[Source]](src/promises/promise.md#L-0-72)</span>


Chain a promise after this one and unwrap the promise returned from this
one.

`flatten_next` is a companion to `next`. It operates in an identical
fashion except for the type of the fulfilled promise. Whereas `next` takes
a function that returns a type `B`, `flatten_next` takes a function that
returns `Promise[B]`.

Why is `flatten_next` valuable given that next could take a `B` that is of
a type like `Promise[String]`? Let's start with some code to demonstrate the
problem that arises when returning `Promise[Promise[B]]` from `next`.

Let's say we have a library for accessing the GitHub REST API:

```pony
class GitHub
  new create(personal_access_token: String)

  fun get_repo(repo: String): Promise[Repository]

class Repository
  fun get_issue(number: I64): Promise[Issue]

class Issue
  fun title(): String
```

And we want to use this promise based API to look up the title of an issue.
Without `flatten_next`, we could attempt to do the following using `next`:

```pony
actor Main
  new create(env: Env) =>
    let repo: Promise[Repository] =
      GitHub("my token").get_repo("ponylang/ponyc")

    //
    // do something with the repo once the promise is fulfilled
    // in our case, get the issue
    //

    let issue = Promise[Promise[Issue]] =
      repo.next[Promise[Issue]](FetchIssue~apply(1))

    // once we get the issue, print the title
    issue.next[None](PrintIssueTitle~apply(env.out))

primitive FetchIssue
  fun apply(number: I64, repo: Repository): Promise[Issue] =>
    repo.get_issue(number)

primitive PrintIssueTitle
  fun apply(out: OutStream, issue: Promise[Issue]) =>
    // O NO! We can't print the title
    // We don't have an issue, we have a promise for an issue
```

Take a look at what happens in the example, when we get to
`PrintIssueTitle`, we can't print anything because we "don't have anything".
In order to print the issue title, we need an `Issue` not a
`Promise[Issue]`.

We could solve this by doing something like this:

```pony
primitive PrintIssueTitle
  fun apply(out: OutStream, issue: Promise[Issue]) =>
    issue.next[None](ActuallyPrintIssueTitle~apply(out))

primitive ActuallyPrintIssueTitle
  fun apply(out: OutStream, issue: Issue) =>
    out.print(issue.title())
```

That will work, however, it is kind of awful. When looking at:

```pony
    let repo: Promise[Repoository] =
      GitHub("my token").get_repo("ponylang/ponyc")
    let issue = Promise[Promise[Issue]] =
      repo.next[Promise[Issue]](FetchIssue~apply(1))
    issue.next[None](PrintIssueTitle~apply(env.out))
```

it can be hard to follow what is going on. We can only tell what is
happening because we gave `PrintIssueTitle` a very misleading name; it
doesn't print an issue title.

`flatten_next` addresses the problem of "we want the `Issue`, not the
intermediate `Promise`". `flatten_next` takes an intermediate promise and
unwraps it into the fulfilled type. You get to write your promise chain
without having to worry about intermediate promises.

Updated to use `flatten_next`, our API example becomes:

```pony
actor Main
  new create(env: Env) =>
    let repo: Promise[Repository] =
      GitHub("my token").get_repo("ponylang/ponyc")

    let issue = Promise[Issue] =
      repo.flatten_next[Issue](FetchIssue~apply(1))

    issue.next[None](PrintIssueTitle~apply(env.out))

primitive FetchIssue
  fun apply(number: I64, repo: Repository): Promise[Issue] =>
    repo.get_issue(number)

primitive PrintIssueTitle
  fun apply(out: OutStream, issue: Issue) =>
    out.print(issue.title())
```

Our promise `Issue`, is no longer a `Promise[Promise[Issue]]`. By using
`flatten_next`, we have a much more manageable `Promise[Issue]` instead.

Other than unwrapping promises for you, `flatten_next` otherwise acts the
same as `next` so all the same rules apply to fulfillment and rejection.


```pony
fun tag flatten_next[B: Any #share](
  fulfill: Fulfill[A, Promise[B] tag] iso,
  rejected: Reject[Promise[B] tag] iso = qualify)
: Promise[B] tag
```
#### Parameters

*   fulfill: [Fulfill](promises-Fulfill.md)\[A, [Promise](promises-Promise.md)\[B\] tag\] iso
*   rejected: [Reject](promises-Reject.md)\[[Promise](promises-Promise.md)\[B\] tag\] iso = qualify

#### Returns

* [Promise](promises-Promise.md)\[B\] tag

---

### add\[optional B: [Any](builtin-Any.md) #share\]
<span class="source-link">[[Source]](src/promises/promise.md#L-0-234)</span>


Add two promises into one promise that returns the result of both when
they are fulfilled. If either of the promises is rejected then the new
promise is also rejected.


```pony
fun tag add[optional B: Any #share](
  p: Promise[B] tag)
: Promise[(A , B)] tag
```
#### Parameters

*   p: [Promise](promises-Promise.md)\[B\] tag

#### Returns

* [Promise](promises-Promise.md)\[(A , B)\] tag

---

### join
<span class="source-link">[[Source]](src/promises/promise.md#L-0-270)</span>


Create a promise that is fulfilled when the receiver and all promises in
the given iterator are fulfilled. If the receiver or any promise in the
sequence is rejected then the new promise is also rejected.

Join `p1` and `p2` with an existing promise, `p3`.
```pony
use "promises"

actor Main
  new create(env: Env) =>

    let p1 = Promise[String val]
    let p2 = Promise[String val]
    let p3 = Promise[String val]

    p3.join([p1; p2].values())
      .next[None]({(a: Array[String val] val) =>
        for s in a.values() do
          env.out.print(s)
        end
      })

    p2("second")
    p3("third")
    p1("first")
```


```pony
fun tag join(
  ps: Iterator[Promise[A] tag] ref)
: Promise[Array[A] val] tag
```
#### Parameters

*   ps: [Iterator](builtin-Iterator.md)\[[Promise](promises-Promise.md)\[A\] tag\] ref

#### Returns

* [Promise](promises-Promise.md)\[[Array](builtin-Array.md)\[A\] val\] tag

---

### select
<span class="source-link">[[Source]](src/promises/promise.md#L-0-304)</span>


Return a promise that is fulfilled when either promise is fulfilled,
resulting in a tuple of its value and the other promise.


```pony
fun tag select(
  p: Promise[A] tag)
: Promise[(A , Promise[A] tag)] tag
```
#### Parameters

*   p: [Promise](promises-Promise.md)\[A\] tag

#### Returns

* [Promise](promises-Promise.md)\[(A , [Promise](promises-Promise.md)\[A\] tag)\] tag

---

### timeout
<span class="source-link">[[Source]](src/promises/promise.md#L-0-328)</span>


Reject the promise after the given expiration in nanoseconds.


```pony
fun tag timeout(
  expiration: U64 val)
: None val
```
#### Parameters

*   expiration: [U64](builtin-U64.md) val

#### Returns

* [None](builtin-None.md) val

---

## Private Behaviours

### _attach
<span class="source-link">[[Source]](src/promises/promise.md#L-0-341)</span>


Attaches a step asynchronously. If this promise has already been fulfilled
or rejected, immediately fulfill or reject the incoming step. Otherwise,
keep it in a list.


```pony
be _attach(
  attach: _IThen[A] iso)
```
#### Parameters

*   attach: [_IThen](promises-_IThen.md)\[A\] iso

---

