import 'dart:io';

import 'package:level2/level2.dart';

void printInvertedNumberPattern(int number) {
  for (int i = number; i > 0; i--) {
    for (int j = i; j > 0; j--) {
      stdout.write(i);
    }
    stdout.write('\n');
  }
}

void main() {
  printInvertedNumberPattern(readPositiveNumber('Please Enter Positive Number'));
}
