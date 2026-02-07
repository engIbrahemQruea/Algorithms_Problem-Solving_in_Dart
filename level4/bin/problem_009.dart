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
  static const List<String> _names = [
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
  ];

  String toMonthName() => _names[this - 1];
}

extension YearChecker on int {
  bool get isLeapYear =>
      (this % 400 == 0) || (this % 4 == 0 && this % 100 != 0);

  int daysInMonth(int month) {
    if (month == 2) return isLeapYear ? 29 : 28;
    const days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return days[month - 1];
  }
}

void printMonthCalendar(int year, int month) {
  final firstDayOrder = DateTime(year, month, 1).dayOfWeekOrder;
  final totalDays = year.daysInMonth(month);

  String title = month.toMonthName().toUpperCase();
  print('\n  ${"_" * 14} $title ${"_" * 14}');

  for (var dayName in EnDays.values) {
    stdout.write(dayName.label.padLeft(5));
  }
  print('');

  int i = 0;
  stdout.write("     " * firstDayOrder);
  i = firstDayOrder;

  for (int day = 1; day <= totalDays; day++) {
    stdout.write(day.toString().padLeft(5));
    if (++i == 7) {
      i = 0;
      print('');
    }
  }
  print('\n  ${"_" * 33}');
}

void printHeaderYear(int year) {
  print('=' * 35);
  print('\t  Calendar = $year');
  print('=' * 35);
}

void printYearCalendar(int year) {
  printHeaderYear(year);
  for (int month = 1; month <= 12; month++) {
    printMonthCalendar(year, month);
  }
}

void main() {
  final year = readPositiveNumber("Enter a Year  ");
  printYearCalendar(year);
}
