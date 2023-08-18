# PonyTest package

The PonyTest package provides a unit testing framework. It is designed to be as
simple as possible to use, both for the unit test writer and the user running
the tests.

To help simplify test writing and distribution this package depends on as few
other packages as possible. Currently the required packages are:

* builtin
* time
* collections

Each unit test is a class, with a single test function. By default all tests
run concurrently.

Each test run is provided with a helper object. This provides logging and
assertion functions. By default log messages are only shown for tests that
fail.

When any assertion function fails the test is counted as a fail. However, tests
can also indicate failure by raising an error in the test function.

## Example program

To use PonyTest simply write a class for each test and a TestList type that
tells the PonyTest object about the tests. Typically the TestList will be Main
for the package.

The following is a complete program with 2 trivial tests.

```pony
use "pony_test"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    test(_TestAdd)
    test(_TestSub)

class iso _TestAdd is UnitTest
  fun name():String => "addition"

  fun apply(h: TestHelper) =>
    h.assert_eq[U32](4, 2 + 2)

class iso _TestSub is UnitTest
  fun name():String => "subtraction"

  fun apply(h: TestHelper) =>
    h.assert_eq[U32](2, 4 - 2)
```

The make() constructor is not needed for this example. However, it allows for
easy aggregation of tests (see below) so it is recommended that all test Mains
provide it.

Main.create() is called only for program invocations on the current package.
Main.make() is called during aggregation. If so desired extra code can be added
to either of these constructors to perform additional tasks.

## Test names

Tests are identified by names, which are used when printing test results and on
the command line to select which tests to run. These names are independent of
the names of the test classes in the Pony source code.

Arbitrary strings can be used for these names, but for large projects it is
strongly recommended to use a hierarchical naming scheme to make it easier to
select groups of tests.

You can skip any tests whose names start with a given string by using the
`--exclude=[prefix]` command line option.

You can run only tests whose names start with a given string by using the
`--only=[prefix]` command line option.

## Aggregation

Often it is desirable to run a collection of unit tests from multiple different
source files. For example, if several packages within a bundle each have their
own unit tests it may be useful to run all tests for the bundle together.

This can be achieved by writing an aggregate test list class, which calls the
list function for each package. The following is an example that aggregates the
tests from packages `foo` and `bar`.

```pony
use "pony_test"
use bar = "bar"
use foo = "foo"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  new make() =>
    None

  fun tag tests(test: PonyTest) =>
    bar.Main.make().tests(test)
    foo.Main.make().tests(test)
```

Aggregate test classes may themselves be aggregated. Every test list class may
contain any combination of its own tests and aggregated lists.

## Long tests

Simple tests run within a single function. When that function exits, either
returning or raising an error, the test is complete. This is not viable for
tests that need to use actors.

Long tests allow for delayed completion. Any test can call long_test() on its
TestHelper to indicate that it needs to keep running. When the test is finally
complete it calls complete() on its TestHelper.

The complete() function takes a Bool parameter to specify whether the test was
a success. If any asserts fail then the test will be considered a failure
regardless of the value of this parameter. However, complete() must still be
called.

Since failing tests may hang, a timeout must be specified for each long test.
When the test function exits a timer is started with the specified timeout. If
this timer fires before complete() is called the test is marked as a failure
and the timeout is reported.

On a timeout the timed_out() function is called on the unit test object. This
should perform whatever test specific tidy up is required to allow the program
to exit. There is no need to call complete() if a timeout occurs, although it
is not an error to do so.

Note that the timeout is only relevant when a test hangs and would otherwise
prevent the test program from completing. Setting a very long timeout on tests
that should not be able to hang is perfectly acceptable and will not make the
test take any longer if successful.

Timeouts should not be used as the standard method of detecting if a test has
failed.

## Exclusion groups

By default all tests are run concurrently. This may be a problem for some
tests, eg if they manipulate an external file or use a system resource. To fix
this issue any number of tests may be put into an exclusion group.

