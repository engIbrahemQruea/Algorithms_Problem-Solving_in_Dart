import 'package:level2/level2.dart';

int sumOfDigits(int number) {
  int remainder = 0, sum = 0;
  while (number > 0) {
    remainder = number % 10;
    number ~/= 10;
    sum += remainder;
  }
  return sum;
}

void printDigits(int number) {
  print('sum of digits of $number is ${sumOfDigits(number)}');
}

void main() {
  printDigits(readPositiveNumber('Please Enter Positive Number'));
}
