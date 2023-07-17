# MinConfig
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-37)</span>
```pony
primitive val MinConfig
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-37)</span>


```pony
new val create()
: MinConfig val^
```

#### Returns

* [MinConfig](mqtt-configurator-MinConfig.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-37)</span>


```pony
fun box apply()
: HashMap[String val, String val, HashEq[String val] val] val
```

#### Returns

* [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-37)</span>


```pony
fun box eq(
  that: MinConfig val)
: Bool val
```
#### Parameters

*   that: [MinConfig](mqtt-configurator-MinConfig.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-37)</span>


```pony
fun box ne(
  that: MinConfig val)
: Bool val
```
#### Parameters

*   that: [MinConfig](mqtt-configurator-MinConfig.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

