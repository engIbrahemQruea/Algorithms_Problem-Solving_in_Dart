import 'dart:io';

import 'package:level4/level4.dart';

enum EnDays {
  sunday("Sun"),
  monday("Mon"),
  tuesday("Tue"),
  wednesday("Wed"),
  thursday("Thu"),
  friday("Fri"),
  saturday("Sat");

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

extension MonthName on int {
  String toMonthName() => [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ][this - 1];
}

extension YearChecker on int {
  bool get isLeapYear =>
      (this % 400 == 0) || (this % 4 == 0 && this % 100 != 0);

  int daysInMonth(int month) {
    if (month == 2) return isLeapYear ? 29 : 28;
    return [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1];
  }
}

void printMonthCalendar(int year, int month) {
  final firstDayOrder = DateTime(year, month, 1).dayOfWeekOrder;
  final totalDays = year.daysInMonth(month);

  print('\n  _______________ ${month.toMonthName()} $year _______________');

  for (var dayName in EnDays.values) {
    stdout.write(dayName.label.padLeft(5));
  }
  print('');

  int i;
  for (i = 0; i < firstDayOrder; i++) {
    stdout.write("     ");
  }

  for (int day = 1; day <= totalDays; day++) {
    stdout.write(day.toString().padLeft(5));

    if (++i == 7) {
      i = 0;
      print('');
    }
  }

  print('\n  ___________________________________________\n');
}

void main() {
  final year = readPositiveNumber("Enter a Year  ");
  final month = readPositiveNumber("Enter a Month stats (1-12)");
  printMonthCalendar(year, month);
}
