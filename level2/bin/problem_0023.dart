import 'dart:io';

import 'package:level2/level2.dart';

List fillArrayRandomNumber(int length) {
  List list = List.filled(length, 0);
  for (int i = 0; i < length; i++) {
    list[i] = randomNumber(1, 100);
  }
  return list;
}

void printArrayList(List<dynamic> value) {
    stdout.write('Array Elements : ');
  for (var element in value) {
    stdout.write(' $element');
  }
}

void main() {
  printArrayList(
    fillArrayRandomNumber(readPositiveNumber('Please enter number of elements')),
  );
}
