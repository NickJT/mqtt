# PosixDate
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-5)</span>

Represents a proleptic Gregorian date and time, without specifying a
time zone. The day of month, month, day of week, and day of year are all
indexed from 1, i.e. January is 1, Monday is 1.


```pony
class ref PosixDate
```

## Constructors

### create
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-21)</span>


Create a date from a POSIX time. Negative arguments will be changed to zero.


```pony
new ref create(
  seconds: I64 val = 0,
  nanoseconds: I64 val = 0)
: PosixDate ref^
```
#### Parameters

*   seconds: [I64](builtin-I64.md) val = 0
*   nanoseconds: [I64](builtin-I64.md) val = 0

#### Returns

* [PosixDate](time-PosixDate.md) ref^

---

## Public fields

### var nsec: [I32](builtin-I32.md) val
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-11)</span>



---

### var sec: [I32](builtin-I32.md) val
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-12)</span>



---

### var min: [I32](builtin-I32.md) val
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-13)</span>



---

### var hour: [I32](builtin-I32.md) val
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-14)</span>



---

### var day_of_month: [I32](builtin-I32.md) val
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-15)</span>



---

### var month: [I32](builtin-I32.md) val
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-16)</span>



---

### var year: [I32](builtin-I32.md) val
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-17)</span>



---

### var day_of_week: [I32](builtin-I32.md) val
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-18)</span>



---

### var day_of_year: [I32](builtin-I32.md) val
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-19)</span>



---

## Public Functions

### time
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-29)</span>


Return a POSIX time. Treats the date as UTC.


```pony
fun box time()
: I64 val
```

#### Returns

* [I64](builtin-I64.md) val

---

### normal
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-35)</span>


Normalise all the fields of the date. For example, if the hour is 24, it is
set to 0 and the day is advanced. This allows fields to be changed naively,
eg. adding 1000 to hours to advance the time by 1000 hours, and then
normalising the date.


```pony
fun ref normal()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

### format
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-44)</span>


Format the time as for strftime.


```pony
fun box format(
  fmt: String val)
: String val ?
```
#### Parameters

*   fmt: [String](builtin-String.md) val

#### Returns

* [String](builtin-String.md) val ?

---

## Private Functions

### _negative_to_zero
<span class="source-link">[[Source]](src/time/posix_date.md#L-0-52)</span>


```pony
fun box _negative_to_zero(
  value: I64 val)
: I64 val
```
#### Parameters

*   value: [I64](builtin-I64.md) val

#### Returns

* [I64](builtin-I64.md) val

---

