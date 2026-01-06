import 'dart:io';

import 'package:level2/level2.dart';
import 'package:path/path.dart';

num readNumber() {
  stdout.write('Please enter a number? " : ');
  String? input = stdin.readLineSync();
  return stringToNum(input!);
}

num myABS(num number) {
  if (number < 0) {
    return number * -1;
  } else {
    return number;
  }
}

void main() {
  num inputNumber = readNumber();
  print('My abs Result : ${myABS(inputNumber)}');
  print('Dart abs Result : ${myABS(inputNumber).abs()}');
}
