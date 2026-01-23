import 'package:level3/level3.dart';

String getLowerFirstLetters(String text) {
  return text
      .trim()
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .map( (word) => word[0].toLowerCase() + word.substring(1).toLowerCase())
      .join(' ');
}

void main() {
  final wordString = readString(message: 'Please Enter a String: ');

  print(getLowerFirstLetters(wordString));
}
