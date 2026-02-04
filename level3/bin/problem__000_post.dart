import 'package:level3/level3.dart';

String transformString(String text, String Function(String) transformAction) {
  if (text.trim().isEmpty) return '';

  return text.trim().split(RegExp(r'\s+')).map(transformAction).join(' ');
}

String getUpperAllString(String text) =>
    transformString(text, (word) => word.toUpperCase());

String getLowerAllString(String text) =>
    transformString(text, (word) => word.toLowerCase());

void main() {
  final wordString = readString(message: 'Please Enter a String: ');

  print('\n--- Execution Results ---');
  print('Uppercase: ${getUpperAllString(wordString)}');
  print('Lowercase: ${getLowerAllString(wordString)}');
}


/// before refactoring


// String getUpperAllString(String text) {
//   return text
//       .trim()
//       .split(RegExp(r'\s+'))
//       .where((word) => word.isNotEmpty)
//       .map((word) => word[0].toUpperCase() + word.substring(1).toUpperCase())
//       .join(' ');
// }

// String getLowerAllString(String text) {
//   return text
//       .trim()
//       .split(RegExp(r'\s+'))
//       .where((word) => word.isNotEmpty)
//       .map((word) => word[0].toLowerCase() + word.substring(1).toLowerCase())
//       .join(' ');
// }

// void main() {
//   final wordString = readString(message: 'Please Enter a String: ');
//   print('String with Uppercase letters:');
//   print(getUpperAllString(wordString));
//   print('String with Lowercase letters:');
//   print(getLowerAllString(wordString));
// }

