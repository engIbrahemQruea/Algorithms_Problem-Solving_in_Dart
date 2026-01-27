/// Removes punctuation and normalizes spaces in a given string.
final RegExp punctuationRegex = RegExp(r'[^\w\s]');

/// Normalizes spaces in the given [text] by removing extra spaces.
String normalizeText(String text) {
  return text.split(RegExp(r'\s+')).where((s) => s.isNotEmpty).join(' ').trim();
}

/// Removes all punctuation characters from the given [text].
String removePunctuation(String text) {
  return text.isEmpty ? '' : text.replaceAll(punctuationRegex, '');
}

void main() {
  String stringText =
      'Welcome to Yemen ,; Yem*en is a, beauti.ful country , I love Dart programming language';

  String cleanText = removePunctuation(stringText);
  print('Original String is :\n $stringText');

  print('String After Remove Punctuation is :\n ${normalizeText(cleanText)}');
}
