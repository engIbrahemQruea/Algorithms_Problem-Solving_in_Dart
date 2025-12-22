import 'package:level2/level2.dart';

int reversOfDigits(int number) {
  int remainder = 0, reversNumber = 0;
  while (number > 0) {
    remainder = number % 10;
    number ~/= 10;
    reversNumber =reversNumber*10+ remainder;
  }
  return reversNumber;
}

void printDigits(int number) {
  print('sum of digits of $number is ${reversOfDigits(number)}');
}

void main() {
  printDigits(readPositiveNumber('Please Enter Positive Number'));
}
