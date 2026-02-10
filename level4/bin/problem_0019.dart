import 'package:level4/level4.dart';

extension DateDifference on DateTime {
  int diffInDays(DateTime other, {bool includeEndDay = false}) {
    var d1 = DateTime(year, month, day);
    var d2 = DateTime(other.year, other.month, other.day);

    int swapValueFlag = d1.isBefore(d2) ? 1 : -1;

    final duration = d2.difference(d1).abs();
    int days = duration.inDays;

    if (includeEndDay) days++;

    return days * swapValueFlag;
  }
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

  print('\nResults:');
  print('------------------------------------');
  print('Difference is: ${date1.diffInDays(date2)}');
  print(
    'Difference (Including End Day) is: ${date1.diffInDays(date2, includeEndDay: true)}',
  );
  print('------------------------------------');
}
