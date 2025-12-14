import 'dart:io';

void main() {
  stdout.write('Enter has First Name : ');
  String? firstName = stdin.readLineSync();

  stdout.write('Enter has Last Name : ');
  String? lastName = stdin.readLineSync();

  print('$firstName $lastName');
}
