import 'dart:io';

import 'package:level2/level2.dart';

List fillArrayRandomNumber(int length) {
  List list = List.filled(length, 0);
  for (int i = 0; i < length; i++) {
    list[i] = randomNumber(1, 100);
  }
  return list;
}

void minNumberInArray(List value) {
  int min = value[0];
  for (var element in value) {
    if (element < min) {
      min = element;
    }
  }
  print('\nMin Number is $min ');
}

void printArrayList(List<dynamic> value) {
  stdout.write('Array Elements : ');
  for (var element in value) {
    stdout.write(' $element');
  }
}

void main() {
  List listArray = fillArrayRandomNumber(
    readPositiveNumber('Please enter number of elements'),
  );
  printArrayList(listArray);
  minNumberInArray(listArray);
}
