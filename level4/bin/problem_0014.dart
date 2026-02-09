import 'package:level4/level4.dart';

extension DateComparison on DateTime {
  bool isBeforeHand(DateTime other) {
    if (year < other.year) return true;
    if (year > other.year) return false;

    if (month < other.month) return true;
    if (month > other.month) return false;

    return day < other.day;
  }

  bool operator <=(DateTime other) =>
      isBefore(other) || isAtSameMomentAs(other);
}

/// Comparing Two Dates Without Using Built-in Comparison
bool isDate1EqualDate2(DateTime date1, DateTime date2) {
  return (date1.year == date2.year)
      ? ((date1.month == date2.month)
            ? ((date1.day == date2.day) ? true : false)
            : false)
      : false;
}

/// Using Built-in Solution to Compare Two Dates
bool isEqual(DateTime date1, DateTime date2) {
  return date1.isAtSameMomentAs(date2);
}

/// Reading Full Date from User
DateTime readFullDate() {
  final day = readPositiveNumber("Enter Day:");
  final month = readPositiveNumber("Enter Month:");
  final year = readPositiveNumber("Enter Year:");
  print('\n');
  return DateTime(year, month, day);
}

void main() {
  final date1 = readFullDate();
  final date2 = readFullDate();

  /// Using Hand Solution
  print(
    isDate1EqualDate2(date1, date2)
        ? 'Yes, Date1 is Equal to Date2.'
        : 'No, Date1 is Not Equal to Date2.',
  );

  /// Using Built-in Solution
  print(
    isEqual(date1, date2)
        ? 'Yes, Date1 is Equal to Date2.'
        : 'No, Date1 is Not Equal to Date2.',
  );

  /// Using Extension Method for Comparison
  if (date1 == date2) {
    print('Yes, Date1 is Less than Date2.');
  } else {
    print('No, Date1 is NOT Less than Date2.');
  }
}
