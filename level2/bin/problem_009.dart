import 'package:level2/level2.dart';

int countDigitFrequency(int digitToCheck, int number) {
  int freq = 0; // Initialize frequency counter to zero.
  int remainder = 0; // Variable to store the digit extracted from the number.

  // Process each digit until the number becomes 0.
  while (number > 0) {
    remainder = number % 10;
    number = number ~/ 10;

    if (digitToCheck == remainder) {
      freq++;
    }
  }
  return freq;
}

void printAllDigitsFrequencey(int Number) {
  for (int i = 0; i < 10; i++) {
    int DigitFrequency = 0;
    DigitFrequency = countDigitFrequency(i, Number);

    if (DigitFrequency > 0) {
      print('Digits $i Frequency is $DigitFrequency Times');
    }
  }
}

void main() {
  printAllDigitsFrequencey(readPositiveNumber('Please Enter Positive Number'));
}
