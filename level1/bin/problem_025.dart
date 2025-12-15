import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Number N : ');
  String? inputAge = stdin.readLineSync();
  int sumEven = 0;
  int number = stringToInt(inputAge!);
  for (int index = 1; index <= number; index++) {
    if (index % 2 == 0) {
      sumEven += index;
    }
  }
  print('Sum Even Numbers from 1 to N = $sumEven');
}
