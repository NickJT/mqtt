# _TestRunner
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-3)</span>

Per unit test actor that runs the test and keeps the log for it.


```pony
actor tag _TestRunner
```

## Constructors

### create
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-26)</span>


Create a new TestHelper.
ponytest - The authority we report everything to.
id - Test identifier needed when reporting to ponytest.
test - The test to run.
group - The group this test is in, which must be notified when we finish.
env - The system environment, which is made available to tests.
timers - The timer group we use to set long test timeouts.


```pony
new tag create(
  ponytest: PonyTest tag,
  id: USize val,
  test: UnitTest iso,
  group: _Group tag,
  verbose: Bool val,
  env: Env val,
  timers: Timers tag)
: _TestRunner tag^
```
#### Parameters

*   ponytest: [PonyTest](pony_test-PonyTest.md) tag
*   id: [USize](builtin-USize.md) val
*   test: [UnitTest](pony_test-UnitTest.md) iso
*   group: [_Group](pony_test-_Group.md) tag
*   verbose: [Bool](builtin-Bool.md) val
*   env: [Env](builtin-Env.md) val
*   timers: [Timers](time-Timers.md) tag

#### Returns

* [_TestRunner](pony_test-_TestRunner.md) tag^

---

## Public Behaviours

### run
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-53)</span>


Run our test.


```pony
be run()
```

---

### log
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-76)</span>


Log the given message.

The verbose parameter allows messages to be printed only when the --verbose
command line option is used.

Logs are printed one test at a time to avoid interleaving log lines from
concurrent tests.


```pony
be log(
  msg: String val,
  verbose: Bool val)
```
#### Parameters

*   msg: [String](builtin-String.md) val
*   verbose: [Bool](builtin-Bool.md) val

---

### fail
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-88)</span>


Flag the test as having failed.


```pony
be fail(
  msg: String val)
```
#### Parameters

*   msg: [String](builtin-String.md) val

---

### complete
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-95)</span>


MUST be called by each long test to indicate the test has finished, unless
a timeout occurs.

The "success" parameter specifies whether the test succeeded. However if
the test has already been flagged as failing, then the test is considered a
failure, regardless of the value of this parameter.

Once this is called tear_down() may be called at any time.


```pony
be complete(
  success: Bool val)
```
#### Parameters

*   success: [Bool](builtin-Bool.md) val

---

### expect_action
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-122)</span>


Can be called in a long test to set up expectations for one or more actions
that, when all completed, will complete the test.

This pattern is useful for cases where you have multiple things that need
to happen to complete your test, but don't want to have to collect them
all yourself into a single actor that calls the complete method.


```pony
be expect_action(
  name: String val)
```
#### Parameters

*   name: [String](builtin-String.md) val

---

### complete_action
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-134)</span>


MUST be called for each action expectation that was set up in a long test
to fulfill the expectations. Any expectations that are still outstanding
when the long test timeout runs out will be printed by name when it fails.

Completing all outstanding actions is enough to finish the test. There's no
need to also call the complete method when the actions are finished.

Calling the complete method will finish the test immediately, without
waiting for any outstanding actions to be completed.

Completing an action with success = false will cause the entire test to
fail immediately, without waiting the rest of the outstanding actions.
The name of the failed action will be included in the failure output.


```pony
be complete_action(
  name: String val,
  success: Bool val)
```
#### Parameters

*   name: [String](builtin-String.md) val
*   success: [Bool](builtin-Bool.md) val

---

### dispose_when_done
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-169)</span>


Pass a disposable actor to be disposed of when the test is complete.
The actor will be disposed no matter whether the test succeeds or fails.

If the test is already tearing down, the actor will be disposed immediately.


```pony
be dispose_when_done(
  disposable: DisposableActor tag)
```
#### Parameters

*   disposable: [DisposableActor](builtin-DisposableActor.md) tag

---

### long_test
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-195)</span>


The test has been flagged as a long test.


```pony
be long_test(
  timeout: U64 val)
```
#### Parameters

*   timeout: [U64](builtin-U64.md) val

---

## Private Behaviours

### _finished
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-182)</span>


Called when the test function completes.
If long_test() is going to be called, it must have been by now.


```pony
be _finished()
```

---

### _timeout
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-226)</span>


Called when the long test timeout expires.


```pony
be _timeout()
```

---

### _close
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-271)</span>


Close down this test and send a report.


```pony
be _close()
```

---

## Private Functions

### _log
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-244)</span>


Write the given message direct to our log.


```pony
fun ref _log(
  msg: String val,
  verbose: Bool val)
: None val
```
#### Parameters

*   msg: [String](builtin-String.md) val
*   verbose: [Bool](builtin-Bool.md) val

#### Returns

* [None](builtin-None.md) val

---

### _tear_down
<span class="source-link">[[Source]](src/pony_test/_test_runner.md#L-0-252)</span>


Check if the test has finished and tear it down if necessary.


```pony
fun ref _tear_down()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

