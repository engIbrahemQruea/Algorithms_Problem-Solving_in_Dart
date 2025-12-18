import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Hours  : ');
  String? inputAge = stdin.readLineSync();
  int hours = stringToInt(inputAge!);
  double days =hours/24 ; 
  double weeks =days/7 ; 
  double months =days/30 ; 
  double years =days/365 ; 

  print('Years = ${years.toStringAsFixed(2)}');
  print('Months = ${months.toStringAsFixed(2)}');
  print('Weeks = ${weeks.toStringAsFixed(2)}');
  print('Days = ${days.toStringAsFixed(2)}');
}
