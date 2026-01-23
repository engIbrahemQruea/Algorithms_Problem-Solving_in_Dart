import 'package:level3/level3.dart';

String transformString(
  String text, {
  required String Function(String) transformAction,
}) {
  if (text.trim().isEmpty) return '';

  return text.trim().split(RegExp(r'\s+')).map(transformAction).join(' ');
}

String getUpperAllString(String text) =>
    transformString(text, transformAction: (word) => word.toUpperCase());

String getLowerAllString(String text) =>
    transformString(text, transformAction: (word) => word.toLowerCase());

void main() {
  final wordString = readString(message: 'Please Enter a String: ');
  print('String with Uppercase letters:');
  print(getUpperAllString(wordString));
  print('String with Lowercase letters:');
  print(getLowerAllString(wordString));
}
