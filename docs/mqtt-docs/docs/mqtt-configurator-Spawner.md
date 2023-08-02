# Spawner
<span class="source-link">[[Source]](src/mqtt-configurator/spawner.md#L-0-11)</span>
```pony
actor tag Spawner
```

## Constructors

### create
<span class="source-link">[[Source]](src/mqtt-configurator/spawner.md#L-0-19)</span>


```pony
new tag create(
  reg: Registrar tag,
  subs: HashMap[String val, String val, HashEq[String val] val] val)
: Spawner tag^
```
#### Parameters

*   reg: [Registrar](bureaucracy-Registrar.md) tag
*   subs: [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val

#### Returns

* [Spawner](mqtt-configurator-Spawner.md) tag^

---

## Public Behaviours

### brokerSubs
<span class="source-link">[[Source]](src/mqtt-configurator/spawner.md#L-0-32)</span>


```pony
be brokerSubs(
  cmd: (Sub val | UnSub val))
```
#### Parameters

*   cmd: ([Sub](mqtt-primitives-Sub.md) val | [UnSub](mqtt-primitives-UnSub.md) val)

---

### testSubs
<span class="source-link">[[Source]](src/mqtt-configurator/spawner.md#L-0-35)</span>


```pony
be testSubs(
  cmd: (Sub val | UnSub val))
```
#### Parameters

*   cmd: ([Sub](mqtt-primitives-Sub.md) val | [UnSub](mqtt-primitives-UnSub.md) val)

---

### unSubAll
<span class="source-link">[[Source]](src/mqtt-configurator/spawner.md#L-0-38)</span>


```pony
be unSubAll()
```

---

### perfTest
<span class="source-link">[[Source]](src/mqtt-configurator/spawner.md#L-0-43)</span>


```pony
be perfTest()
```

---

### loadTest
<span class="source-link">[[Source]](src/mqtt-configurator/spawner.md#L-0-48)</span>


```pony
be loadTest()
```

---

### mute
<span class="source-link">[[Source]](src/mqtt-configurator/spawner.md#L-0-52)</span>


```pony
be mute()
```

---

## Public Functions

### subscribermicator
<span class="source-link">[[Source]](src/mqtt-configurator/spawner.md#L-0-58)</span>


Subscribing and unsubscribing from a map of topics


```pony
fun ref subscribermicator(
  subs: HashMap[String val, String val, HashEq[String val] val] val,
  cmd: (Sub val | UnSub val))
: None val
```
#### Parameters

*   subs: [HashMap](collections-HashMap.md)\[[String](builtin-String.md) val, [String](builtin-String.md) val, [HashEq](collections-HashEq.md)\[[String](builtin-String.md) val\] val\] val
*   cmd: ([Sub](mqtt-primitives-Sub.md) val | [UnSub](mqtt-primitives-UnSub.md) val)

#### Returns

* [None](builtin-None.md) val

---

