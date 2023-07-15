# FullConfig
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-8)</span>
```pony
primitive val FullConfig
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-8)</span>


```pony
new val create()
: FullConfig val^
```

#### Returns

* [FullConfig](mqtt-configurator-FullConfig.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-8)</span>


```pony
fun box apply()
: HashMap[String val, String val, HashEq[String val] val] val
```

#### Returns

* [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

---

### eq
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-8)</span>


```pony
fun box eq(
  that: FullConfig val)
: Bool val
```
#### Parameters

*   that: [FullConfig](mqtt-configurator-FullConfig.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/mqtt-configurator/tests.md#L-0-8)</span>


```pony
fun box ne(
  that: FullConfig val)
: Bool val
```
#### Parameters

*   that: [FullConfig](mqtt-configurator-FullConfig.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

