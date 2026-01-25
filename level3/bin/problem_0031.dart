import 'package:level3/level3.dart';

int countLettersByCondition(
  String text,
  String searchChar,
  bool Function(String char) predicate,
) {
  return text
      .split('')
      .where(
        (char) =>
            char.toLowerCase() == searchChar.toLowerCase() && predicate(char),
      )
      .length;
}

bool isUppercaseLetter(String char) {
  return char == char.toUpperCase() && char != char.toLowerCase();
}

bool isLowercaseLetter(String char) {
  return char == char.toLowerCase() && char != char.toUpperCase();
}

void main() {
  final input = readString(message: 'Please Enter a String: ');
  final charToSearch = readString(message: 'Please Enter a Character: ');

  final capitalCount = countLettersByCondition(
    input,
    charToSearch,
    isUppercaseLetter,
  );
  final smallCount = countLettersByCondition(
    input,
    charToSearch,
    isLowercaseLetter,
  );

  print('\nResults for: "$charToSearch"');
  print('Capital Count: $capitalCount');
  print('Small Count: $smallCount');
  print('Total Count: ${capitalCount + smallCount}');
}
