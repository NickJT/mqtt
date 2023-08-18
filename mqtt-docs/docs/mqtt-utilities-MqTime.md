# MqTime
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-6)</span>
```pony
class ref MqTime
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-10)</span>


```pony
new ref create()
: MqTime ref^
```

#### Returns

* [MqTime](mqtt-utilities-MqTime.md) ref^

---

### create_at
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-13)</span>


```pony
new ref create_at(
  s: I64 val,
  ns: I64 val)
: MqTime ref^
```
#### Parameters

*   s: [I64](builtin-I64.md) val
*   ns: [I64](builtin-I64.md) val

#### Returns

* [MqTime](mqtt-utilities-MqTime.md) ref^

---

## Public Functions

### elapsed
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-17)</span>


```pony
fun box elapsed()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

### startTime
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-22)</span>


```pony
fun box startTime()
: String val
```

#### Returns

* [String](builtin-String.md) val

---

## Private Functions

### _elapsed
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-29)</span>


```pony
fun box _elapsed(
  s: I64 val,
  ns: I64 val)
: (I64 val , I64 val)
```
#### Parameters

*   s: [I64](builtin-I64.md) val
*   ns: [I64](builtin-I64.md) val

#### Returns

* ([I64](builtin-I64.md) val , [I64](builtin-I64.md) val)

---

