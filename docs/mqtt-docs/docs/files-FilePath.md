# FilePath
<span class="source-link">[[Source]](src/files/file_path.md#L-0-41)</span>

A FilePath represents a capability to access a path. The path will be
represented as an absolute path and a set of capabilities for operations on
that path.


```pony
class val FilePath
```

## Constructors

### create
<span class="source-link">[[Source]](src/files/file_path.md#L-0-56)</span>


Create a new path to any location.

Unless absolute, path' will be relative to the program's working directory.

Capabilities are exactly as given.


```pony
new val create(
  base: FileAuth val,
  path': String val,
  caps': Flags[(FileCreate val | FileChmod val | FileChown val | FileLink val | FileLookup val | FileMkdir val | FileRead val | FileRemove val | FileRename val | FileSeek val | FileStat val | FileSync val | FileTime val | FileTruncate val | FileWrite val | FileExec val), U32 val] val = recover)
: FilePath val^
```
#### Parameters

*   base: [FileAuth](files-FileAuth.md) val
*   path': [String](builtin-String.md) val
*   caps': [Flags](collections-Flags.md)\[([FileCreate](files-FileCreate.md) val | [FileChmod](files-FileChmod.md) val | [FileChown](files-FileChown.md) val | [FileLink](files-FileLink.md) val | [FileLookup](files-FileLookup.md) val | [FileMkdir](files-FileMkdir.md) val | [FileRead](files-FileRead.md) val | [FileRemove](files-FileRemove.md) val | [FileRename](files-FileRename.md) val | [FileSeek](files-FileSeek.md) val | [FileStat](files-FileStat.md) val | [FileSync](files-FileSync.md) val | [FileTime](files-FileTime.md) val | [FileTruncate](files-FileTruncate.md) val | [FileWrite](files-FileWrite.md) val | [FileExec](files-FileExec.md) val), [U32](builtin-U32.md) val\] val = recover

#### Returns

* [FilePath](files-FilePath.md) val^

---

### from
<span class="source-link">[[Source]](src/files/file_path.md#L-0-71)</span>


Create a new path from an existing `FilePath`.

path' is relative to the existing `FilePath`,
and the existing `FilePath` must be a prefix of the resulting path.

The resulting `FilePath` will have capabilities that are the intersection of
the supplied capabilities and the capabilities of the existing `FilePath`.


```pony
new val from(
  base: FilePath val,
  path': String val,
  caps': Flags[(FileCreate val | FileChmod val | FileChown val | FileLink val | FileLookup val | FileMkdir val | FileRead val | FileRemove val | FileRename val | FileSeek val | FileStat val | FileSync val | FileTime val | FileTruncate val | FileWrite val | FileExec val), U32 val] val = recover)
: FilePath val^ ?
```
#### Parameters

*   base: [FilePath](files-FilePath.md) val
*   path': [String](builtin-String.md) val
*   caps': [Flags](collections-Flags.md)\[([FileCreate](files-FileCreate.md) val | [FileChmod](files-FileChmod.md) val | [FileChown](files-FileChown.md) val | [FileLink](files-FileLink.md) val | [FileLookup](files-FileLookup.md) val | [FileMkdir](files-FileMkdir.md) val | [FileRead](files-FileRead.md) val | [FileRemove](files-FileRemove.md) val | [FileRename](files-FileRename.md) val | [FileSeek](files-FileSeek.md) val | [FileStat](files-FileStat.md) val | [FileSync](files-FileSync.md) val | [FileTime](files-FileTime.md) val | [FileTruncate](files-FileTruncate.md) val | [FileWrite](files-FileWrite.md) val | [FileExec](files-FileExec.md) val), [U32](builtin-U32.md) val\] val = recover

#### Returns

* [FilePath](files-FilePath.md) val^ ?

---

### mkdtemp
<span class="source-link">[[Source]](src/files/file_path.md#L-0-98)</span>


Create a temporary directory and returns a path to it. The directory's name
will begin with `prefix`.

If `FileAuth` is provided, the resulting `FilePath` will
be relative to the program's working directory. Otherwise, it will be
relative to the existing `FilePath`, and the existing `FilePath` must be a
prefix of the resulting path.

The resulting `FilePath` will have capabilities that are the intersection
of the supplied capabilities and the capabilities on the base.


```pony
new val mkdtemp(
  base: (FileAuth val | FilePath val),
  prefix: String val = "",
  caps': Flags[(FileCreate val | FileChmod val | FileChown val | FileLink val | FileLookup val | FileMkdir val | FileRead val | FileRemove val | FileRename val | FileSeek val | FileStat val | FileSync val | FileTime val | FileTruncate val | FileWrite val | FileExec val), U32 val] val = recover)
: FilePath val^ ?
```
#### Parameters

*   base: ([FileAuth](files-FileAuth.md) val | [FilePath](files-FilePath.md) val)
*   prefix: [String](builtin-String.md) val = ""
*   caps': [Flags](collections-Flags.md)\[([FileCreate](files-FileCreate.md) val | [FileChmod](files-FileChmod.md) val | [FileChown](files-FileChown.md) val | [FileLink](files-FileLink.md) val | [FileLookup](files-FileLookup.md) val | [FileMkdir](files-FileMkdir.md) val | [FileRead](files-FileRead.md) val | [FileRemove](files-FileRemove.md) val | [FileRename](files-FileRename.md) val | [FileSeek](files-FileSeek.md) val | [FileStat](files-FileStat.md) val | [FileSync](files-FileSync.md) val | [FileTime](files-FileTime.md) val | [FileTruncate](files-FileTruncate.md) val | [FileWrite](files-FileWrite.md) val | [FileExec](files-FileExec.md) val), [U32](builtin-U32.md) val\] val = recover

#### Returns

* [FilePath](files-FilePath.md) val^ ?

---

### _create
<span class="source-link">[[Source]](src/files/file_path.md#L-0-135)</span>


Internal constructor.


```pony
new val _create(
  path': String val,
  caps': Flags[(FileCreate val | FileChmod val | FileChown val | FileLink val | FileLookup val | FileMkdir val | FileRead val | FileRemove val | FileRename val | FileSeek val | FileStat val | FileSync val | FileTime val | FileTruncate val | FileWrite val | FileExec val), U32 val] val)
: FilePath val^
```
#### Parameters

*   path': [String](builtin-String.md) val
*   caps': [Flags](collections-Flags.md)\[([FileCreate](files-FileCreate.md) val | [FileChmod](files-FileChmod.md) val | [FileChown](files-FileChown.md) val | [FileLink](files-FileLink.md) val | [FileLookup](files-FileLookup.md) val | [FileMkdir](files-FileMkdir.md) val | [FileRead](files-FileRead.md) val | [FileRemove](files-FileRemove.md) val | [FileRename](files-FileRename.md) val | [FileSeek](files-FileSeek.md) val | [FileStat](files-FileStat.md) val | [FileSync](files-FileSync.md) val | [FileTime](files-FileTime.md) val | [FileTruncate](files-FileTruncate.md) val | [FileWrite](files-FileWrite.md) val | [FileExec](files-FileExec.md) val), [U32](builtin-U32.md) val\] val

#### Returns

* [FilePath](files-FilePath.md) val^

---

## Public fields

### let path: [String](builtin-String.md) val
<span class="source-link">[[Source]](src/files/file_path.md#L-0-47)</span>

Absolute filesystem path.




---

### let caps: [Flags](collections-Flags.md)\[([FileCreate](files-FileCreate.md) val | [FileChmod](files-FileChmod.md) val | [FileChown](files-FileChown.md) val | [FileLink](files-FileLink.md) val | [FileLookup](files-FileLookup.md) val | [FileMkdir](files-FileMkdir.md) val | [FileRead](files-FileRead.md) val | [FileRemove](files-FileRemove.md) val | [FileRename](files-FileRename.md) val | [FileSeek](files-FileSeek.md) val | [FileStat](files-FileStat.md) val | [FileSync](files-FileSync.md) val | [FileTime](files-FileTime.md) val | [FileTruncate](files-FileTruncate.md) val | [FileWrite](files-FileWrite.md) val | [FileExec](files-FileExec.md) val), [U32](builtin-U32.md) val\] ref
<span class="source-link">[[Source]](src/files/file_path.md#L-0-51)</span>

Set of capabilities for operations on `path`.




---

## Public Functions

### join
<span class="source-link">[[Source]](src/files/file_path.md#L-0-142)</span>


Return a new path relative to this one.


```pony
fun val join(
  path': String val,
  caps': Flags[(FileCreate val | FileChmod val | FileChown val | FileLink val | FileLookup val | FileMkdir val | FileRead val | FileRemove val | FileRename val | FileSeek val | FileStat val | FileSync val | FileTime val | FileTruncate val | FileWrite val | FileExec val), U32 val] val = recover)
: FilePath val ?
```
#### Parameters

*   path': [String](builtin-String.md) val
*   caps': [Flags](collections-Flags.md)\[([FileCreate](files-FileCreate.md) val | [FileChmod](files-FileChmod.md) val | [FileChown](files-FileChown.md) val | [FileLink](files-FileLink.md) val | [FileLookup](files-FileLookup.md) val | [FileMkdir](files-FileMkdir.md) val | [FileRead](files-FileRead.md) val | [FileRemove](files-FileRemove.md) val | [FileRename](files-FileRename.md) val | [FileSeek](files-FileSeek.md) val | [FileStat](files-FileStat.md) val | [FileSync](files-FileSync.md) val | [FileTime](files-FileTime.md) val | [FileTruncate](files-FileTruncate.md) val | [FileWrite](files-FileWrite.md) val | [FileExec](files-FileExec.md) val), [U32](builtin-U32.md) val\] val = recover

#### Returns

* [FilePath](files-FilePath.md) val ?

---

### walk
<span class="source-link">[[Source]](src/files/file_path.md#L-0-152)</span>


Walks a directory structure starting at this.

`handler(dir_path, dir_entries)` will be called for each directory
starting with this one. The handler can control which subdirectories are
expanded by removing them from the `dir_entries` list.


```pony
fun val walk(
  handler: WalkHandler ref,
  follow_links: Bool val = false)
: None val
```
#### Parameters

*   handler: [WalkHandler](files-WalkHandler.md) ref
*   follow_links: [Bool](builtin-Bool.md) val = false

#### Returns

* [None](builtin-None.md) val

---

### canonical
<span class="source-link">[[Source]](src/files/file_path.md#L-0-176)</span>


Return the equivalent canonical absolute path. Raise an error if there
isn't one.


```pony
fun val canonical()
: FilePath val ?
```

#### Returns

* [FilePath](files-FilePath.md) val ?

---

### exists
<span class="source-link">[[Source]](src/files/file_path.md#L-0-183)</span>


Returns true if the path exists. Returns false for a broken symlink.


```pony
fun val exists()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### mkdir
<span class="source-link">[[Source]](src/files/file_path.md#L-0-193)</span>


Creates the directory. Will recursively create each element. Returns true
if the directory exists when we're done, false if it does not. If we do not
have the FileStat permission, this will return false even if the directory
does exist.


```pony
fun val mkdir(
  must_create: Bool val = false)
: Bool val
```
#### Parameters

*   must_create: [Bool](builtin-Bool.md) val = false

#### Returns

* [Bool](builtin-Bool.md) val

---

### remove
<span class="source-link">[[Source]](src/files/file_path.md#L-0-240)</span>


Remove the file or directory. The directory contents will be removed as
well, recursively. Symlinks will be removed but not traversed.


```pony
fun val remove()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### rename
<span class="source-link">[[Source]](src/files/file_path.md#L-0-282)</span>


Rename a file or directory.


```pony
fun box rename(
  new_path: FilePath val)
: Bool val
```
#### Parameters

*   new_path: [FilePath](files-FilePath.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### symlink
<span class="source-link">[[Source]](src/files/file_path.md#L-0-292)</span>


Create a symlink to a file or directory.

Note that on Windows a program must be running with elevated priviledges to
be able to create symlinks.


```pony
fun val symlink(
  link_name: FilePath val)
: Bool val
```
#### Parameters

*   link_name: [FilePath](files-FilePath.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### chmod
<span class="source-link">[[Source]](src/files/file_path.md#L-0-358)</span>


Set the FileMode for a path.


```pony
fun box chmod(
  mode: FileMode box)
: Bool val
```
#### Parameters

*   mode: [FileMode](files-FileMode.md) box

#### Returns

* [Bool](builtin-Bool.md) val

---

### chown
<span class="source-link">[[Source]](src/files/file_path.md#L-0-374)</span>


Set the owner and group for a path. Does nothing on Windows.


```pony
fun box chown(
  uid: U32 val,
  gid: U32 val)
: Bool val
```
#### Parameters

*   uid: [U32](builtin-U32.md) val
*   gid: [U32](builtin-U32.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### touch
<span class="source-link">[[Source]](src/files/file_path.md#L-0-388)</span>


Set the last access and modification times of a path to now.


```pony
fun box touch()
: Bool val
```

#### Returns

* [Bool](builtin-Bool.md) val

---

### set_time
<span class="source-link">[[Source]](src/files/file_path.md#L-0-394)</span>


Set the last access and modification times of a path to the given values.


```pony
fun box set_time(
  atime: (I64 val , I64 val),
  mtime: (I64 val , I64 val))
: Bool val
```
#### Parameters

*   atime: ([I64](builtin-I64.md) val , [I64](builtin-I64.md) val)
*   mtime: ([I64](builtin-I64.md) val , [I64](builtin-I64.md) val)

#### Returns

* [Bool](builtin-Bool.md) val

---

