extension DateAnalysis on DateTime {
  int get dayOfWeekOrder {
    int a = (14 - month) ~/ 12;
    int y = year - a;
    int m = month + (12 * a) - 2;
    return (day + y + (y ~/ 4) - (y ~/ 100) + (y ~/ 400) + ((31 * m) ~/ 12)) %
        7;
  }

  String get dayShortName {
    const names = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return names[dayOfWeekOrder];
  }

  bool get isEndOfWeek => dayOfWeekOrder == 6;

  bool get isWeekend {
    int index = dayOfWeekOrder;
    return (index == 5 || index == 6);
  }

  bool get isBusinessDay => !isWeekend;

  int get daysUntilEndOfWeek => 6 - dayOfWeekOrder;

  int get daysUntilEndOfMonth {
    final lastDay = DateTime(year, month + 1, 0);

    return lastDay.difference(DateTime(year, month, day)).inDays + 1;
  }

  int get daysUntilEndOfYear {
    final lastDayOfYear = DateTime(year, 12, 31);
    return lastDayOfYear.difference(DateTime(year, month, day)).inDays + 1;
  }
}

void main() {
  final DateTime date1 = DateTime(2022, 9, 23);

  print(
    "\nToday is ${date1.dayShortName}, ${date1.day}/${date1.month}/${date1.year}",
  );
  print("--------------------------------------------------");

  print("Is it End of Week?");
  if (date1.isEndOfWeek) {
    print("Yes it is Saturday, it's end of Week.");
  } else {
    print("No it's Not end of week.");
  }

  print("\nIs it Weekend?");
  if (date1.isWeekend) {
    print("Yes it is a week end.");
  } else {
    print("No today is ${date1.dayShortName}, Not a weekend.");
  }

  print("\nIs it Business Day?");
  if (date1.isBusinessDay) {
    print("Yes it is a business day.");
  } else {
    print("No it is NOT a business day.");
  }

  print("\n--------------------------------------------------");
  print("Days until end of week  : ${date1.daysUntilEndOfWeek} Day(s).");
  print("Days until end of month : ${date1.daysUntilEndOfMonth} Day(s).");
  print("Days until end of year  : ${date1.daysUntilEndOfYear} Day(s).");
}
