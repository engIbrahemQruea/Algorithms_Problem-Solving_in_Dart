import 'package:level5/models/my_queue_arr.dart';

void main() {
  final myStackArr = MyStackArr<int>();

  myStackArr.push(10);
  myStackArr.push(20);
  myStackArr.push(30);
  myStackArr.push(40);
  myStackArr.push(50);

  print('Stack Content:');
  myStackArr.printStack();

  print('Stack Size: ${myStackArr.size}');

  print('Top Item: ${myStackArr.top()}');
  print('Bottom Item: ${myStackArr.bottom()}');

  myStackArr.pop();
  print('After Pop:');
  myStackArr.printStack();

  // Extention #1
  print('Item at index 2: ${myStackArr.getItem(2)}');
  print('');

  // Extention #2
  myStackArr.reverse();
  print('After Reverse:');
  myStackArr.printStack();
  print('');

  // Extention #3
  myStackArr.updateAt(2, 600);
  print('After Update at index 2:');
  myStackArr.printStack();
  print('');

  // Extention #4
  myStackArr.insertAfter(2, 800);
  print('After Insertion 800 After 2:');
  myStackArr.printStack();
  print('');

  // Extention #5
  myStackArr.clear();
  print('After Clear:');
  myStackArr.printStack();
  print('');
}
