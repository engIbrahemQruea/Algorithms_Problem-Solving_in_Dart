import 'package:level4/level4.dart';

class Period {
  final DateTime startDate;
  final DateTime endDate;

  Period({required this.startDate, required this.endDate});

  bool contains(DateTime date) => date.isBetween(startDate, endDate);
}

extension DateComparison on DateTime {
  bool isBetween(DateTime start, DateTime end) =>
      (isAfter(start) || isAtSameMomentAs(start)) &&
      (isBefore(end) || isAtSameMomentAs(end));
}

DateTime readDate(String message) {
  print(message);
  final day = readPositiveNumber("Enter Day:");
  final month = readPositiveNumber("Enter Month:");
  final year = readPositiveNumber("Enter Year:");
  print('\n');
  return DateTime(year, month, day);
}

void main() {
  print('---  Enter Period  ---');
  final p1 = Period(startDate: readDate('Start:'), endDate: readDate('End:'));

  final dateToCheck = readDate('Enter Date to Check:');

  print(
    p1.contains(dateToCheck)
        ? 'Yes, Date is within period'
        : 'No, Date is not within period',
  );
}
