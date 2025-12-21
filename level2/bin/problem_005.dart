import 'package:level2/level2.dart';

void printDigits(int number) {
  int remainder = 0;
  while (number > 0) {
    remainder = number % 10;
    number ~/= 10;
     print(remainder);
  }
 
}

void main() {
  printDigits(readPositiveNumber('Please Enter Positive Number'));
}
