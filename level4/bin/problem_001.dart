import 'package:level4/level4.dart';

const List<String> units = [
  '',
  'One',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
  'Eight',
  'Nine',
  'Ten',
  'Eleven',
  'Twelve',
  'Thirteen',
  'Fourteen',
  'Fifteen',
  'Sixteen',
  'Seventeen',
  'Eighteen',
  'Nineteen',
];

const List<String> tens = [
  '',
  '',
  'Twenty',
  'Thirty',
  'Forty',
  'Fifty',
  'Sixty',
  'Seventy',
  'Eighty',
  'Ninety',
];

String numberToText(int number) {
  if (number == 0) return "Zero";

  return _convert(number).trim();
}

String _convert(int number) {
  if (number == 0) return '';

  if (number < 20) {
    return '${units[number]} ';
  }

  if (number < 100) {
    return '${tens[number ~/ 10]} ${_convert(number % 10)}';
  }

  if (number < 1000) {
    return '${_convert(number ~/ 100)} Hundred ${_convert(number % 100)}';
  }

  if (number < 1000000) {
    return '${_convert(number ~/ 1000)} Thousand ${_convert(number % 1000)}';
  }

  if (number < 1000000000) {
    return '${_convert(number ~/ 1000000)} Million ${_convert(number % 1000000)}';
  }

  return '${_convert(number ~/ 1000000000)} Billion ${_convert(number % 1000000000)}';
}

void main() {
  int myNumber = readPositiveNumber(
    "Enter a positive number to convert to text",
  );
  print(numberToText(myNumber));
}
