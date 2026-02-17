import 'package:level4/level4.dart';

class Period {
  final DateTime startDate;
  final DateTime endDate;

  Period({required this.startDate, required this.endDate});
}

extension DateMath on DateTime {
  bool operator <(DateTime other) => isBefore(other);
  bool operator >(DateTime other) => isAfter(other);

  bool isBetween(DateTime start, DateTime end) =>
      (this >= start) && (this <= end);

  bool operator <=(DateTime other) =>
      isBefore(other) || isAtSameMomentAs(other);
  bool operator >=(DateTime other) => isAfter(other) || isAtSameMomentAs(other);
}

bool isOverlap(Period p1, Period p2) {
  return !(p2.endDate < p1.startDate || p2.startDate > p1.endDate);
}

int countOverlapDays(Period p1, Period p2) {
  if (isOverlap(p1, p2)) {
    DateTime overlapStart = p1.startDate > p2.startDate
        ? p1.startDate
        : p2.startDate;

    DateTime overlapEnd = p1.endDate < p2.endDate ? p1.endDate : p2.endDate;
    return overlapEnd.difference(overlapStart).inDays;
  }
  return 0;
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

  print('\n--- Period 2 ---');
  final p2 = Period(startDate: readDate('Start:'), endDate: readDate('End:'));

  print('\nOverlapping Days Counter: ${countOverlapDays(p1, p2)}');
}
