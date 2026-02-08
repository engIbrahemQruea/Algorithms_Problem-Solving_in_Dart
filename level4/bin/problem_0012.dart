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

  DateTime getDateFromDayOrder(int daysOrder) {
    int remainingDays = daysOrder;
    int month = 1;

    for (month = 1; month <= 12; month++) {
      int mDays = daysInMonth(month);
      if (remainingDays <= mDays) break;
      remainingDays -= mDays;
    }

    return DateTime(this, month, remainingDays);
  }
}

extension DateMath on DateTime {
  int get daysFromStartOfYear {
    return Iterable<int>.generate(
      month - 1,
      (i) => i + 1,
    ).fold(day, (sum, m) => sum + year.daysInMonth(m));
  }

  DateTime addDays(int daysToAdd) {
    int remainingDays = daysFromStartOfYear + daysToAdd;
    int currentYear = year;

    while (remainingDays > currentYear.daysInYear) {
      remainingDays -= currentYear.daysInYear;
      currentYear++;
    }

    int month = 1;
    while (remainingDays > currentYear.daysInMonth(month)) {
      remainingDays -= currentYear.daysInMonth(month);
      month++;
    }

    return DateTime(currentYear, month, remainingDays);
  }
}

void main() {
  final day = readPositiveNumber("Enter Day:");
  final month = readPositiveNumber("Enter Month:");
  final year = readPositiveNumber("Enter Year:");
  final daysToAdd = readPositiveNumber("How many days to add?");

  final date = DateTime(year, month, day);
  final result = date.addDays(daysToAdd);

  /// Using Hand Solution
  print('\n--- Result ---');
  print('Original Date: ${date.day}/${date.month}/${date.year}');
  print('Added Days   : $daysToAdd');
  print('New Date     : ${result.day}/${result.month}/${result.year}\n');

  /// Using built-in add method with Duration
  final resultUsingAddDuration = date.add(Duration(days: daysToAdd));

  print('Original: ${date.day}/${date.month}/${date.year}'); // 31/12/2023
  print(
    'Result Using built-in add method with Duration : ${resultUsingAddDuration.day}/${resultUsingAddDuration.month}/${resultUsingAddDuration.year}\n',
  ); // 10/1/2024

  // Using constructor to create a new date by adding days
  final resultConstructor = DateTime(year, month, day + daysToAdd);

  print(
    'Result Using constructor : ${resultConstructor.day}/${resultConstructor.month}/${resultConstructor.year}\n',
  ); // 10/1/2024
}
