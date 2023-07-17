# Builtin package

The builtin package is home to the following standard library members:

1. Types the compiler needs to know exist, such as None.
2. Types with "magic" internal workings that must be supplied directly by the
compiler, such as U32.
3. Any types needed by others in builtin.

The public types that are defined in this package will always be in scope for
every Pony source file. For details on specific packages, see their individual
entity entries.


## Public Types

* [primitive AmbientAuth](builtin-AmbientAuth.md)
* [interface Any](builtin-Any.md)
* [class Array](builtin-Array.md)
* [class ArrayKeys](builtin-ArrayKeys.md)
* [class ArrayPairs](builtin-ArrayPairs.md)
* [class ArrayValues](builtin-ArrayValues.md)
* [primitive AsioEvent](builtin-AsioEvent.md)
* [type AsioEventID](builtin-AsioEventID.md)
* [trait AsioEventNotify](builtin-AsioEventNotify.md)
* [primitive Bool](builtin-Bool.md)
* [type ByteSeq](builtin-ByteSeq.md)
* [interface ByteSeqIter](builtin-ByteSeqIter.md)
* [interface Comparable](builtin-Comparable.md)
* [type Compare](builtin-Compare.md)
* [interface DisposableActor](builtin-DisposableActor.md)
* [primitive DoNotOptimise](builtin-DoNotOptimise.md)
* [class Env](builtin-Env.md)
* [primitive Equal](builtin-Equal.md)
* [interface Equatable](builtin-Equatable.md)
* [primitive F32](builtin-F32.md)
* [primitive F64](builtin-F64.md)
* [type Float](builtin-Float.md)
* [trait FloatingPoint](builtin-FloatingPoint.md)
* [primitive Greater](builtin-Greater.md)
* [interface HasEq](builtin-HasEq.md)
* [primitive I128](builtin-I128.md)
* [primitive I16](builtin-I16.md)
* [primitive I32](builtin-I32.md)
* [primitive I64](builtin-I64.md)
* [primitive I8](builtin-I8.md)
* [primitive ILong](builtin-ILong.md)
* [primitive ISize](builtin-ISize.md)
* [interface InputNotify](builtin-InputNotify.md)
* [interface InputStream](builtin-InputStream.md)
* [type Int](builtin-Int.md)
* [trait Integer](builtin-Integer.md)
* [interface Iterator](builtin-Iterator.md)
* [primitive Less](builtin-Less.md)
* [primitive None](builtin-None.md)
* [struct NullablePointer](builtin-NullablePointer.md)
* [type Number](builtin-Number.md)
* [interface OutStream](builtin-OutStream.md)
* [primitive Platform](builtin-Platform.md)
* [struct Pointer](builtin-Pointer.md)
* [interface ReadElement](builtin-ReadElement.md)
* [interface ReadSeq](builtin-ReadSeq.md)
* [trait Real](builtin-Real.md)
* [struct RuntimeOptions](builtin-RuntimeOptions.md)
* [interface Seq](builtin-Seq.md)
* [type Signed](builtin-Signed.md)
* [trait SignedInteger](builtin-SignedInteger.md)
* [interface SourceLoc](builtin-SourceLoc.md)
* [actor StdStream](builtin-StdStream.md)
* [actor Stdin](builtin-Stdin.md)
* [class String](builtin-String.md)
* [class StringBytes](builtin-StringBytes.md)
* [class StringRunes](builtin-StringRunes.md)
* [interface Stringable](builtin-Stringable.md)
* [primitive U128](builtin-U128.md)
* [primitive U16](builtin-U16.md)
* [primitive U32](builtin-U32.md)
* [primitive U64](builtin-U64.md)
* [primitive U8](builtin-U8.md)
* [primitive ULong](builtin-ULong.md)
* [primitive USize](builtin-USize.md)
* [type Unsigned](builtin-Unsigned.md)
* [trait UnsignedInteger](builtin-UnsignedInteger.md)


## Private Types

* [trait _ArithmeticConvertible](builtin-_ArithmeticConvertible.md)
* [trait _PartialArithmetic](builtin-_PartialArithmetic.md)
* [primitive _SignedArithmetic](builtin-_SignedArithmetic.md)
* [primitive _SignedCheckedArithmetic](builtin-_SignedCheckedArithmetic.md)
* [primitive _SignedPartialArithmetic](builtin-_SignedPartialArithmetic.md)
* [primitive _SignedUnsafeArithmetic](builtin-_SignedUnsafeArithmetic.md)
* [primitive _ToString](builtin-_ToString.md)
* [primitive _UTF32Encoder](builtin-_UTF32Encoder.md)
* [primitive _UnsignedCheckedArithmetic](builtin-_UnsignedCheckedArithmetic.md)
* [primitive _UnsignedPartialArithmetic](builtin-_UnsignedPartialArithmetic.md)
