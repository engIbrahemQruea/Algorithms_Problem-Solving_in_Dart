import 'package:level4/level4.dart';

extension YearChecker on int {
  bool get isLeapYear =>
      (this % 400 == 0) || (this % 4 == 0 && this % 100 != 0);

  int get daysInYear => isLeapYear ? 366 : 365;

  int daysInMonth(int month) {
    if (month < 1 || month > 12) {
      throw ArgumentError('Month must be between 1 and 12');
    }

    const days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (month == 2 && isLeapYear) return 29;
    return days[month - 1];
  }
}

///Using Built-in Solution to Compare Two Dates
extension DateStatus on DateTime {
  bool get isLastDayInMonth {
    final lastDayInCurrentMonth = DateTime(year, month + 1, 0).day;
    return day == lastDayInCurrentMonth;
  }

  bool get isLastMonthInYear => month == 12;

  bool get isLastDayInYear => isLastMonthInYear && isLastDayInMonth;
}

bool isLastDayInMonth(DateTime date) {
  return date.day == date.year.daysInMonth(date.month);
}

bool isLastMonthInYear(DateTime date) {
  return date.month == 12;
}

void main() {
  final day = readPositiveNumber("Enter Day:");
  final month = readPositiveNumber("Enter Month:");
  final year = readPositiveNumber("Enter Year:");

  final date = DateTime(year, month, day);

  /// Using Hand Solution
  print(
    isLastDayInMonth(date)
        ? 'Yes, The Given Date is the Last Day of the Month.'
        : 'No, The Given Date is Not the Last Day of the Month.',
  );
  print(
    isLastMonthInYear(date)
        ? 'Yes, The Given Date is in the Last Month of the Year.'
        : 'No, The Given Date is Not in the Last Month of the Year.',
  );

  /// Using Built-in Solution
  print('Is Last Day of Month: ${date.isLastDayInMonth ? "Yes ✅" : "No ❌"}');
  print('Is Last Month of Year: ${date.isLastMonthInYear ? "Yes ✅" : "No ❌"}');

  if (date.isLastDayInYear) {
    print('Happy New Year! This is the last day of the year! 🎆');
  }
}
