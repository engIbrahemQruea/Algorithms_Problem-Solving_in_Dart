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
myQueue.printQueue();


  
}
