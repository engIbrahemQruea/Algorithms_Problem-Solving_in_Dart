import 'dart:io';

import 'package:level4/level4.dart';

class DateStruct {
  final int day;
  final int month;
  final int year;

  DateStruct({required this.day, required this.month, required this.year});

  @override
  String toString() {
    final d = day.toString().padLeft(2, '0');
    final m = month.toString().padLeft(2, '0');
    return "$d/$m/$year";
  }
}

List<String> splitString(String s, String delim) {
  return s.split(delim).where((element) => element.isNotEmpty).toList();
}

DateStruct stringToDate(String dateString) {
  List<String> vDate = dateString.split("/");

  return DateStruct(
    day: int.parse(vDate[0].trim()),
    month: int.parse(vDate[1].trim()),
    year: int.parse(vDate[2].trim()),
  );
}

String readStringDate(String message) {
  stdout.write(message);
  return stdin.readLineSync() ?? "";
}

////////////////////////////////////////////////
/// Using Solution Hand
bool isValidDate(int y, int m, int d) {
  final date = DateTime(y, m, d);
  return date.year == y && date.month == m && date.day == d;
}

({int day, int month, int year}) readDateFields() {
  print('--- Please Enter Date  dd/mm/yyyy? ');
  final d = readPositiveNumber("Enter Day:   ");
  final m = readPositiveNumber("Enter Month: ");
  final y = readPositiveNumber("Enter Year:  ");
  return (day: d, month: m, year: y);
}

({String day, String month, String year}) readDate() {
  print('--- Please Enter Date  dd/mm/yyyy? ');
  final d = stdin.readLineSync()!;
  final m = stdin.readLineSync()!;
  final y = stdin.readLineSync()!;
  return (day: d, month: m, year: y);
}

DateTime readValidDate() {
  while (true) {
    final fields = readDateFields();

    if (isValidDate(fields.year, fields.month, fields.day)) {
      return DateTime(fields.year, fields.month, fields.day);
    }

    print("\n❌ Invalid Date! Please try again.\n");
  }
}

void printDate(DateTime date) {
  print('Day: ${date.day}');
  print('Month: ${date.month}');
  print('Year: ${date.year}');
}

void printDateFormat(DateTime date) {
  final d = date.day.toString().padLeft(2, '0');
  final m = date.month.toString().padLeft(2, '0');
  print('\nYou Entered: $d/$m/${date.year}');
}

void main() {
  // final date = readValidDate();
  // final date1 = readDate();
  // printDate(date);
  // printDateFormat(date);

  /////////2222222222222222222222222////////////
  String dateString = readStringDate("Please Enter Date dd/mm/yyyy? ");

  try {
    DateStruct date = stringToDate(dateString);

    print("\nDay   : ${date.day}");
    print("Month : ${date.month}");
    print("Year  : ${date.year}");

    print("\nYou Entered: ${date.toString()}");
  } catch (e) {
    print("\n❌ Error: Invalid date format. Please use dd/mm/yyyy");
  }
}
