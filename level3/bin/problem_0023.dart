
import 'package:level3/level3.dart';

String getFirstLetters(String text) {
  return text
      .trim()
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .map((word) => word[0])
      .join(' ');
}

void main() {
  final wordString = readString(message: 'Please Enter a String: ');

  print(getFirstLetters(wordString));
}
