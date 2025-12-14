import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Number one : ');
  String? inputOne = stdin.readLineSync();
  stdout.write('Enter Number tow : ');
  String? inputTwo = stdin.readLineSync();
  stdout.write('Enter Number three : ');
  String? inputThree = stdin.readLineSync();

  int numberOne = stringToInt(inputOne!);
  int numberTwo = stringToInt(inputTwo!);
  int numberThree = stringToInt(inputThree!);

  print('Sum Numbers is ${numberThree + numberTwo + numberOne}');
}
