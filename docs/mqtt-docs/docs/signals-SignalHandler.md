# SignalHandler
<span class="source-link">[[Source]](src/signals/signal_handler.md#L-0-10)</span>

Listen for a specific signal.
If the wait parameter is true, the program will not terminate until the SignalHandler's dispose method is called, or if the SignalNotify returns false, after handling the signal as this also disposes the SignalHandler and unsubscribes it.



```pony
actor tag SignalHandler is
  AsioEventNotify tag
```

#### Implements

* [AsioEventNotify](builtin-AsioEventNotify.md) tag

---

## Constructors

### create
<span class="source-link">[[Source]](src/signals/signal_handler.md#L-0-20)</span>


Create a signal handler.


```pony
new tag create(
  notify: SignalNotify iso,
  sig: U32 val,
  wait: Bool val = false)
: SignalHandler tag^
```
#### Parameters

*   notify: [SignalNotify](signals-SignalNotify.md) iso
*   sig: [U32](builtin-U32.md) val
*   wait: [Bool](builtin-Bool.md) val = false

#### Returns

* [SignalHandler](signals-SignalHandler.md) tag^

---

## Public Behaviours

### raise
<span class="source-link">[[Source]](src/signals/signal_handler.md#L-0-29)</span>


Raise the signal.


```pony
be raise()
```

---

### dispose
<span class="source-link">[[Source]](src/signals/signal_handler.md#L-0-35)</span>


Dispose of the signal handler.


```pony
be dispose()
```

---

## Private Behaviours

### _event_notify
<span class="source-link">[[Source]](src/signals/signal_handler.md#L-0-41)</span>


Called when the signal is received, or when the AsioEventID can be
destroyed.


```pony
be _event_notify(
  event: Pointer[AsioEvent val] tag,
  flags: U32 val,
  arg: U32 val)
```
#### Parameters

*   event: [Pointer](builtin-Pointer.md)\[[AsioEvent](builtin-AsioEvent.md) val\] tag
*   flags: [U32](builtin-U32.md) val
*   arg: [U32](builtin-U32.md) val

---

## Private Functions

### _dispose
<span class="source-link">[[Source]](src/signals/signal_handler.md#L-0-54)</span>


Dispose of the AsioEventID.


```pony
fun ref _dispose()
: None val
```

#### Returns

* [None](builtin-None.md) val

---

