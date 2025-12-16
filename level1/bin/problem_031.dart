import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Number one : ');
  String? inputDime = stdin.readLineSync();
  stdout.write('Enter Number Two : ');
  String? inputQuarter = stdin.readLineSync();
  stdout.write('Enter Operation : ');
  String? inputOperation = stdin.readLineSync();

  int numberOne = stringToInt(inputDime!);
  int numberTwo = stringToInt(inputQuarter!);
  String operation = inputOperation!;
  var result;
  switch (operation) {
    case '+':
      result = numberOne + numberTwo;
      break;
    case '-':
      result = numberOne - numberTwo;
      break;
    case '*':
      result = numberOne * numberTwo;
      break;
    case '/':
      result = (numberOne / numberTwo);
      break;
    default:
      break;
  }
  print(result);
}
