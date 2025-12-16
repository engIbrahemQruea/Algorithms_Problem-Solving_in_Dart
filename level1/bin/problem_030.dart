import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Pennys : ');
  String? inputPennys = stdin.readLineSync();
  stdout.write('Enter Nickel : ');
  String? inputNickel = stdin.readLineSync();
  stdout.write('Enter Dime : ');
  String? inputDime = stdin.readLineSync();
  stdout.write('Enter Quarter : ');
  String? inputQuarter = stdin.readLineSync();
  stdout.write('Enter Dollar : ');
  String? inputDollar = stdin.readLineSync();

  int penny = stringToInt(inputPennys!);
  int nickel = stringToInt(inputNickel!);
  int dime = stringToInt(inputDime!);
  int quarter = stringToInt(inputQuarter!);
  int dollar = stringToInt(inputDollar!);

  int totalPennys =
      penny * 1 + nickel * 5 + dime * 10 + quarter * 25 + dollar * 100;
  double totalDollars = totalPennys / 100;
  print('Pennies = $totalPennys');
  print('Dollars = $totalDollars');
}
