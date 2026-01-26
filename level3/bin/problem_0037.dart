import 'package:level3/level3.dart';

/// Splits the given [input] string into a list of substrings based on the specified [delimiter].
List<String> customSplit(String input, String delimiter) {
  List<String> tokens = [];
  int pos = 0;
  String sWord;

  while ((pos = input.indexOf(delimiter)) != -1) {
    sWord = input.substring(0, pos);

    if (sWord.isNotEmpty) {
      tokens.add(sWord);
    }

    input = input.substring(pos + delimiter.length);
  }

  if (input.isNotEmpty) {
    tokens.add(input);
  }

  return tokens;
}

void main() {
  final input = readString(message: 'Please Enter a String: ');

  final tokens = customSplit(input, " ");

  print("\nTokens count = ${tokens.length}");
  print('The words are:');
  tokens.forEach(print);
}
