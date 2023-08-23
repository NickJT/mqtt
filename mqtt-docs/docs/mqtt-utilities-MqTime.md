# MqTime
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-6)</span>
```pony
class ref MqTime
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-9)</span>


```pony
new ref create()
: MqTime ref^
```

#### Returns

* [MqTime](mqtt-utilities-MqTime.md) ref^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-13)</span>


```pony
fun box apply()
: Array[U8 val] val
```

#### Returns

* [Array](builtin-Array.md)\[[U8](builtin-U8.md) val\] val

---

### elapsed
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-20)</span>


```pony
fun ref elapsed()
: I64 val
```

#### Returns

* [I64](builtin-I64.md) val

---

## Private Functions

### _toNs
<span class="source-link">[[Source]](src/mqtt-utilities/timestamps.md#L-0-24)</span>


```pony
fun ref _toNs(
  s: I64 val,
  ns: I64 val)
: U128 val
```
#### Parameters

*   s: [I64](builtin-I64.md) val
*   ns: [I64](builtin-I64.md) val

#### Returns

* [U128](builtin-U128.md) val

---

