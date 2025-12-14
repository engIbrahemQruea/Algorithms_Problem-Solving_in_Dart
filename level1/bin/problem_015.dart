import 'dart:io';
import 'dart:math';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Raids : ');
  String? inputOne = stdin.readLineSync();


  int raids = stringToInt(inputOne!);



  double area =3.14*(raids* raids);
  print('Circle Area $area');
}
