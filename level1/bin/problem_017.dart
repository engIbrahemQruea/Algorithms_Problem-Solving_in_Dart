import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Circumference : ');
  String? inputOne = stdin.readLineSync();


  int circumference = stringToInt(inputOne!);

  double area =(circumference* circumference)/(4*3.14);
  print('Circle Area Along the Circumference $area');
}
