import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Loan Amount  : ');
  String? inputAge = stdin.readLineSync();

  stdout.write('Enter How Need Monthly    : ');
  String? inputMonthly = stdin.readLineSync();

  int loanAmount = stringToInt(inputAge!);
  int monthly = stringToInt(inputMonthly!);
  int payment = loanAmount ~/ monthly;

  print('Monthly Loan Installment = $payment');
}
