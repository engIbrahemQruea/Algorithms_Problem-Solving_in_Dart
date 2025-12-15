import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Number N : ');
  String? inputAge = stdin.readLineSync();

  int number = stringToInt(inputAge!);
  for (int index = 1; index <= number; index++) {
    print(index);
  }
}
