import 'package:level5/models/my_dbl_linked_list.dart';
part 'my_stack.dart';
class MyQueue<T> {
  final MyDblLinkedList<T> _myList = MyDblLinkedList<T>();

  int get size => _myList.size;

  bool get isEmpty => _myList.isEmpty;

  bool get isNotEmpty => _myList.isNotEmpty;

  void push(T value) => _myList.insertAtEnd(value);

  T pop() {
    if (isEmpty) {
      throw StateError('Queue is empty');
    }

    final value = _myList.getItem(0)!;
    _myList.deleteFirstNode();
    return value;
  }

  T? front() =>
      isEmpty ? throw StateError('Queue is empty') : _myList.getItem(0);

  T? back() =>
      isEmpty ? throw StateError('Queue is empty') : _myList.getItem(size - 1);

  void printQueue() => _myList.printAll();

  /// Extention #1
  T? getItem(int index) => _myList.getItem(index);

  /// Extention #2
  void reverse() => _myList.reverse();

  /// Extention #3
  bool updateAt(int index, T value) => _myList.updateAt(index, value);

  /// Extention #4
  void insertAfter(int index, T value) {
    final targetNode = _myList.getNodeAt(index);

    if (targetNode != null) {
      _myList.insertAfter(targetNode, value);
    } else {
      throw RangeError("Index $index out of bounds for size $size");
    }
  }

  /// Extention #5
  void insertAtFront(T value) => _myList.insertAtBeginning(value);

  /// Extention #6
  void insertAtBack(T value) => _myList.insertAtEnd(value);

  /// Extention #7
  void clear() => _myList.clear();
}
