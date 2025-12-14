import 'dart:io';
import 'dart:math';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Number one : ');
  String? inputOne = stdin.readLineSync();
  stdout.write('Enter Number tow : ');
  String? inputTwo = stdin.readLineSync();

  int numberOne = stringToInt(inputOne!);
  int numberTwo = stringToInt(inputTwo!);


  double area =numberOne* sqrt((numberTwo*numberTwo) -(numberOne* numberOne));
  print('Area is $area');
}
