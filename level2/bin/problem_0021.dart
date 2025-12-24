import 'dart:io';

import 'package:level2/level2.dart';

enum EnRandomType { smallLetter, capitalLetter, specialCharacter, digit }

String getRandomType(EnRandomType type) {
  switch (type) {
    case EnRandomType.smallLetter:
      return String.fromCharCode(randomNumber(97, 122));

    case EnRandomType.capitalLetter:
      return String.fromCharCode(randomNumber(65, 90));

    case EnRandomType.specialCharacter:
      return String.fromCharCode(randomNumber(33, 47));

    case EnRandomType.digit:
      return String.fromCharCode(randomNumber(48, 57));
  }
}
String generateWord(EnRandomType type, int length) {
  String word = '';
  for (int i = 1; i <= length; i++) {
    word += getRandomType(type);
  }
  return word;
}



String generateKey() {
  String key = '';
 key += generateWord(EnRandomType.capitalLetter, 4)+'-';
 key += generateWord(EnRandomType.capitalLetter, 4)+'-';
 key += generateWord(EnRandomType.capitalLetter, 4)+'-';
 key += generateWord(EnRandomType.capitalLetter, 4);
 

  return key;
}

void printGenerateKes(int numberKey) {
  for (int i = 1; i <= numberKey; i++) {
    stdout.write('Key[$i] : ');
    print(generateKey());
  }
}

void main() {
  printGenerateKes(readPositiveNumber('Please enter a number of keys'));
}
