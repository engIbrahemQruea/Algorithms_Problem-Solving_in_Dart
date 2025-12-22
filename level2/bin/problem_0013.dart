import 'dart:io';

import 'package:level2/level2.dart';

void printNumberPattern(int number) {
  for (int i = 1; i <=number; i++) {
    for (int j = i; j > 0; j--) {
      stdout.write(i);
    }
    stdout.write('\n');
  }
}

void main() {
  printNumberPattern(
    readPositiveNumber('Please Enter Positive Number'),
  );
}
