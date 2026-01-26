import 'package:level3/level3.dart';

/// Prints each word in the given [text] in a new line.
void printEachWordInStringInNewLine(String text) {
  for (final word in transformText(text)) {
    print(word);
  }
}

/// Transforms the given [text] into a list of words.
List<String> transformText(String text) {
  final cleaned = text.trim();
  if (cleaned.isEmpty) return [];
  return cleaned.split(RegExp(r'\s+'));
}

/// Counts the total number of words in the given [text].
int countEachWordInString(String text) {
  return transformText(text).length;
}

void main() {
  final input = readString(message: 'Please Enter a String: ');

  print('The words in the String are:');
  printEachWordInStringInNewLine(input);

  print(
    'Total number of words in the String are: ${countEachWordInString(input)}',
  );
}
