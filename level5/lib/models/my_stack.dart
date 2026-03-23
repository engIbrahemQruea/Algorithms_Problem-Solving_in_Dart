part of 'my_queue.dart';

class MyStack<T> extends MyQueue<T> {
  @override
  void push(T value) => _myList.insertAtBeginning(value);

  @override
  T? top() => front();

  T? bottom() => back();

  void printStack() => printQueue();
}
