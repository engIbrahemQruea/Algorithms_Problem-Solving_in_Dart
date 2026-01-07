import 'package:level2/level2.dart';

double getFractionPart(double number) => number - number.truncateToDouble();

int myRound(double number) {
  final int inputPart = number.truncate();
  final double decimalPart = getFractionPart(number);
  if (decimalPart.abs() >= 0.5) {
    return inputPart.isNegative ? inputPart - 1 : inputPart + 1;
  }
  return inputPart;
}

void main() {
  final double number = readNumberNum('Please enter a float number? ');
  print('My Round Result : ${myRound(number)}');
  print('Dart Round Result : ${number.round()}');
  print('Dart Round Result : ${number.floor()}');
}
