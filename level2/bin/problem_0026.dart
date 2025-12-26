import 'dart:io';

import 'package:level2/level2.dart';

List<int> fillArrayRandomNumber(int length) {
  List<int> list = List.filled(length, 0);
  for (int i = 0; i < length; i++) {
    list[i] = randomNumber(1, 100);
  }
  return list;
}

void sumNumberInArray(List<int> value) {
  int sum = value[0];
  for (int i=0; i<value.length; i++) {
      sum += value[i];

  }
  print('\nSum Of All Number is $sum ');
}

void printArrayList(List<dynamic> value) {
  stdout.write('Array Elements : ');
  for (var element in value) {
    stdout.write(' $element');
  }
}

void main() {
  List<int> listArray = fillArrayRandomNumber(
    readPositiveNumber('Please enter number of elements'),
  );
  printArrayList(listArray);
  sumNumberInArray(listArray);
}
