import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  int dayNumber;

  do {
    stdout.write('Enter Day Number From 1 To 7  : ');
    String? inputAge = stdin.readLineSync();
    dayNumber = stringToInt(inputAge!);
  } while (!(dayNumber > 0 && dayNumber < 8));

  switch (dayNumber) {
    case 1:
      print('1 is Sunday');
      break;
      case 2:
      print('2 is Monday');
      break;
      case 3:
      print('3 is Tuesday');
      break;
      case 4:
      print('4 is Wednesday');
      break;
      case 5:
      print('5 is Thursday');
      break;
      case 6:
      print('6 is Friday');
      break;
      case 7:
      print('7 is Saturday');
      break;
  }

}
