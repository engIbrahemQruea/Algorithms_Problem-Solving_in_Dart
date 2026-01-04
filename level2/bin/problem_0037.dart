import 'dart:io';

import 'package:level2/level2.dart';

void addListElement(int number, List<int> arr) {
  arr.add(number);
}

void copyListUsingAddListElement(List<int> source, List<int> destination) {
  for (int number in source) {
    addListElement(number, destination);
  }
}

void printList(List<int> value) {
  print(value.join(' '));
}

void main() {
  List<int> list1 = generateRandomList(
    readPositiveNumber('Please enter number of elements'),
  );
  List<int> list2 = [];
  copyListUsingAddListElement(list1, list2);
  stdout.write('\nArray 1 elements:\n');
  printList(list1);
  stdout.write("\nArray 2 elements after copy:\n");
  printList(list2);
}
