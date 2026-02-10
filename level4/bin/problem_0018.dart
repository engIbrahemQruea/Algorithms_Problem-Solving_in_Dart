import 'package:level4/level4.dart';

extension DateDifference on DateTime {
  int diffInDays(DateTime other, {bool includeEndDay = false}) {
    final duration = other.difference(this);
    int days = duration.inDays;

    return includeEndDay ? days + 1 : days;
  }
}

DateTime readFullDate() {
  print('Please Enter Your Date of Birth:');
  final day = readPositiveNumber("Enter Day:");
  final month = readPositiveNumber("Enter Month:");
  final year = readPositiveNumber("Enter Year:");
  print('\n');
  return DateTime(year, month, day);
}

void main() {
  final date1 = readFullDate();
  final date2 = DateTime.now();

  print('\n--- Result ---');

  /// Using Built-in Solution
  print('Your Age is :  ${date1.diffInDays(date2)}  Day(s). ');
  print(
    'Your Age is (excluding end day): ${date1.diffInDays(date2, includeEndDay: true)}  Day(s).',
  );
}
