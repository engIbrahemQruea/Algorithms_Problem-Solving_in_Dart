import 'dart:io';

import 'package:level3/level3.dart';

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  final numberOfTerms = readPositiveNumber(
    'Enter the number of terms in the Fibonacci series: ',
  );

  print('\nFibonacci Series (Recursive):');
  for (int i = 1; i <= numberOfTerms; i++) {
    stdout.write('${fibonacci(i)}   ');
  }
}
