import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  int pinCode;
  int counter =4;

  do {
    stdout.write('Enter ATM PIN Code  : ');
    String? inputAge = stdin.readLineSync();
    pinCode = stringToInt(inputAge!);
      counter--;
    if (pinCode != 123) {
      print('Wrong PIN Code You Have To Enter PIN Code $counter Times');
    }

    if (counter == 0) {
      print('Card Blocked ');
      return;
    }
  
  } while (pinCode != 123);

  print(' Your Balance is 7500');
}
