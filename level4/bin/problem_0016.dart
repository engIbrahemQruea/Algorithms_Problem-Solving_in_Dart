import 'package:level4/level4.dart';

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

void main() {
  final day = readPositiveNumber("Enter Day:");
  final month = readPositiveNumber("Enter Month:");
  final year = readPositiveNumber("Enter Year:");

  final date = DateTime(year, month, day);
  final nextDay = date.nextDay;

  print("--- 📅 Next Day Calculator ---");
  print('\nOriginal Date: ${date.day}/${date.month}/${date.year}');
  print(
    'Date after adding one Day is: ${nextDay.day}/${nextDay.month}/${nextDay.year}',
  );
}
