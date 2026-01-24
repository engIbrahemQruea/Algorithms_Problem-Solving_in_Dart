import 'package:level3/level3.dart';

int countLettersByCondition(String text, bool Function(String char) predicate) {
  int count = 0;

  for (final char in text.split('')) {
    if (predicate(char)) {
      count++;
    }
  }

  return count;
}

bool isUppercaseLetter(String char) {
  return char == char.toUpperCase() && char != char.toLowerCase();
}

bool isLowercaseLetter(String char) {
  return char == char.toLowerCase() && char != char.toUpperCase();
}

void main() {
  final input = readString(message: 'Please Enter a String: ');

  print('String Length: ${input.length}');
  print(
    'Number of Capital Letters: ${countLettersByCondition(input, isUppercaseLetter)}',
  );
  print(
    'Number of Small Letters: ${countLettersByCondition(input, isLowercaseLetter)}',
  );
}
