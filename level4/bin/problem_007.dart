import 'package:level4/level4.dart';

enum EnDays {
  sunday("Sunday"),
  monday("Monday"),
  tuesday("Tuesday"),
  wednesday("Wednesday"),
  thursday("Thursday"),
  friday("Friday"),
  saturday("Saturday");

  final String label;
  const EnDays(this.label);
}

extension DateCalculations on DateTime {
  int get dayOfWeekOrder {
    int a = (14 - month) ~/ 12;
    int y = year - a;
    int m = month + (12 * a) - 2;
    // Gregorian:
    return (day + y + (y ~/ 4) - (y ~/ 100) + (y ~/ 400) + ((31 * m) ~/ 12)) %
        7;
  }

  String get dayName => EnDays.values[dayOfWeekOrder].label;
}

void main() {
  final year = readPositiveNumber("Enter a Year  ");
  final month = readPositiveNumber("Enter a Month stats (1-12)");
  final day = readPositiveNumber("Enter a Day stats (1-31)");

  final date = DateTime(year, month, day);

  print('''
📅 Date Analysis
--------------------
Date Full  : ${date.day}/${date.month}/${date.year}
Day Order  : ${date.dayOfWeekOrder}
Day Name   : ${date.dayName}
--------------------
''');
}
