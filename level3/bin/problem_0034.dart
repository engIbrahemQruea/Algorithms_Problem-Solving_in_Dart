import 'package:level3/level3.dart';

/// Checks if the given [char] is a vowel letter.
bool isVowelLetter(String char) {
  return 'aeiouAEIOU'.contains(char);
}

/// Returns all vowel letters in the given [text].
String getAllVowelsWithDuplicates(String text) {
  return text.split('').where(isVowelLetter).join(' ');
}

/// Returns all unique vowel letters in the given [text].
String getAllVowelsWithoutDuplicates(String text) {
  return text.split('').where(isVowelLetter).toSet().join(' ');
}

void main() {
  final input = readString(message: 'Please Enter a String: ');

  print('Duplicates Vowels in String are: ${getAllVowelsWithDuplicates(input)} ');

  print('Unique Vowels in String are: ${getAllVowelsWithoutDuplicates(input)}');
}
