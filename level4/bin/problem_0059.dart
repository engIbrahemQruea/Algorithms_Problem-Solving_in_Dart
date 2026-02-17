import 'package:level4/level4.dart';

class Period {
  final DateTime startDate;
  final DateTime endDate;

  Period({required this.startDate, required this.endDate});

  int get lengthInDays => endDate.difference(startDate).inDays;

  int get lengthInDaysIncludingEnd => lengthInDays + 1;
}

extension DateComparison on DateTime {
  bool isBetween(DateTime s, DateTime e) =>
      (isAfter(s) || isAtSameMomentAs(s)) &&
      (isBefore(e) || isAtSameMomentAs(e));
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
  print('--- Period 1 ---');
  final p1 = Period(startDate: readDate('Start:'), endDate: readDate('End:'));

  print('Period Length is : ${p1.lengthInDays}');
  print(
    'Period Length (Including End Date) is: ${p1.lengthInDaysIncludingEnd}',
  );
}
