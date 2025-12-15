import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Total Sales : ');
  String? inputAge = stdin.readLineSync();

  int totalSales = stringToInt(inputAge!);
  double totalComuction = 1;
  if (totalSales == 1000000) {
    totalComuction = totalSales * 0.01;
  } else if (totalSales > 500000 && totalSales < 1000000) {
    totalComuction = totalSales * 0.02;
  } else if (totalSales > 100000 && totalSales < 500000) {
    totalComuction = totalSales * 0.03;
  } else if (totalSales > 50000 && totalSales < 100000) {
    totalComuction = totalSales * 0.05;
  } else {
    totalComuction = totalSales * 0.00;
  }
  print(' Commission Percentage= $totalComuction');
}
