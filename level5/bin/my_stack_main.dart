import 'package:level5/models/my_queue.dart';

void main() {
  final myStack = MyStack<int>();

  myStack.push(10);
  myStack.push(20);
  myStack.push(30);
  myStack.push(40);
  myStack.push(50);

  print('Stack Content:');
  myStack.printStack();

  print('Stack Size: ${myStack.size}');

  print('Top Item: ${myStack.top()}');
  print('Bottom Item: ${myStack.bottom()}');

  myStack.pop();
  print('After Pop:');
  myStack.printStack();

  // Extention #1
  print('Item at index 2: ${myStack.getItem(2)}');
  print('');

  // Extention #2
  myStack.reverse();
  print('After Reverse:');
  myStack.printStack();
  print('');

  // Extention #3
  myStack.updateAt(2, 600);
  print('After Update at index 2:');
  myStack.printStack();
  print('');

  // Extention #4
  myStack.insertAfter(2, 800);
  print('After Insertion 800 After 2:');
  myStack.printStack();
  print('');

  // Extention #5
  myStack.clear();
  print('After Clear:');
  myStack.printStack();
  print('');
}
