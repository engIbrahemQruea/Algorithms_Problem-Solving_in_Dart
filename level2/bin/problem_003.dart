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

void printPrefectNumber(int number) {
  if (isPrefectNumber(number) ) {
    print('$number is prefect number');
  } else {
    print('$number is not prefect number');
  }
}

void main() {
  printPrefectNumber(readPositiveNumber('Please Enter Positive Number'));
}
