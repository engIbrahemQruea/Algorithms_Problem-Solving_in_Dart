import 'package:level3/level3.dart';

bool isVowelLetter(String char) {
  return 'aeiou'.contains(char.toLowerCase());
}

int countVowelLetters(String text) {
  return text.split('').where(isVowelLetter).length;
}

void main() {
  final input = readString(message: 'Please Enter a String: ');
  final vowelCount = countVowelLetters(input);

  print('Number of Vowel Letters: $vowelCount');
}
