import 'dart:io';

import 'package:level2/level2.dart';

enum EnRandomType { smallLetter, capitalLetter, specialCharacter, digit }

const _charRanges = {
  EnRandomType.smallLetter: [97, 122],
  EnRandomType.capitalLetter: [65, 90],
  EnRandomType.specialCharacter: [33, 47],
  EnRandomType.digit: [48, 57],
};

String randomChar(EnRandomType type) {
  final range = _charRanges[type]!;
  return String.fromCharCode(randomNumber(range[0], range[1]));
}

String generateWord(EnRandomType type, int length) {
  return List.generate(length, (_) => randomChar(type)).join();
}

String generateKey() {
  return List.generate(
    4,
    (_) => generateWord(EnRandomType.capitalLetter, 4),
  ).join('-');
}

List<String> fillArrayGenerateKey(int length) {
  return List.generate(length, (_) => generateKey());
}

void printArrayList(List<String> list) {
  list.asMap().forEach((i, v) {
    stdout.writeln('Array[$i] : $v');
  });
}


void main() {
  List<String> listKey = fillArrayGenerateKey(
    readPositiveNumber('Please enter a number of keys'),
  );
  printArrayList(listKey);
}
