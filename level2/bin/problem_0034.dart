import 'dart:io';

import 'package:level2/level2.dart';

List<int> generateRandomList(int length) {
  return List.generate(length, (_) => randomNumber(1, 100));
}

int findIndex(List<int> array, int number) {
  return array.indexOf(number);
}

void printSearchResult(int index) {
  if (index == -1) {
    stdout.write("\nThe number is not found :-(\n");
  } else {
    stdout.write("\nThe number found at position: $index\n");
    stdout.write("\nThe number found its order  : ${index + 1}\n");
  }
}

void printList(List<int> value) {
  stdout.writeln(value.join(' '));
}

void main() {
  List<int> listArray = generateRandomList(
    readPositiveNumber('Please enter number of elements'),
  );
  stdout.writeln('\nArray 1 elements:');
  printList(listArray);
  int searchNumber = readPositiveNumber('Please enter number to search');
  int numberPosition = findIndex(listArray, searchNumber);
  printSearchResult(numberPosition);
}
