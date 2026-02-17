import 'package:level4/level4.dart';

extension DateFormatter on DateTime {
  String format(String layout) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final replacements = {
      'dd': day.toString().padLeft(2, '0'),
      'mm': month.toString().padLeft(2, '0'),
      'mmm': months[month - 1],
      'yyyy': year.toString(),
      'yy': year.toString().substring(2),
    };

    final pattern = RegExp(replacements.keys.map(RegExp.escape).join('|'));

    return layout.replaceAllMapped(pattern, (match) {
      return replacements[match.group(0)] ?? match.group(0)!;
    });
  }
}

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

DateTime readValidDate() {
  while (true) {
    final fields = readDateFields();

    if (isValidDate(fields.year, fields.month, fields.day)) {
      return DateTime(fields.year, fields.month, fields.day);
    }

    print("\n❌ Invalid Date! Please try again.\n");
  }
}

void main() {
  // final date = readValidDate();

  final myDate = readValidDate();

  print('--- 🎨 Custom Date Formatting ---');
  print('Format (dd/mm/yyyy)  : ${myDate.format("dd/mm/yyyy")}');
  print('Format (yyyy-mm-dd)  : ${myDate.format("yyyy-mm-dd")}');
  print('Format (dd-mmm-yyyy) : ${myDate.format("dd-mmm-yyyy")}');
  print('Format (dd, mmm yy)  : ${myDate.format("dd, mmm yy")}');
}
