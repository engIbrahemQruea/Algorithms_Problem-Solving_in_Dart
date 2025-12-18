import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Pill Value  : ');
  String? inputAge = stdin.readLineSync();
  int pillValue = stringToInt(inputAge!);
  double totalPill = (pillValue * 1.1)*1.16; //! (1.1) add Service free == add 10% to service
  //totalPill *= 1.16; //! (1.16) add Sales Tax == add 16% to salary

  print('Service Fee and Sales Tax = ${totalPill.toStringAsFixed(2)}');
}
