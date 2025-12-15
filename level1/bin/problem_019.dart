import 'dart:io';
import 'dart:math';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Arbitrary One Triangle : ');
  String? inputOne = stdin.readLineSync();

  stdout.write('Enter Arbitrary Two Triangle : ');
  String? inputTwo = stdin.readLineSync();

  stdout.write('Enter Arbitrary Three Triangle : ');
  String? inputThree = stdin.readLineSync();

  int one = stringToInt(inputOne!);
  int two = stringToInt(inputTwo!);
  int three = stringToInt(inputThree!);

  int simpleEquationOne = (one + two + three) ~/ 2;
  double simpleEquationTwo =
      (three * one * two) /
      (4 *
          sqrt(
            simpleEquationOne *
                (simpleEquationOne - one) *
                (simpleEquationOne - two) *
                (simpleEquationOne - three),
          ));
  double area = 3.14 * (simpleEquationTwo * simpleEquationTwo);
  print(' Circle Area circle Described Around an Arbitrary Triangle $area');
}
