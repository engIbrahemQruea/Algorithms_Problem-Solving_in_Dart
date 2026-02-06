import 'package:level4/level4.dart';

extension YearExtension on int {
  bool get isLeapYear =>
      (this % 400 == 0) || (this % 4 == 0 && this % 100 != 0);

  int get daysCount => isLeapYear ? 366 : 365;

  int get hoursCount => daysCount * 24;
  int get minutesCount => hoursCount * 60;
  int get secondsCount => minutesCount * 60;

  void printYearStats() {
    print('Number of days in year $this is: $daysCount');
    print('Number of hours in year $this is: $hoursCount');
    print('Number of minutes in year $this is: $minutesCount');
    print('Number of seconds in year $this is: $secondsCount');
  }
}

void main() {
  final year = readPositiveNumber("Enter a positive number to convert to text");

  year.printYearStats();

  assert(2024.daysCount == 366, "خطأ: 2024 يجب أن تكون 366 يوماً");
  assert(2023.daysCount == 365, "خطأ: 2023 يجب أن تكون 365 يوماً");
}
