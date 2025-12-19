import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  int pinCode;

  do {
    stdout.write('Enter ATM PIN Code  : ');
    String? inputAge = stdin.readLineSync();
    pinCode = stringToInt(inputAge!);
    if (pinCode != 123) {
      print('Wrong PIN Code');
    }
  } while (pinCode != 123);

  print(' Your Balance is 7500');
}
