import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Number N : ');
  String? inputAge = stdin.readLineSync();
  int number = stringToInt(inputAge!);
  int powerTwo = number * number;
  int powerThree = powerTwo * number;
  int powerFoure = powerThree * number;
  print('Power of 2 N = $powerTwo');
  print('Power of 3 N = $powerThree');
  print('Power of 4 N = $powerFoure');
}
