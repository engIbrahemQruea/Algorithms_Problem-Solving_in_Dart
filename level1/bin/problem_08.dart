import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Mark one : ');
  String? inputOne = stdin.readLineSync();
  stdout.write('Enter Mark tow : ');
  String? inputTwo = stdin.readLineSync();
  stdout.write('Enter Mark three : ');
  String? inputThree = stdin.readLineSync();

  int numberOne = stringToInt(inputOne!);
  int numberTwo = stringToInt(inputTwo!);
  int numberThree = stringToInt(inputThree!);

  int averageMark = (numberThree + numberTwo + numberOne) ~/ 3;

  print('Average Mark  is $averageMark');
  averageMark >= 50 ? print('Pass') : print('Faild');
}
