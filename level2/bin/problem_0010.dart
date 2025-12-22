import 'package:level2/level2.dart';

int reversOfDigits(int number) {
  int remainder = 0, reversNumber = 0;
  while (number > 0) {
    remainder = number % 10;
    reversNumber = reversNumber * 10 + remainder;
    number ~/= 10;
  }
  return reversNumber;
}

void printDigits(int number) {
  
  int remainder = 0;
  while (number > 0) {
    remainder = number % 10;
    number ~/= 10;
    print(remainder);
  }
}



void main() {
  printDigits(reversOfDigits(readPositiveNumber('Please Enter Positive Number')));
}
