import 'package:level3/level3.dart';

bool isVowelLetter(String char) {
  return 'aeiou'.contains(char);
}

void main() {
  final charToSearch = readString(message: 'Please Enter a Character: ');
  if (isVowelLetter(charToSearch)) {
    print('The character "$charToSearch" is a vowel letter.');
  } else {
    print('The character "$charToSearch" is not a vowel letter.');
  }
}
