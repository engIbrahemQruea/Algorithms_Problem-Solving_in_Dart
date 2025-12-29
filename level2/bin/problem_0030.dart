import 'dart:io';

import 'package:level2/level2.dart';

List<int> fillArrayRandomNumber(int length) {
  return List.generate(length, (_) => randomNumber(1, 100));
}

List<int> sumTwoArray(List<int> arrayOne, List<int> arrayTwo) {
  if (arrayOne.length != arrayTwo.length) {
    throw ArgumentError('Arrays must have the same length');
  }

  return List.generate(arrayOne.length, (i) => arrayOne[i] + arrayTwo[i]);
}

void printArrayList(List<int> value) {
  stdout.writeln(value.join(' '));
}

void main() {
  int length = readPositiveNumber('Please enter number of elements');
  List<int> listArrayOne = fillArrayRandomNumber(length);
  List<int> listArrayTwo = fillArrayRandomNumber(length);
  List<int> sumTowList = sumTwoArray(listArrayOne, listArrayTwo);
  stdout.write('\nArray 1 elements:\n');
  printArrayList(listArrayOne);
  stdout.write("\n  Array 2 elements:\n");
  printArrayList(listArrayTwo);
  stdout.write("\nSum Array 1 and Array 2 :\n");
  printArrayList(sumTowList);
}
