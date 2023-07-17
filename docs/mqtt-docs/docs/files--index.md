# Files package

The Files package provides classes for working with files and
directories.

Files are identified by `FilePath` objects, which represent both the
path to the file and the capabilites for accessing the file at that
path. `FilePath` objects can be used with the `CreateFile` and
`OpenFile` primitives and the `File` class to get a reference to a
file that can be used to write to and/or read from the file. It can
also be used with the `Directory` object to get a reference to a
directory object that can be used for directory operations.

The `FileLines` class allows a file to be accessed one line at a time.

The `FileStream` actor provides the ability to asynchronously write to
a file.

The `Path` primitive can be used to do path-related operations on
strings and characters.

# Example program

This program opens the files that are given as command line arguments
and prints their contents.

```pony
use "files"

actor Main
  new create(env: Env) =>
    for file_name in env.args.slice(1).values() do
      let path = FilePath(FileAuth(env.root), file_name)
      match OpenFile(path)
      | let file: File =>
        while file.errno() is FileOK do
          env.out.write(file.read(1024))
        end
      else
        env.err.print("Error opening file '" + file_name + "'")
      end
    end
```


## Public Types

* [primitive CreateFile](files-CreateFile.md)
* [class Directory](files-Directory.md)
* [class File](files-File.md)
* [primitive FileAuth](files-FileAuth.md)
* [primitive FileBadFileNumber](files-FileBadFileNumber.md)
* [type FileCaps](files-FileCaps.md)
* [primitive FileChmod](files-FileChmod.md)
* [primitive FileChown](files-FileChown.md)
* [primitive FileCreate](files-FileCreate.md)
* [primitive FileEOF](files-FileEOF.md)
* [type FileErrNo](files-FileErrNo.md)
* [primitive FileError](files-FileError.md)
* [primitive FileExec](files-FileExec.md)
* [primitive FileExists](files-FileExists.md)
* [class FileInfo](files-FileInfo.md)
* [class FileLines](files-FileLines.md)
* [primitive FileLink](files-FileLink.md)
* [primitive FileLookup](files-FileLookup.md)
* [primitive FileMkdir](files-FileMkdir.md)
* [class FileMode](files-FileMode.md)
* [primitive FileOK](files-FileOK.md)
* [class FilePath](files-FilePath.md)
* [primitive FilePermissionDenied](files-FilePermissionDenied.md)
* [primitive FileRead](files-FileRead.md)
* [primitive FileRemove](files-FileRemove.md)
* [primitive FileRename](files-FileRename.md)
* [primitive FileSeek](files-FileSeek.md)
* [primitive FileStat](files-FileStat.md)
* [actor FileStream](files-FileStream.md)
* [primitive FileSync](files-FileSync.md)
* [primitive FileTime](files-FileTime.md)
* [primitive FileTruncate](files-FileTruncate.md)
* [primitive FileWrite](files-FileWrite.md)
* [primitive OpenFile](files-OpenFile.md)
* [primitive Path](files-Path.md)
* [interface WalkHandler](files-WalkHandler.md)


## Private Types

* [primitive _DirectoryEntry](files-_DirectoryEntry.md)
* [primitive _DirectoryHandle](files-_DirectoryHandle.md)
* [primitive _EACCES](files-_EACCES.md)
* [primitive _EBADF](files-_EBADF.md)
* [primitive _EEXIST](files-_EEXIST.md)
* [primitive _FileDes](files-_FileDes.md)
* [struct _LuidAndAttributes](files-_LuidAndAttributes.md)
* [primitive _PathDot](files-_PathDot.md)
* [primitive _PathDot2](files-_PathDot2.md)
* [primitive _PathOther](files-_PathOther.md)
* [primitive _PathSep](files-_PathSep.md)
* [type _PathState](files-_PathState.md)
* [class _TestFileOpenWrite](files-_TestFileOpenWrite.md)
* [struct _TokenPrivileges](files-_TokenPrivileges.md)
