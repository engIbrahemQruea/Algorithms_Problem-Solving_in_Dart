import 'package:level3/level3.dart';

/// Helper function to check if a character is whitespace
bool _isWhitespace(String char) => char.trim().isEmpty;

/// Trims leading spaces from the given [text].
String trimLeft(String text) {
  int start = 0;
  while (start < text.length && _isWhitespace(text[start])) {
    start++;
  }
  return text.substring(start);
}

/// Trims trailing spaces from the given [text].
String trimRight(String text) {
  int end = text.length - 1;
  while (end >= 0 && _isWhitespace(text[end])) {
    end--;
  }
  return text.substring(0, end + 1);
}

/// Trims leading and trailing spaces from the given [text].
String trimCustom(String text) {
  if (text.isEmpty) return '';

  int start = 0;
  int end = text.length - 1;

  while (start <= end && text[start] == ' ') {
    start++;
  }

  while (end >= start && text[end] == ' ') {
    end--;
  }
  return (start > end) ? '' : text.substring(start, end + 1);
}

void main() {
  final input = readString(message: 'Please Enter a String: ');
  // final input = "   \t   مرحباً بك يا مهندس إبراهيم    \n   ";
  print('Trim Left:  "${trimLeft(input)}"');
  print('Trim Right: "${trimRight(input)}"');
  print('Full Trim (Custom): "${trimCustom(input)}"');
}
