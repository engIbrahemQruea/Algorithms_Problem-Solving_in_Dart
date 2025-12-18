import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Total Pill  : ');
  String? inputAge = stdin.readLineSync();
  stdout.write('Enter Cash Paid  : ');
  String? inputCash = stdin.readLineSync();
  int totalPill = stringToInt(inputAge!);
  int cashPaid = stringToInt(inputCash!);
  int remainder = totalPill - cashPaid;

  print('Pay Remainder = $remainder');

}
