import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Your Age : ');
  String? inputAge = stdin.readLineSync();

  int age = stringToInt(inputAge!);
  (age > 18 && age < 45)
      ? print('Validate Age ')
      : print('InValidate Age ');
}
