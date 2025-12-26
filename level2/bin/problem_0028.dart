import 'dart:io';

import 'package:level2/level2.dart';

List<int> fillArrayRandomNumber(int length) {
  List<int> list = List.filled(length, 0);
  for (int i = 0; i < length; i++) {
    list[i] = randomNumber(1, 100);
  }
  return list;
}

List<int> copyArray(List<int> value) {
  List<int> copyArray = List.filled(value.length, 0);
  for (int i = 0; i < value.length; i++) {
    copyArray[i] = value[i];
  }
  return copyArray;
}

void printArrayList(List<int> value) {
  for (var element in value) {
    stdout.write(' $element');
  }
}

void main() {
  List<int> listArray = fillArrayRandomNumber(
    readPositiveNumber('Please enter number of elements'),
  );
List<int> copyList = copyArray(listArray);
  stdout.write('\nArray 1 elements:\n');
  printArrayList(listArray);
  stdout.write( "\nArray 2 elements after copy:\n");
  printArrayList(copyList);
}
