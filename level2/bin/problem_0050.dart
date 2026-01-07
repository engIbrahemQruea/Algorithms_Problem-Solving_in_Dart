import 'dart:math';

import 'package:level2/level2.dart';

num mySqrt(double number) {
  if (number < 0) {
    print(
      'Warning: Square root of a negative number is undefined in real numbers.',
    );
    return double.nan;
  }
  return pow(number, 0.5);
}

void main() {
  final double number = readNumberNum('Please enter a float number? ');
  print('My Sqrt Result : ${mySqrt(number)}');
  print('Dart Sqrt Result : ${sqrt(number)}');
}
