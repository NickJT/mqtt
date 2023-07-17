# OpenFile
<span class="source-link">[[Source]](src/files/file.md#L-0-66)</span>

Open a File for read only.


```pony
primitive val OpenFile
```

## Constructors

### create
<span class="source-link">[[Source]](src/files/file.md#L-0-66)</span>


```pony
new val create()
: OpenFile val^
```

#### Returns

* [OpenFile](files-OpenFile.md) val^

---

## Public Functions

### apply
<span class="source-link">[[Source]](src/files/file.md#L-0-70)</span>


```pony
fun box apply(
  from: FilePath val)
: (File ref | FileOK val | FileError val | 
    FileEOF val | FileBadFileNumber val | FileExists val | 
    FilePermissionDenied val)
```
#### Parameters

*   from: [FilePath](files-FilePath.md) val

#### Returns

* ([File](files-File.md) ref | [FileOK](files-FileOK.md) val | [FileError](files-FileError.md) val | 
    [FileEOF](files-FileEOF.md) val | [FileBadFileNumber](files-FileBadFileNumber.md) val | [FileExists](files-FileExists.md) val | 
    [FilePermissionDenied](files-FilePermissionDenied.md) val)

---

### eq
<span class="source-link">[[Source]](src/files/file.md#L-0-70)</span>


```pony
fun box eq(
  that: OpenFile val)
: Bool val
```
#### Parameters

*   that: [OpenFile](files-OpenFile.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/files/file.md#L-0-70)</span>


```pony
fun box ne(
  that: OpenFile val)
: Bool val
```
#### Parameters

*   that: [OpenFile](files-OpenFile.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

