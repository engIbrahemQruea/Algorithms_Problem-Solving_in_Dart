import 'package:level4/level4.dart';

extension DateComparison on DateTime {
  bool isBeforeHand(DateTime other) {
    if (year < other.year) return true;
    if (year > other.year) return false;

    if (month < other.month) return true;
    if (month > other.month) return false;

    return day < other.day;
  }

  bool operator <(DateTime other) => isBefore(other);
  bool operator <=(DateTime other) =>
      isBefore(other) || isAtSameMomentAs(other);
}

/// Comparing Two Dates Without Using Built-in Comparison
bool isDate1BeforeDate2(DateTime date1, DateTime date2) {
  return (date1.year < date2.year)
      ? true
      : ((date1.year == date2.year)
            ? (date1.month < date2.month
                  ? true
                  : (date1.month == date2.month
                        ? date1.day < date2.day
                        : false))
            : false);
}

/// Using Built-in Solution to Compare Two Dates
bool isLessThan(DateTime date1, DateTime date2) {
  return date1.isBefore(date2);
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
    isDate1BeforeDate2(date1, date2)
        ? 'Yes, Date1 is Less than Date2.'
        : 'No, Date1 is Greater than Date2.',
  );

  /// Using Built-in Solution
  print(
    isLessThan(date1, date2)
        ? 'Yes, Date1 is Less than Date2.'
        : 'No, Date1 is Greater than Date2.',
  );
}
