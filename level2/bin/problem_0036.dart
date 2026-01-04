import 'dart:io';

import 'package:level2/level2.dart';

void addListElement(List<int> listNumber, int number) {
  listNumber.add(number);
}

void inputUserNumbersInList(List<int> numbers) {
  while (true) {
    addListElement(numbers, readPositiveNumber('Please enter a number?'));

    if (readNumber('Do you want to add more numbers? [0]:No,[1]:Yes ?') != 1) {
      break;
    }
  }
}

void printList(List<int> value) {
  stdout.writeln('List Length: ${value.length}');
  stdout.writeln('List Element: ${value.join(' ')}');
}

void main() {
  List<int> listNumber = [];
  inputUserNumbersInList(listNumber);
  printList(listNumber);
}
