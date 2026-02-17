import 'package:level4/level4.dart';

/// Using Solution Hand

bool isLeapYear(int year) =>
    (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

int getDaysInMonth(int month, int year) {
  if (month < 1 || month > 12) return 0;

  const days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  return (month == 2) ? (isLeapYear(year) ? 29 : 28) : days[month - 1];
}

bool isValidDate(int year, int month, int day) {
  if (month < 1 || month > 12) return false;

  int maxDays = getDaysInMonth(month, year);
  return (day >= 1 && day <= maxDays);
}

/// Using Modern Solution
bool isValidDateModern(int year, int month, int day) {
  final date = DateTime(year, month, day);

  return (date.year == year && date.month == month && date.day == day);
}

Map<String, int> readDateFields() {
  print('--- Enter Date Details ---');
  final day = readPositiveNumber("Enter Day: ");
  final month = readPositiveNumber("Enter Month: ");
  final year = readPositiveNumber("Enter Year: ");
  return {'day': day, 'month': month, 'year': year};
}

void main() {
  final dateFields = readDateFields();

  final d = dateFields['day']!;
  final m = dateFields['month']!;
  final y = dateFields['year']!;

  print(isValidDate(y, m, d) ? 'Valid Date Yes' : 'Invalid Date Not');

  /// Using Modern Solution

  print(isValidDateModern(y, m, d) ? 'Valid Date Yes' : 'Invalid Date Not');
}
