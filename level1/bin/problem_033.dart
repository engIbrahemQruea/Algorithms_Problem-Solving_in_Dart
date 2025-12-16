import 'dart:io';
import 'dart:math';

import 'package:level1/level1.dart';

void main() {
  int number;

  do {
    stdout.write('Enter Number N : ');
    String? inputAge = stdin.readLineSync();
    number = stringToInt(inputAge!);
  } while (!(number > 0));

  String? resualt;
  int remind = (number / 2).round(); //! optimized Complexity
  for (int counter = 2; counter <= remind; counter++) {
    if (number <= counter) {
      resualt = 'Prime';
      break;
    } else if (number % counter == 0) {
      resualt = 'None Prime';
      break;
    } else {
      resualt = 'Prime';
    }
  }
  print(resualt);
}
