/// An optimized custom implementation of the join method for a list of strings.
String customJoinUltimate(List<String> words, [String delimiter = ' ']) {
  if (words.isEmpty) return '';
  if (words.length == 1) return words.first;

  final buffer = StringBuffer(words[0]);

  for (int i = 1; i < words.length; i++) {
    buffer
      ..write(delimiter)
      ..write(words[i]);
  }

  return buffer.toString();
}

void main() {
  List<String> listString = ['Ibrahim', 'Ahmed', 'Salh', 'Qurea'];

  print(
    'List After Join  Using Ultimate Method is :\n ${customJoinUltimate(listString, '-')}',
  );
}
