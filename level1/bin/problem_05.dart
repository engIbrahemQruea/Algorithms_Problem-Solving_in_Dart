import 'dart:io';

void main() {
  stdout.write('Enter Mark : ');
  String? input = stdin.readLineSync();
  int mark = int.parse(input!);

  mark >= 50 ? print('Pass') : print('Faild');
}
