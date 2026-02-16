import 'package:level4/level4.dart';

extension DateAnalysis on DateTime {
  int get dayOfWeekOrder => weekday % 7;

  String get dayShortName {
    const names = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return names[dayOfWeekOrder];
  }

  bool get isEndOfWeek => dayOfWeekOrder == 6;

  bool get isWeekend =>
      weekday == DateTime.friday || weekday == DateTime.saturday;

  bool get isBusinessDay => !isWeekend;

  DateTime get nextDay => add(const Duration(days: 1));
}

DateTime calculateReturnDate(DateTime startDate, int vacationDays) {
  DateTime currentDate = startDate;
  int daysCounted = 0;

  while (daysCounted < vacationDays) {
    if (currentDate.isBusinessDay) {
      daysCounted++;
    }
    currentDate = currentDate.nextDay;
  }
  while (currentDate.isWeekend) {
    currentDate = currentDate.nextDay;
  }

  return currentDate;
}

DateTime readDate(String message) {
  print(message);
  final day = readPositiveNumber("Enter Day:");
  final month = readPositiveNumber("Enter Month:");
  final year = readPositiveNumber("Enter Year:");
  print('\n');
  return DateTime(year, month, day);
}

void printVacationInfo(DateTime dateInfo, String message) {
  print(
    "$message ${dateInfo.dayShortName} , ${dateInfo.day}/${dateInfo.month}/${dateInfo.year}",
  );
}

void main() {
  final DateTime vacationFrom = readDate('Enter Vacation Start :');
  final vacationDays = readPositiveNumber('Please Enter Vacation Days:');

  print('--- 📋 Vacation Report ---');
  printVacationInfo(vacationFrom, 'Vacation From : ');
  printVacationInfo(
    calculateReturnDate(vacationFrom, vacationDays),
    'Return Date : ',
  );
  print('------------------------------------');
}
