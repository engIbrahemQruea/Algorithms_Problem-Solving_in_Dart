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

void main() {
print(getRandomType(EnRandomType.smallLetter));
print(getRandomType(EnRandomType.capitalLetter));
print(getRandomType(EnRandomType.specialCharacter));
print(getRandomType(EnRandomType.digit));
}
