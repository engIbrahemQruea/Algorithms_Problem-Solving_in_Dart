void printWordFromAAAToZZZ() {
  String word = '';
  for (int i = 65; i <= 90; i++) {
    for (int j = 65; j <= 90; j++) {
      for (int k = 65; k <= 90; k++) {
        word += String.fromCharCode(i);
        word += String.fromCharCode(j);
        word += String.fromCharCode(k);
        print(word);
        word = '';
      }
    }
  }
}

void main() {
  printWordFromAAAToZZZ();
}
