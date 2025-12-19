import 'dart:io';

import 'package:level1/level1.dart';

void main() {
  stdout.write('Enter Seconds  : ');
  String? inputAge = stdin.readLineSync();
  int seconds = stringToInt(inputAge!);

  int secondsPerDay = 24 * 60 * 60;
  int secondsPerHour = 60 * 60;
  int secondsPerMinute = 60;
  int remainder;
  int days = seconds ~/ secondsPerDay;
  remainder = seconds % secondsPerDay;
  int hours = remainder ~/ secondsPerHour;
  remainder = remainder % secondsPerHour;
  int minutes = remainder ~/ secondsPerMinute;
  int reminSecond = remainder % secondsPerMinute;

  print(
    'Seconds to Days Hours Minutes Seconds = $days:$hours:$minutes:$reminSecond',
  );
}
