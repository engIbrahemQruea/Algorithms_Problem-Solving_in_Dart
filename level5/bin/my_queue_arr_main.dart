import 'package:level5/models/my_queue_arr.dart';

void main() {
  final myQueueArr = MyQueueArr<int>();

  myQueueArr.push(10);
  myQueueArr.push(20);
  myQueueArr.push(30);
  myQueueArr.push(40);
  myQueueArr.push(50);

  print('Queue Content:');
  myQueueArr.printQueue();

  print('Queue Size: ${myQueueArr.size}');

  print('Front Item: ${myQueueArr.front()}');
  print('Back Item: ${myQueueArr.back()}');

  myQueueArr.pop();
  print('After Pop:');
  myQueueArr.printQueue();

  // Extention #1
  print('Item at index 2: ${myQueueArr.getItem(2)}');
  print('');

  // Extention #2
  myQueueArr.reverse();
  print('After Reverse:');
  myQueueArr.printQueue();
  print('');

  // Extention #3
  myQueueArr.updateAt(2, 600);
  print('After Update at index 2:');
  myQueueArr.printQueue();
  print('');

  // Extention #4
  myQueueArr.insertAfter(2, 800);
  print('After Insertion 800 After 2:');
  myQueueArr.printQueue();
  print('');

  // Extention #5
  myQueueArr.insertAtFront(1000);
  print('After Insertion 1000 At Front:');
  myQueueArr.printQueue();
  print('');

  // Extention #6
  myQueueArr.insertAtBack(2000);
  print('After Insertion 2000 At Back:');
  myQueueArr.printQueue();
  print('');

  // Extention #7
  myQueueArr.clear();
  print('After Clear:');
  myQueueArr.printQueue();
  print('');
}
