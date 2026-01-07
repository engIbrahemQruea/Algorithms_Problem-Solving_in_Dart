import 'package:level2/level2.dart';

int myFloor(double number) => (number < 0 && number != number.toInt())
    ? number.toInt() - 1
    : number.toInt();

void main() {
  final double number = readNumberNum('Please enter a float number? ');
  print('My Floor Result : ${myFloor(number)}');
  print('Dart Floor Result : ${number.floor()}');
}
