import 'dart:io';
import 'dart:math';

int calculate() {
  return 6 * 7;
}

String readAnyThing(String message) {
  stdout.write('$message : ');
  String? input = stdin.readLineSync();
  return input!;
}

int readNumber(String message) {
  stdout.write('$message : ');
  String? input = stdin.readLineSync();
  return stringToInt(input!);
}

double readNumberNum(String message) {
  stdout.write('$message : ');
  String? input = stdin.readLineSync();
  return stringToNum(input!);
}

int readPositiveNumber(String message) {
  int number = 0;
  do {
    stdout.write('$message : ');
    String? input = stdin.readLineSync();
    number = stringToInt(input!);
  } while (number <= 0|| number.isNaN);
  return number;
}

int stringToInt(String val) {
  return int.parse(val);
}

double stringToNum(String val) {
  return double.parse(val);
}

int randomNumber(int from, int to) {
  final random = Random();
  return random.nextInt(to - from + 1) + from;
}

List<int> generateRandomList(int length, {int min = 1, int max = 100}) {
  return List.generate(length, (_) => randomNumber(min, max));
}

int readValidateNumberInt({
  String message = "Enter a number: ",
  String errorMessage = "Invalid input! Please enter a valid integer.",
}) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();
    int? value = int.tryParse(input ?? '');

    if (value != null) {
      return value;
    }

    print(errorMessage);
  }
}

String readString({
  String message = "Enter text: ",
  String errorMessage = "Input cannot be empty! Please try again.",
}) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    if (input != null && input.trim().isNotEmpty) {
      return input.trim();
    }

    print(errorMessage);
  }
}

String readOnlyString({
  String message = "Enter text: ",
  String errorMessage =
      "Invalid input! Please enter letters only (no numbers or symbols).",
}) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    if (input != null && input.trim().isNotEmpty) {
      final lettersOnly = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');

      if (lettersOnly.hasMatch(input)) {
        return input.trim();
      }
    }

    print(errorMessage);
  }
}
