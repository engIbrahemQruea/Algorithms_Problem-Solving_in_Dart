/// A custom implementation of the join method for a list of strings.
String customJoin(List<String> inputList, [String delimiter = ' ']) {
  if (inputList.isEmpty) return '';

  final buffer = StringBuffer();

  for (int i = 0; i < inputList.length; i++) {
    buffer.write(inputList[i]);
    if (i != inputList.length - 1) {
      buffer.write(delimiter);
    }
  }

  return buffer.toString();
}

void main() {
  List<String> listString = ['Ibrahim', 'Ahmed', 'Salh', 'Qurea'];

  print('List After Join is :\n ${customJoin(listString, '-')}');
}
