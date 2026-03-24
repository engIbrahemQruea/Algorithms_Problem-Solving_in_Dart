import 'package:level5/models/my_dynamic_array.dart';

class MyQueueArr<T> {
  final MyDynamicArray<T> _myList = MyDynamicArray<T>();

  int get size => _myList.size;

  bool get isEmpty => _myList.isEmpty;

  bool get isNotEmpty => _myList.isNotEmpty;

  void push(T value) => _myList.insertAtEnd(value);

  T pop() {
    if (isEmpty) {
      throw StateError('Queue is empty');
    }

    final value = _myList.getItem(0)!;
    _myList.removeFirst();
    return value;
  }

  T? front() =>
      isEmpty ? throw StateError('Queue is empty') : _myList.getItem(0);

  T? back() => isEmpty
      ? throw StateError('Queue is empty')
      : _myList.getItem(_myList.size - 1);

  void printQueue() => _myList.printList();

  /// Extention #1
  T? getItem(int index) => _myList.getItem(index);

  /// Extention #2
  void reverse() => _myList.reverse();

  /// Extention #3
  void updateAt(int index, T value) => _myList.setItem(index, value);

  /// Extention #4
  void insertAfter(int index, T value) {
    if (index < 0 || index >= size) {
      throw RangeError("Index $index out of bounds for size $size");
    }

    _myList.insertAfter(index + 1, value);
  }

  /// Extention #5
  void insertAtFront(T value) => _myList.insertAtBeginning(value);

  /// Extention #6
  void insertAtBack(T value) => _myList.insertAtEnd(value);

  /// Extention #7
  void clear() => _myList.clear();
}
