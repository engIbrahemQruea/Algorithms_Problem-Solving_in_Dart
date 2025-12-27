import 'dart:io';

import 'package:level2/level2.dart';

List<int> fillArrayRandomNumber(int length) {
  return List.generate(length, (_) => randomNumber(1, 100));
}
//! Another way to copy array
//? List<int> copyArray(List<int> value) => [...value];

List<int> copyArray(List<int> value) {
  return List<int>.from(value);
  //return value.toList();
}

void printArrayList(List<int> value) {
  print(value.join(' '));
}

void main() {
  List<int> listArray = fillArrayRandomNumber(
    readPositiveNumber('Please enter number of elements'),
  );
  List<int> copyList = copyArray(listArray);
  stdout.write('\nArray 1 elements:\n');
  printArrayList(listArray);
  stdout.write("\nArray 2 elements after copy:\n");
  printArrayList(copyList);
}
