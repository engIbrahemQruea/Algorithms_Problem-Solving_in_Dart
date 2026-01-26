import 'package:level3/level3.dart';

/// Prints each word in the given [text] in a new line.
void printEachWordInStringInNewLine(String text) {
  return text.trim().split(RegExp(r'\s+')).forEach((word) {
    print(word);
  });
}

void main() {
  final input = readString(message: 'Please Enter a String: ');

  printEachWordInStringInNewLine(input);
}
