import 'package:level2/level2.dart';

enum EnPrimeNotPrime { prime, notPrime }

EnPrimeNotPrime checkPrime(int number) {
  int m = number ~/ 2;
  for (int counter = 2; counter <= m; counter++) {
    if (number % counter == 0) {
      return EnPrimeNotPrime.notPrime;
    }
  }
    return EnPrimeNotPrime.prime;
}

void printPrimeNotPrime(int number) {
  for (int i = 1; i <= number; i++) {
    if (checkPrime(i)==EnPrimeNotPrime.prime) {
      print(i);
    }
  }
}

void main() {
  printPrimeNotPrime(readPositiveNumber('Please Enter Positive Number'));
}
