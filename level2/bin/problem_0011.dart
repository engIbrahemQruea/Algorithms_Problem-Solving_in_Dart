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

bool isPalindrome(int number) {
  return number == reversOfDigits(number);
}

void printIsPalindrome(int number) {
  if (isPalindrome(number)) {
    print('Yes it is Palindrome Numbers');
  } else {
    print('No it is not Palindrome Numbers');
  }
}

void main() {
  printIsPalindrome(readPositiveNumber('Please Enter  Palindrome Positive Number'));
}
