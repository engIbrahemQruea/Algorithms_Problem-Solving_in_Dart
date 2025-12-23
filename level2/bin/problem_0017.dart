import 'dart:io';

String readPassword() {
  stdout.write("Please enter a 3-Letter Password (all capital)? ");
  String? password = stdin.readLineSync();
  return password!;
}

bool guessPassword(String originalPassword) {
  String word = '';
  int counter = 0;
  for (int i = 65; i <= 90; i++) {
    for (int j = 65; j <= 90; j++) {
      for (int k = 65; k <= 90; k++) {
        word += String.fromCharCode(i);
        word += String.fromCharCode(j);
        word += String.fromCharCode(k);
        counter++;
        print('Trial[$counter] : $word');
        if (word == originalPassword) {
          print('Found after $counter Trial[s]');
          return true;
        }
        word = '';
      }
    }
  }
  return false;
}

void main() {
  guessPassword(readPassword());
}
