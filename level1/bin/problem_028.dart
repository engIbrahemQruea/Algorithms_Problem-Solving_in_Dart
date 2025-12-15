import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Number N : ');
  String? inputAge = stdin.readLineSync();
  stdout.write('Enter Power of M: ');
  String? inputPower = stdin.readLineSync();
  int number = stringToInt(inputAge!);
  int numberPower = stringToInt(inputPower!);
  int resPower=1;
  for (int index = 1; index <= numberPower; index++) {
  
      resPower *= number;
    
  }
  print(' Power of $numberPower to Number $number = $resPower');
}
