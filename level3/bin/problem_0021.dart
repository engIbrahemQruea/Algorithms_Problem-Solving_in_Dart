import 'package:level3/level3.dart';

List<int> generateFibonacci(int n) {
  if (n <= 0) return [];
  if (n == 1) return [1];

  List<int> series = [1, 1];

  for (int i = 2; i < n; i++) {
    series.add(series[i - 1] + series[i - 2]);
  }

  return series;
}

void main() {
  final numberOfTerms = readPositiveNumber(
    'Enter the number of terms in the Fibonacci series: ',
  );

  final fibonacciList = generateFibonacci(numberOfTerms);

  if (fibonacciList.isEmpty) {
    print('No terms to display.');
  } else {
    print('\nFibonacci Series ($numberOfTerms terms):');
    print(fibonacciList.join('   '));
  }
}
