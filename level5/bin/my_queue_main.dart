import 'package:level5/models/my_dbl_linked_list.dart';
import 'package:level5/models/my_queue.dart';

void main() {
  final myQueue = MyQueue<int>();

  myQueue.push(10);
  myQueue.push(20);
  myQueue.push(30);
  myQueue.push(40);
  myQueue.push(50);

  print('Queue Content:');
  myQueue.printQueue();

  print('Queue Size: ${myQueue.size}');

  print('Front Item: ${myQueue.front()}');
  print('Back Item: ${myQueue.back()}');

  myQueue.pop();
  print('After Pop:');
  myQueue.printQueue();

  // Extention #1
  print('Item at index 2: ${myQueue.getItem(2)}');
  print('');
  // Extention #2
  myQueue.reverse();
  print('After Reverse:');
  myQueue.printQueue();
  print('');

  // Extention #3
  myQueue.updateAt(2, 600);
  print('After Update at index 2:');
  myQueue.printQueue();
  print('');

  // Extention #4
  myQueue.insertAfter(2, 800);
  print('After Insertion 800 After 2:');
  myQueue.printQueue();
  print('');

  // Extention #5
  myQueue.insertAtFront(1000);
  print('After Insertion 1000 At Front:');
  myQueue.printQueue();
  print('');

  // Extention #6
  myQueue.insertAtBack(2000);
  print('After Insertion 2000 At Back:');
  myQueue.printQueue();
  print('');

  // Extention #7
  myQueue.clear();
  print('After Clear:');
  myQueue.printQueue();
  print('');
}
