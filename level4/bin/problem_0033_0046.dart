import 'dart:io';

extension DateEvolution on DateTime {
  DateTime subtractDays(int n) => DateTime(year, month, day - n);
  DateTime subtractWeeks(int n) => subtractDays(n * 7);
  DateTime subtractMonths(int n) => DateTime(year, month - n, day);
  DateTime subtractYears(int n) => DateTime(year - n, month, day);
  DateTime get prevDay => subtractDays(1);
  DateTime get prevWeek => subtractWeeks(1);
  DateTime get prevMonth => subtractMonths(1);
  DateTime get prevYear => subtractYears(1);
  DateTime get prevDecade => subtractYears(10);
  DateTime get prevCentury => subtractYears(100);
  DateTime get prevMillennium => subtractYears(1000);

  String get formatted => "$day/$month/$year";
}

int readNumber(String message) {
  stdout.write(message);
  return int.tryParse(stdin.readLineSync() ?? '') ?? 0;
}

DateTime readFullDate() {
  print("\n--- 📅 Enter Initial Date ---");
  int day = readNumber("Day   : ");
  int month = readNumber("Month : ");
  int year = readNumber("Year  : ");
  return DateTime(year, month, day);
}

void main() {
  DateTime date = readFullDate();

  print("\n--- ⏪ Cumulative Subtraction Results ---");

  date = date.prevDay;
  print("01-Subtracting 1 day        : ${date.formatted}");

  date = date.subtractDays(10);
  print("02-Subtracting 10 days      : ${date.formatted}");

  date = date.prevWeek;
  print("03-Subtracting 1 week       : ${date.formatted}");

  date = date.subtractWeeks(10);
  print("04-Subtracting 10 weeks     : ${date.formatted}");

  date = date.prevMonth;
  print("05-Subtracting 1 month      : ${date.formatted}");

  date = date.subtractMonths(5);
  print("06-Subtracting 5 months     : ${date.formatted}");

  date = date.prevYear;
  print("07-Subtracting 1 year       : ${date.formatted}");

  date = date.subtractYears(10);
  print("08-Subtracting 10 years     : ${date.formatted}");

  date = date.subtractYears(10);
  print("09-Subtracting 10 years (F) : ${date.formatted}");

  date = date.prevDecade;
  print("10-Subtracting 1 decade     : ${date.formatted}");

  date = date.subtractYears(100); // 10 عقود = 100 سنة
  print("11-Subtracting 10 decades   : ${date.formatted}");

  date = date.subtractYears(100);
  print("12-Subtracting 10 dec. (F)  : ${date.formatted}");

  date = date.prevCentury;
  print("13-Subtracting 1 century    : ${date.formatted}");

  date = date.prevMillennium;
  print("14-Subtracting 1 millennium : ${date.formatted}");

  print("\n✅ Process Completed Successfully.");
}