No tests that are in the same exclusion group will be run concurrently.

Exclusion groups are identified by name, arbitrary strings may be used.
Multiple exclusion groups may be used and tests in different groups may run
concurrently. Tests that do not specify an exclusion group may be run
concurrently with any other tests.

The command line option "--sequential" prevents any tests from running
concurrently, regardless of exclusion groups. This is intended for debugging
rather than standard use.

## Labels

Test can have label. Labels are used to filter which tests are run, by setting
command line argument `--label=[some custom label]`. It can be used to separate
unit tests from integration tests.

By default label is empty. You can set it up by overriding `label(): String`
method in unit test.

```pony
use "pony_test"

class iso _I8AddTest is UnitTest
  fun name(): String => "_I8AddTest"
  fun label(): String => "simple"
  fun apply(h: TestHelper) =>
    h.assert_eq[I8](1, 1)

```

## Setting up and tearing down a test environment

### Set Up

Any kind of fixture or environment necessary for executing a [UnitTest](pony_test-UnitTest.md)
can be set up either in the tests constructor or in a function called [set_up()](pony_test-UnitTest.md#set_up).

[set_up()](pony_test-UnitTest.md#set_up) is called before the test is executed. It is partial,
if it errors, the test is not executed but reported as failing during set up.
The test's [TestHelper](pony_test-TestHelper.md) is handed to [set_up()](pony_test-UnitTest.md#set_up)
in order to log messages or access the tests [Env](builtin-Env.md) via [TestHelper.env](pony_test-TestHelper.md#let-env-env-val).

### Tear Down

Each unit test object may define a [tear_down()](pony_test-UnitTest.md#tear_down) function. This is called after
the test has finished to allow tearing down of any complex environment that had
to be set up for the test.

The [tear_down()](pony_test-UnitTest.md#tear_down) function is called for each test regardless of whether it
passed or failed. If a test times out [tear_down()](pony_test-UnitTest.md#tear_down) will be called after
timed_out() returns.

When a test is in an exclusion group, the [tear_down()](pony_test-UnitTest.md#tear_down) call is considered part
of the tests run. The next test in the exclusion group will not start until
after [tear_down()](pony_test-UnitTest.md#tear_down) returns on the current test.

The test's [TestHelper](pony_test-TestHelper.md) is handed to [tear_down()](pony_test-UnitTest.md#tear_down) and it is permitted to log
messages and call assert functions during tear down.

### Example

The following example creates a temporary directory in the [set_up()](pony_test-UnitTest.md#set_up) function
and removes it in the [tear_down()](pony_test-UnitTest.md#tear_down) function, thus
simplifying the test function itself:

```pony
use "pony_test"
use "files"

class iso TempDirTest
  var tmp_dir: (FilePath | None) = None

  fun name(): String => "temp-dir"

  fun ref set_up(h: TestHelper)? =>
    tmp_dir = FilePath.mkdtemp(FileAuth(h.env.root), "temp-dir")?

  fun ref tear_down(h: TestHelper) =>
    try
      (tmp_dir as FilePath).remove()
    end

  fun apply(h: TestHelper)? =>
    let dir = tmp_dir as FilePath
    // do something inside the temporary directory
```



## Public Types

* [interface ITest](pony_test-ITest.md)
* [actor PonyTest](pony_test-PonyTest.md)
* [class TestHelper](pony_test-TestHelper.md)
* [trait TestList](pony_test-TestList.md)
* [trait UnitTest](pony_test-UnitTest.md)


## Private Types

* [primitive _Color](pony_test-_Color.md)
* [actor _ExclusiveGroup](pony_test-_ExclusiveGroup.md)
* [trait _Group](pony_test-_Group.md)
* [actor _SimultaneousGroup](pony_test-_SimultaneousGroup.md)
* [class _TestRecord](pony_test-_TestRecord.md)
* [actor _TestRunner](pony_test-_TestRunner.md)
