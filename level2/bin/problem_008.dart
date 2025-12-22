import 'package:level2/level2.dart';

int reversOfDigits(int number) {
  int remainder = 0,frquencyNumber=0, searchNumber = readPositiveNumber('Enter number to search');
  while (number > 0) {
    remainder = number % 10;
    if(remainder == searchNumber){
      frquencyNumber++;
    }
    number ~/= 10;
 
  }
  return frquencyNumber;
}

void printDigits(int number) {
  print('Digits $number Frequency is ${reversOfDigits(number)} Times');
}

void main() {
  printDigits(readPositiveNumber('Please Enter Positive Number'));
}
