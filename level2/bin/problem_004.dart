import 'package:level2/level2.dart';


bool isPrefectNumber(int number) {
  int sum = 0;
  for (int i = 1; i < number; i++) {
    if (number % i == 0) {
      sum += i;
    }
  }

  return sum == number;
}

void printPrefectNumberFrom1ToN(int number) {
  for (int i = 1; i <= number ; i++) {
  if (isPrefectNumber(i) ) {
    print('$i is prefect number');
  }
}
}

void main() {
  printPrefectNumberFrom1ToN(readPositiveNumber('Please Enter Positive Number'));
}
