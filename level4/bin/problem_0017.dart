import 'package:level4/level4.dart';

extension DateDifference on DateTime {
  int diffInDays(DateTime other, {bool includeEndDay = false}) {
    final duration = other.difference(this);
    int days = duration.inDays;

    return includeEndDay ? days + 1 : days;
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

extension DateEvolution on DateTime {
  DateTime get nextDayLogic {
    if (isLastDayInYear) return DateTime(year + 1, 1, 1);
    if (isLastDayInMonth) return DateTime(year, month + 1, 1);
    return DateTime(year, month, day + 1);
  }

  DateTime get nextDay => DateTime(year, month, day + 1);

  DateTime addDays(int days) => DateTime(year, month, day + days);
}

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

int differenceInDays(
  DateTime date1,
  DateTime date2, {
  bool includeEndDay = false,
}) {
  int days = 0;
  while (date1 < date2) {
    days++;
    date1 = date1.nextDayLogic;
  }
  return includeEndDay ? ++days : days;
}

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

  print('\n--- Result ---');

  /// Using Built-in Solution
  print('Difference in Days: ${date1.diffInDays(date2)} ');
  print(
    'Difference in Days (excluding end day): ${date1.diffInDays(date2, includeEndDay: true)} ',
  );

  /// Using Hand Solution
  print('Difference in Days: ${differenceInDays(date1, date2)} ');
  print(
    'Difference in Days (excluding end day): ${differenceInDays(date1, date2, includeEndDay: true)} ',
  );
}
