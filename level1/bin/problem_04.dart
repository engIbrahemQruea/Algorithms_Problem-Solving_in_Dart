import 'dart:io';

void main() {
  stdout.write('Enter Numbers : ');
  String? number = stdin.readLineSync();

  int halfNumber = (int.parse(number!)) ~/ 2;

  print('Half of $number is $halfNumber');
}
