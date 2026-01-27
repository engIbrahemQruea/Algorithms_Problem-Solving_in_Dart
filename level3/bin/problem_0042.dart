import 'package:level3/level3.dart';

String normalizeSpaces(String text) {
  return text.trim().split(RegExp(r'\s+')).join(' ');
}

String customReplaceAll(String input, String toReplace, String replaceWith) {
  if (toReplace.isEmpty) return input;

  String cleanedInput = normalizeSpaces(input);
  return cleanedInput.split(RegExp(RegExp.escape(toReplace))).join(replaceWith);
}

void main() {
  String stringText =
      'Welecome to Yemen , Yemen is a beautiful country , I love Dart programming language';
  print('Original String is :\n $stringText');
  String stringToReplace = readString(
    message: 'Please Enter a String to Replace: ',
  );
  String stringReplaceWith = readString(
    message: 'Please Enter a String to Replace With: ',
  );

  print(
    'String After Replace is :\n ${customReplaceAll(stringText, stringToReplace, stringReplaceWith)}',
  );
}
