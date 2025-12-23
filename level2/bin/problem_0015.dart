import 'dart:io';

import 'package:level2/level2.dart';

void printLetterPattern(int number) {
  int letter = 64;
  for (int i = 1; i <= number; i++) {
    letter++;
    for (int j = i; j > 0; j--) {
      stdout.write(String.fromCharCode(letter));
    }
    stdout.write('\n');
  }
}

void printLetterPatternOtherSolution(int number) {
  for (int i = 65; i <= 65 + number - 1; i++) {
    for (int j = 1; j <= i - 65 + 1; j++) {
      stdout.write(String.fromCharCode(i));
    }
    stdout.write('\n');
  }
}

void main() {
  printLetterPattern(readPositiveNumber('Please Enter Positive Number'));
  printLetterPatternOtherSolution(
    readPositiveNumber('Please Enter Positive Number'),
  );
}
