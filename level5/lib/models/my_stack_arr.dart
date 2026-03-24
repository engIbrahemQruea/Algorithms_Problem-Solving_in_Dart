part of 'my_queue_arr.dart';

class MyStackArr<T> extends MyQueueArr<T> {
  @override
  void push(T value) => _myList.add(value);

  @override
  T pop() {
    if (isEmpty) {
      throw StateError('Stack is empty');
    }

    final value = _myList.getItem(size - 1);
    _myList.removeLast();
    return value;
  }

  T top() {
    if (isEmpty) throw StateError('Stack is empty');
    return _myList.getItem(size - 1);
  }

  T bottom() {
    if (isEmpty) throw StateError('Stack is empty');
    return _myList.getItem(0);
  }

  void printStack() => printQueue();
}
