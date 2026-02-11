import 'package:level4/level4.dart';

extension DateStatus on DateTime {
  bool get isLastDayInMonth => day == DateTime(year, month + 1, 0).day;

  bool get isLastMonthInYear => month == DateTime.december;

  bool get isLastDayInYear => isLastMonthInYear && isLastDayInMonth;
}

extension DateEvolution on DateTime {
  /// Next logical day (manual logic kept for learning)
  DateTime get nextDayLogic {
    if (isLastDayInYear) {
      return DateTime(year + 1, DateTime.january, 1);
    }
    if (isLastDayInMonth) {
      return DateTime(year, month + 1, 1);
    }
    return add(const Duration(days: 1));
  }

  /// Idiomatic Dart way (recommended)
  DateTime get addOneDay => add(const Duration(days: 1));

  DateTime addDays(int increaseByDay, {bool includeEndDay = false}) {
    final total = increaseByDay + (includeEndDay ? 1 : 0);
    return add(Duration(days: total));
  }

  DateTime get addOneWeek => add(const Duration(days: 7));

  DateTime addWeeks(int increaseByWeeks) =>
      add(Duration(days: increaseByWeeks * 7));

  /// Months & Years rely on DateTime overflow handling
  DateTime get addOneMonth => DateTime(year, month + 1, day);

  DateTime addMonths(int increaseByMonths) =>
      DateTime(year, month + increaseByMonths, day);

  DateTime get addOneYear => DateTime(year + 1, month, day);

  DateTime addYears(int increaseByYears) =>
      DateTime(year + increaseByYears, month, day);

  DateTime get addOneDecade => addYears(10);

  DateTime addDecades(int increaseByDecades) =>
      addYears(increaseByDecades * 10);

  DateTime get addOneCentury => addYears(100);

  DateTime addCenturies(int increaseByCenturies) =>
      addYears(increaseByCenturies * 100);

  DateTime get addOneMillennium => addYears(1000);

  DateTime addMillennia(int increaseByMillennia) =>
      addYears(increaseByMillennia * 1000);
}

void printDate(String label, DateTime date) {
  print('$label: ${date.day}/${date.month}/${date.year}');
}

DateTime readFullDate() {
  final day = readPositiveNumber("Enter Day:");
  final month = readPositiveNumber("Enter Month:");
  final year = readPositiveNumber("Enter Year:");
  print('\n');
  return DateTime(year, month, day);
}

void main() {
  final date = readFullDate();
  final addOneDay = date.addOneDay;

  final addDateByXDays = readPositiveNumber("Enter Number of Days to Add:");
  final addXDays = date.addDays(addDateByXDays, includeEndDay: true);

  final addOneWeek = addXDays.addOneWeek;

  final addDateByXWeek = readPositiveNumber("Enter Number of Week to Add:");
  final addXWeeks = addOneWeek.addWeeks(addDateByXWeek);

  final addOneMonth = addXWeeks.addOneMonth;
  final addDateByXMonth = readPositiveNumber("Enter Number of Month to Add:");
  final addXMonths = addOneMonth.addMonths(addDateByXMonth);

  final addOneYear = addXMonths.addOneYear;
  final addDateByXYear = readPositiveNumber("Enter Number of Year to Add:");
  final addXYears = addOneYear.addYears(addDateByXYear);

  final addOneDecade = addXYears.addOneDecade;
  final addDateByXDecade = readPositiveNumber(
    "Enter Number of Decade to' Add:",
  );
  final addXDecades = addOneDecade.addDecades(addDateByXDecade);

  final addOneCentury = addXDecades.addOneCentury;
  final addDateByXCentury = readPositiveNumber(
    "Enter Number of Century to' Add:",
  );
  final addXCenturies = addOneCentury.addCenturies(addDateByXCentury);

  final addOneMillennium = addXCenturies.addOneMillennium;
  final addDateByXMillennium = readPositiveNumber(
    "Enter Number of Millennium to' Add:",
  );
  final addXMillennia = addOneMillennium.addMillennia(addDateByXMillennium);

  print('\nOriginal Date: ${date.day}/${date.month}/${date.year}');
  print("--- 📅 Date After ---");

  printDate('01 - Adding one Day is:', addOneDay);

  printDate('02 - Adding $addDateByXDays Days is: ', addXDays);
  printDate('03 - Adding one Week is: ', addOneWeek);
  printDate('04 - Adding $addDateByXWeek Days is: ', addXWeeks);

  printDate('05 - Adding one Month is: ', addOneMonth);
  printDate('06 - Adding $addDateByXMonth Month is: ', addXMonths);
  printDate('07 - Adding one Year is: ', addOneYear);
  printDate('08 - Adding $addDateByXYear Year is: ', addXYears);
  printDate('09 - Adding one Decade is: ', addOneDecade);
  printDate('10 - Adding $addDateByXDecade Decade is: ', addXDecades);
  printDate('11 - Adding one Century is: ', addOneCentury);
  printDate('12 - Adding $addDateByXCentury Century is: ', addXCenturies);
  printDate('13 - Adding one Millennium is: ', addOneMillennium);
  printDate('14 - Adding $addDateByXMillennium Millennium is: ', addXMillennia);
}
