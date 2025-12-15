import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  int age;
  do {
    stdout.write('Enter Your Age Between 18 and 45 : ');
    String? inputAge = stdin.readLineSync();

    age = stringToInt(inputAge!);
  } while (!(age > 18 && age < 45));
  print('Validate Age ');
}
