import 'package:level4/level4.dart';

extension TimeConverter on int {
  int get toHours => this * 24;
  int get toMinutes => this * 24 * 60;
  int get toSeconds => this * 24 * 60 * 60;
}

extension YearChecker on int {
  bool get isLeapYear =>
      (this % 400 == 0) || (this % 4 == 0 && this % 100 != 0);
}

const List<int> daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

int getDaysInMonth(int year, int month) {
  if (month < 1 || month > 12) return 0;

  if (month == 2 && year.isLeapYear) return 29;

  return daysPerMonth[month - 1];
}

void main() {
  final year = readPositiveNumber("Enter a Year  ");
  final month = readPositiveNumber("Enter a Month stats (1-12)");

  final days = getDaysInMonth(year, month);

  print('''
📅 Month Statistics
--------------------
Days     : $days
Hours    : ${days.toHours}
Minutes  : ${days.toMinutes}
Seconds  : ${days.toSeconds}
''');

  /// Unit Test

  // اختبار فبراير في سنة كبيسة (2024)
  assert(getDaysInMonth(2024, 2) == 29, "Fail: 2024/2 should be 29");

  // اختبار فبراير في سنة عادية (2023)
  assert(getDaysInMonth(2023, 2) == 28, "Fail: 2023/2 should be 28");

  // اختبار شهر أغسطس (شهر 8)
  assert(getDaysInMonth(2024, 8) == 31, "Fail: August should be 31");

  print("All Tests Passed Successfully! ✅");
}
