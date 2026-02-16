import 'package:level4/level4.dart';

enum DateCompare { before, equal, after }

extension DateComparison on DateTime {
  DateCompare compareWith(DateTime other) {
    final result = compareTo(other);
    if (result < 0) return DateCompare.before;
    if (result > 0) return DateCompare.after;
    return DateCompare.equal;
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

void main() {
  final date1 = readDate('Enter Date1:');
  final date2 = readDate('Enter Date2:');

  final result = date1.compareWith(date2);

  print('\nCompare Result: ${result.index - 1}');
  print('In Human Language: ${result.name}');
}
