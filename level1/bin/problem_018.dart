import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Base Isosceles Triangle : ');
  String? inputOne = stdin.readLineSync();

  stdout.write('Enter Height Isosceles Triangle : ');
  String? inputHeight = stdin.readLineSync();

  int baseIsosceles = stringToInt(inputOne!);
  int heightIsosceles = stringToInt(inputHeight!);

  double area =
      (3.14 * baseIsosceles * baseIsosceles / 4) *
      ((2 * heightIsosceles - baseIsosceles) /
          (2 * heightIsosceles + baseIsosceles));
  print('Circle Area Inscribed in an Isosceles Triangle $area');
}
