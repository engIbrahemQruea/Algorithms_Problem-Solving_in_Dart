import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Days  : ');
  String? inputAge = stdin.readLineSync();
  stdout.write('Enter Hours  : ');
  String? inputHours = stdin.readLineSync();
  stdout.write('Enter Minutes  : ');
  String? inputMinutes = stdin.readLineSync();
  stdout.write('Enter Seconds  : ');
  String? inputSeconds = stdin.readLineSync();
  int days = stringToInt(inputAge!);
  int hours = stringToInt(inputHours!);
  int minutes = stringToInt(inputMinutes!);
  int seconds = stringToInt(inputSeconds!);

int daysToSeconds = days * 24 * 60 * 60;
int hoursToSeconds = hours * 60 * 60;
int minutesToSeconds = minutes * 60;
int totalSeconds = daysToSeconds + hoursToSeconds + minutesToSeconds + seconds;

  print('Task Duration In Seconds = $totalSeconds');
}
