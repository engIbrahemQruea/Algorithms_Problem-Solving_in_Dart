import 'package:level4/level4.dart';

extension YearChecker on int {
  bool get isLeapYear =>
      (this % 400 == 0) || (this % 4 == 0 && this % 100 != 0);

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

extension DateAnalytics on DateTime {
  int get daysFromStartOfYear {
    int previousMonthsDays = Iterable<int>.generate(
      month - 1,
      (i) => i + 1,
    ).fold(0, (sum, m) => sum + year.daysInMonth(m));

    return previousMonthsDays + day;
  }
}

void main() {
  final day = readPositiveNumber("Enter a Day stats (1-31)");
  final month = readPositiveNumber("Enter a Month stats (1-12)");
  final year = readPositiveNumber("Enter a Year  ");

  final originalDate = DateTime(year, month, day);
  final daysOrder = originalDate.daysFromStartOfYear;

  final recoveredDate = year.getDateFromDayOrder(daysOrder);

  print('\n--- Result ---');
  print('Days Order in Year: $daysOrder');
  print(
    'Recovered Date    : ${recoveredDate.day}/${recoveredDate.month}/${recoveredDate.year}',
  );
}
