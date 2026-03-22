import 'dart:collection';
import 'package:level5/models/my_dbl_linked_list.dart';
import 'package:level5/models/my_dbl_linked_list1.dart';

void main() {
  //final myDblLinkedList = LinkedList<MyDblLinkedList1<int>>();
final  myDblLinkedList = MyDblLinkedList<int>();
  myDblLinkedList.insertAtBeginning(5);
  myDblLinkedList.insertAtBeginning(4);
  myDblLinkedList.insertAtBeginning(3);
  myDblLinkedList.insertAtBeginning(2);
  myDblLinkedList.insertAtBeginning(1);
  print('Linked List Content:');
  myDblLinkedList.printAll();
  final findNode = myDblLinkedList.find(2);
  if (findNode != null) {
    print('\nNode With Value 2 Found: $findNode');
    myDblLinkedList.insertAfter(findNode, 500);
    print('\nAfter Insertion 500 After 2:');
    myDblLinkedList.printAll();
  } else {
    print('Node With Value 2 Not Found');
  }

  myDblLinkedList.insertAtEnd(700);
  print('After Insertion 700 At End:');
  myDblLinkedList.printAll();

  final del = myDblLinkedList.find(4);
  if (del != null) {
    myDblLinkedList.deleteNode(del);
    print('After Deletion Node With Value 4:');
    myDblLinkedList.printAll();
  } else {
    print('Node With Value 4 Not Found');
  }

  myDblLinkedList.deleteFirstNode();
  print('After Deletion First Node:');
  myDblLinkedList.printAll();

  myDblLinkedList.deleteLastNode();
  print('After Deletion Last Node:');
  myDblLinkedList.printAll();

  // print('Linked List Details:');
  // myDblLinkedList.printListDetails();
}
