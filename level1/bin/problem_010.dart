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
  int max = 0;
  if (numberOne > numberTwo) {
    if (numberOne > numberThree) {
      print('Max is $numberOne');
    } else {
      print('Max is $numberThree');
    }
  } else if (numberTwo > numberThree) {
    print('Max is $numberTwo');
  }

}
