import 'package:level2/level2.dart';

int myCeil(double number) => (number == number.toInt())
    ? number.toInt()
    : (number > 0 ? number.toInt() + 1 : number.toInt());
void main() {
  final double number = readNumberNum('Please enter a float number? ');
  print('My Ceil Result : ${myCeil(number)}');
  print('Dart Ceil Result : ${number.ceil()}');
}
