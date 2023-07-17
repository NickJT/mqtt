# AsioEventNotify
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-3)</span>
```pony
trait tag AsioEventNotify
```

## Private Behaviours

### _event_notify
<span class="source-link">[[Source]](src/builtin/asio_event.md#L-0-4)</span>


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

