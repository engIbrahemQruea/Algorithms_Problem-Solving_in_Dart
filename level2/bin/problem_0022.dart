import 'dart:io';

import 'package:level2/level2.dart';

List readArrayList() {
  int length = readPositiveNumber('Enter Arrary Elements');
  List list = List.filled(length, '');
  for (int i = 1; i <= length; i++) {
    list[i - 1] = readPositiveNumber('Elements[${list.length - length + i}]');
  }

  return list;
}

void timesRepeated(int number, List value) {
  int count = 0;
  for (var element in value) {
    if (element == number) {
      count++;
    }
  }
  print('\n$number is repeated $count time(s)');
}

void printArrayList(List<dynamic> value) {
  for (var element in value) {
    stdout.write('$element');
  }
}

void main() {
  List value = readArrayList();
  printArrayList(value);
  timesRepeated(readPositiveNumber('\nEnter number you want to check'), value);
}
