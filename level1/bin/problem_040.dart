import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  int monthNumber;

  do {
    stdout.write('Enter Month Number From 1 To 12  : ');
    String? inputAge = stdin.readLineSync();
    monthNumber = stringToInt(inputAge!);
  } while (!(monthNumber > 0 && monthNumber < 13));

switch (monthNumber) {
  case 1:
  print('1 is January');
  break;
  case 2:
  print('2 is February');
  break;
  case 3:
  print('3 is March');
  break;
  case 4:
  print('4 is April');
  break;
  case 5:
  print('5 is May');
  break;
  case 6:
  print('6 is June');
  break;
  case 7:
  print('7 is July');
  break;
  case 8:
  print('8 is August');
  break;  
  case 9:
  print('9 is September');
  break;
  case 10:
  print('10 is October');
  break;
  case 11:
  print('11 is November');
  break;
  case 12:
  print('12 is December');
  break;
}

}
