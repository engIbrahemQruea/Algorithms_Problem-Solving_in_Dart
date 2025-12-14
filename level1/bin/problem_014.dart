import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Base : ');
  String? inputOne = stdin.readLineSync();
  stdout.write('Enter Height : ');
  String? inputTwo = stdin.readLineSync();

  int base = stringToInt(inputOne!);
  int height = stringToInt(inputTwo!);


  double area =base/2*height;
  print('Triangle Area $area');
}
