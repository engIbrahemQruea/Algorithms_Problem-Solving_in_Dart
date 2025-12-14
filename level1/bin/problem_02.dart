import 'dart:io';

void main() {
  stdout.write('Enter has Recommended Y/N : ');
  String? hasRecomended = stdin.readLineSync();
  stdout.write('Enter age: ');
  String? input = stdin.readLineSync();

  int? age = int.tryParse(input ?? '');

  stdout.write('Enter has drive Y/N : ');
  String? hasDriver = stdin.readLineSync();


  if (hasRecomended == 'Y') {
    print('Hired');
    return;
  } else if (age! >= 21 && hasDriver == 'Y') {
    print('Hired');
  } else {
    print('Rejected');
  }
}
