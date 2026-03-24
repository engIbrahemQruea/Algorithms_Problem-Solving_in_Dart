import 'package:level5/models/my_dynamic_array.dart';

void main() {
  MyDynamicArray<int> myDynamicArray = MyDynamicArray(5);

  myDynamicArray.add(10);
  myDynamicArray.add(20);

  myDynamicArray.add(30);

  myDynamicArray.add(40);
  myDynamicArray.add(50);

  myDynamicArray.setItem(2, 35);

  print("Is Empty: ${myDynamicArray.isEmpty}");
  print("Is Full: ${myDynamicArray.isFull}");
  print(" list size: ${myDynamicArray.size}");
  print(" list capacity: ${myDynamicArray.capacity}");
  print('List Items:');
  myDynamicArray.printList();

  myDynamicArray.resize(2);
  print('Array after resize:${myDynamicArray.capacity}');
  print("Array Size: ${myDynamicArray.size}");
  print('List Items:');
  myDynamicArray.printList();

  myDynamicArray.resize(10);
  print('Array after resize:${myDynamicArray.capacity}');
  print("Array Size: ${myDynamicArray.size}");
  print('List Items:');
  myDynamicArray.printList();


}
