import 'dart:io';

import 'package:level2/level2.dart';

bool isPrime(int number) {
  if (number <= 1) return false;
  if (number == 2) return true;
  if (number.isEven) return false;

  for (int i = 3; i * i <= number; i += 2) {
    if (number % i == 0) return false;
  }
  return true;
}

void copyPrimeNumbers(List<int> source, List<int> destination) {
  for (final number in source) {
    if (isPrime(number)) {
      destination.add(number);
    }
  }
}

void printList(List<int> values) => print(values.join(' '));

void main() {
  final List<int> list1 = generateRandomList(
    readPositiveNumber('Please enter number of elements'),
  );
  List<int> list2 = [];
  copyPrimeNumbers(list1, list2);
  stdout.write('\nList 1 length: ${list1.length}');
  stdout.write('\nList 1 elements:\n');
  printList(list1);
  stdout.write('\nList 2 length: ${list2.length}');
  stdout.write("\nList 2 elements prime  after copy:\n");
  printList(list2);
}
