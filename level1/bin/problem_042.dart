import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Loan Amount  : ');
  String? inputAge = stdin.readLineSync();

  stdout.write('Enter Monthly Payment  : ');
  String? inputMonthlyPayment = stdin.readLineSync();

  int loanAmount = stringToInt(inputAge!);
  int monthlyPayment = stringToInt(inputMonthlyPayment!);
  int month = loanAmount ~/ monthlyPayment;

  print('Loan Instalment Months = $month');
}
