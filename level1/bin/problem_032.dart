import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  int numberOne;
  int sumation = 0;
  do {
    stdout.write('Enter Number  : ');
    String? inputQuarter = stdin.readLineSync();
    numberOne = stringToInt(inputQuarter!);
    if (numberOne != -99) sumation += numberOne;
  } while (!(numberOne == -99));

  print('Sum Until = $sumation');
}
