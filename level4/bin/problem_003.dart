import 'package:level4/level4.dart';

bool isLeapYear(int year) {
  return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

bool isLeapYearTheDateTimeHackByDart(int year) {
  // نقوم بإنشاء تاريخ ليوم 29 فبراير لهذه السنة
  // إذا لم تكن كبيسة، Dart تلقائياً سيحول التاريخ إلى 1 مارس
  final date = DateTime(year, 2, 29);
  return date.month == 2;
}

extension YearExtention on int {
  bool get isLeapYearExtention =>
      (this % 400 == 0) || (this % 4 == 0 && this % 100 != 0);
}

void main() {
  final year = readPositiveNumber("Enter a positive number to convert to text");
  if (isLeapYear(year)) {
    print('$year is a leap year.');
  } else {
    print('$year is not a leap year.');
  }

  if (isLeapYearTheDateTimeHackByDart(year)) {
    print('$year is a leap year.');
  } else {
    print('$year is not a leap year.');
  }

  if (year.isLeapYearExtention) {
    print('$year is a leap year.');
  } else {
    print('$year is not a leap year.');
  }
}
