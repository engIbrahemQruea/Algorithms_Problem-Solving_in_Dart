import 'dart:io';

import 'package:level2/level2.dart';

void printArrayList(List<int> value) {
  stdout.writeln(value.join(' '));
}

List<int> fillArrayFrom1To10Number(int length) {
  return List.generate(length, (index) => index + 1);
}

List<int> reversedArray(List<int> array) {
  return array.reversed.toList();
}

void main() {
  int length = readPositiveNumber('Please enter number of elements');
  List<int> listArrayOne = fillArrayFrom1To10Number(length);

  List<int> listArrayTwo = reversedArray(listArrayOne);

  stdout.writeln('\nArray 1 elements:');
  printArrayList(listArrayOne);

  stdout.writeln('\nReversed Array:');
  printArrayList(listArrayTwo);
}
