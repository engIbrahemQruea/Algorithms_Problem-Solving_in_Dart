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


List<int> fillArrayRandomNumber(int length) {
  return List.generate(length, (_) => randomNumber(1, 100));
}

List<int> extractPrimeNumbersToArray(List<int> value) {
  return value.where(isPrime).toList();
}

void printArrayList(List<int> value) {
   stdout.writeln(value.join(' '));
}

void main() {
  List<int> listArray = fillArrayRandomNumber(
    readPositiveNumber('Please enter number of elements'),
  );
  List<int> copyList = extractPrimeNumbersToArray(listArray);
  stdout.write('\nArray 1 elements:\n');
  printArrayList(listArray);
  stdout.write("\nPrime Number In Array 2 :\n");
  printArrayList(copyList);
}
