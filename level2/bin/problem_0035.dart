import 'dart:io';

import 'package:level2/level2.dart';

List<int> generateRandomList(int length, {int min = 1, int max = 100}) {
  return List.generate(length, (_) => randomNumber(min, max));
}

int findIndex(List<int> array, int number) {
  return array.indexOf(number);
}

bool isNumberInArray(List<int> array, int number) {
  return array.contains(number);

  //return findIndex(array, number) != -1;

  //return array.indexWhere((element) => element == number)!=-1;

  // return array.any((element) => element == number);
}

void printSearchResult(List<int> array, int number) {
  stdout.writeln("\nNumber you are looking for is: $number");
  if (isNumberInArray(array, number)) {
    stdout.writeln("Yes, it is found :-)");
  } else {
    stdout.writeln("No, the number is not found :-( ");
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
  printSearchResult(listArray, searchNumber);
}
