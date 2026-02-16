import 'package:level4/level4.dart';

extension DateComparison on DateTime {
  bool operator <=(DateTime other) =>
      isBefore(other) || isAtSameMomentAs(other);
  bool operator >=(DateTime other) => isAfter(other) || isAtSameMomentAs(other);
  bool operator <(DateTime other) => isBefore(other);
  bool operator >(DateTime other) => isAfter(other);
}

void checkAndPrint(DateTime d1, DateTime d2) {
  print('Date1: ${d1.toIso8601String().split('T')[0]}');
  print('Date2: ${d2.toIso8601String().split('T')[0]}');
  print('------------------------------------');

  if (d1 > d2) {
    print('Yes, Date1 is After Date2.');
  } else {
    print('No, Date1 is NOT After Date2.');
  }
}

DateTime readDate(String message) {
  print(message);
  final day = readPositiveNumber("Enter Day:");
  final month = readPositiveNumber("Enter Month:");
  final year = readPositiveNumber("Enter Year:");
  print('\n');
  return DateTime(year, month, day);
}

/// Comparing Two Dates Without Using Built-in Comparison
String compareDates(DateTime d1, DateTime d2) => switch (d1.compareTo(d2)) {
  > 0 => 'Date1 is After Date2.',
  < 0 => 'Date1 is Before Date2.',
  _ => 'Both dates are equal.',
};

void main() {
  final date1 = readDate('Enter Date1:');
  final date2 = readDate('Enter Date2:');

  print('\nResult:');
  checkAndPrint(date1, date2);
  print(compareDates(date1, date2));
}
