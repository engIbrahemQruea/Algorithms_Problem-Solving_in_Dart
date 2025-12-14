import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Number one : ');
  String? inputOne = stdin.readLineSync();
  stdout.write('Enter Number tow : ');
  String? inputTwo = stdin.readLineSync();

  int numberOne = stringToInt(inputOne!);
  int numberTwo = stringToInt(inputTwo!);

  print('Max is $numberOne');
  print('Max is $numberTwo');
  int swap = numberOne;
  numberOne = numberTwo;
  numberTwo = swap;

  print('Max is $numberOne');
  print('Max is $numberTwo');
}
