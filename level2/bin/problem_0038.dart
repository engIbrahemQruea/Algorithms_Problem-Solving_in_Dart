import 'dart:io';

import 'package:level2/level2.dart';

void copyOddNumbers(List<int> source, List<int> destination) {
  for (final number in source) {
    if (number.isOdd) {
      destination.add(number);
    }
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
  copyOddNumbers(list1, list2);
  stdout.write('\nList 1 elements:\n');
  printList(list1);
  stdout.write("\nList 2 elements odd  after copy:\n");
  printList(list2);
}
