import 'package:level5/models/my_dbl_linked_list.dart';

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

  void clear() => _myList.clear();

  void printQueue() => _myList.printAll();
}
