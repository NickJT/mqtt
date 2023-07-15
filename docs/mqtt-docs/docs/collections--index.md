# Collections package

The Collections package provides a variety of collection classes, 
including map, set, range, heap, ring buffer, list, and flags.

`Map` - Hashmap by strutural equality (use `MapIs` for identity equality).

`Set` - A set built on top of `Map` using structural equility (use `SetIs` for identity equality).

`Range` - Iterate over a range of numbers with optional step size.

`BinaryHeap` - A priority queue implemented as a binary heap -- use a `BinaryHeapPriority` parameter to determine priority.

`RingBuffer` - A ring buffer with fixed size.

`List` - A doubly linked list.

`Flags` - A set of single bit flags (size determined upon creation).


## Public Types

* [class BinaryHeap](collections-BinaryHeap.md)
* [type BinaryHeapPriority](collections-BinaryHeapPriority.md)
* [interface Flag](collections-Flag.md)
* [class Flags](collections-Flags.md)
* [primitive HashByteSeq](collections-HashByteSeq.md)
* [primitive HashEq](collections-HashEq.md)
* [primitive HashEq64](collections-HashEq64.md)
* [interface HashFunction](collections-HashFunction.md)
* [interface HashFunction64](collections-HashFunction64.md)
* [primitive HashIs](collections-HashIs.md)
* [class HashMap](collections-HashMap.md)
* [class HashSet](collections-HashSet.md)
* [interface Hashable](collections-Hashable.md)
* [interface Hashable64](collections-Hashable64.md)
* [class List](collections-List.md)
* [class ListNode](collections-ListNode.md)
* [class ListNodes](collections-ListNodes.md)
* [class ListValues](collections-ListValues.md)
* [type Map](collections-Map.md)
* [type MapIs](collections-MapIs.md)
* [class MapKeys](collections-MapKeys.md)
* [class MapPairs](collections-MapPairs.md)
* [class MapValues](collections-MapValues.md)
* [type MaxHeap](collections-MaxHeap.md)
* [primitive MaxHeapPriority](collections-MaxHeapPriority.md)
* [type MinHeap](collections-MinHeap.md)
* [primitive MinHeapPriority](collections-MinHeapPriority.md)
* [class Range](collections-Range.md)
* [class Reverse](collections-Reverse.md)
* [class RingBuffer](collections-RingBuffer.md)
* [type Set](collections-Set.md)
* [type SetIs](collections-SetIs.md)
* [class SetValues](collections-SetValues.md)
* [primitive Sort](collections-Sort.md)


## Private Types

* [interface _BinaryHeapPriority](collections-_BinaryHeapPriority.md)
* [primitive _MapDeleted](collections-_MapDeleted.md)
* [primitive _MapEmpty](collections-_MapEmpty.md)
* [type _TestFlagsFlags](collections-_TestFlagsFlags.md)
