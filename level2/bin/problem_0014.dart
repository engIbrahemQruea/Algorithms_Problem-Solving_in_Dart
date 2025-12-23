import 'dart:io';

import 'package:level2/level2.dart';

void printInvertedLetterPattern(int number) {
  int letter = 65 + number;
  for (int i = number; i > 0; i--) {
    letter--;
    for (int j = i; j > 0; j--) {
      stdout.write(String.fromCharCode(letter));
    }
    stdout.write('\n');
  }
}

void printInvertedLetterPatternOtherSolution(int number) {
  for (int i = 65 + number - 1; i >= 65; i--) {
    for (int j = 1; j <=number-((65+number-1)-i); j++) {
      stdout.write(String.fromCharCode(i));
    }
    stdout.write('\n');
  }
}

void main() {
  printInvertedLetterPattern(
    readPositiveNumber('Please Enter Positive Number'),
  );
  printInvertedLetterPatternOtherSolution(
    readPositiveNumber('Please Enter Positive Number'),
  );
}
