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
}

int calcVacationDays(DateTime vacationFrom, DateTime vacationTo) {
  int days = 0;
  while (vacationFrom.isBefore(vacationTo)) {
    if (vacationFrom.isBusinessDay) days++;

    vacationFrom = vacationFrom.add(const Duration(days: 1));
  }
  return days;
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
  final DateTime vacationTo = readDate('Enter Vacation End :');
  printVacationInfo(vacationFrom, 'Vacation From : ');
  printVacationInfo(vacationTo, 'Vacation To : ');

  print('Vacation Days : ${calcVacationDays(vacationFrom, vacationTo)}');
}
