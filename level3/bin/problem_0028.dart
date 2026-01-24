import 'package:level3/level3.dart';
/// Inverts the case of each letter in the given text.
String transform(
  String text, {
  required String Function(String) transformAction,
}) {
  if (text.trim().isEmpty) return '';
  return transformAction(text);
}

String invertAllLettersCase(String text) {
  return transform(
    text,
    transformAction: (input) {
      return input
          .split('')
          .map((char) {
            if (char == char.toUpperCase()) {
              return char.toLowerCase();
            } else {
              return char.toUpperCase();
            }
          })
          .join('');
    },
  );
}

void main() {
  final readCharacter = readString(message: 'Please Enter a Character: ');
  print('Original: $readCharacter');
  print('Inversed: ${invertAllLettersCase(readCharacter)}');
}
