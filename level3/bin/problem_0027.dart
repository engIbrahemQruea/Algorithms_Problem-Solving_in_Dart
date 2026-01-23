import 'package:level3/level3.dart';

String transform(
  String text, {
  required String Function(String) transformAction,
}) {
  if (text.trim().isEmpty) return '';

  return text.trim().split(RegExp(r'\s+')).map(transformAction).join(' ');
}

String invertLetterCase(String text) {
  return transform(
    text,
    transformAction: (char) =>
        (char == char.toUpperCase() ? char.toLowerCase() : char.toUpperCase()),
  );
}

void main() {
  final readCharacter = readString(message: 'Please Enter a Character: ');

  print('Character after Inversing: ${invertLetterCase(readCharacter)}');
}
