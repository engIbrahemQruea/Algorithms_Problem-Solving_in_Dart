import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  int number;
  do {
    stdout.write('Enter Number Factorial of N! : ');
    String? inputAge = stdin.readLineSync();
    number = stringToInt(inputAge!);
  } while (!(number > 0));
  int factorialN = 1;
  for (int index = number; index > 1; index--) {
    factorialN *= index;
  }
  print(' Factorial of N! = $factorialN');
}
