import 'package:level3/level3.dart';

List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

int sumOfMatrix(List<List<int>> matrix) {
  return matrix.expand((row) => row).fold(0, (sum, element) => sum + element);
}

bool areMatricesEqualBySum(List<List<int>> matrixA, List<List<int>> matrixB) {
  return sumOfMatrix(matrixA) == sumOfMatrix(matrixB);
}

void printComparisonResult(List<List<int>> matrixA, List<List<int>> matrixB) {
  final sumA = sumOfMatrix(matrixA);
  final sumB = sumOfMatrix(matrixB);

  print('\nMatrix A Sum: $sumA');
  print('Matrix B Sum: $sumB');

  print(
    areMatricesEqualBySum(matrixA, matrixB)
        ? 'The two matrices have the SAME sum Are Equal.'
        : 'The two matrices have DIFFERENT sums Are NOT Equal.',
  );
}

void printMatrix(List<List<int>> matrix, String label, {int minCellWidth = 2}) {
  print('\n$label:');

  if (matrix.isEmpty || matrix.first.isEmpty) return print('<empty>');

  final maxNumberLength = matrix
      .expand((row) => row)
      .reduce((a, b) => a > b ? a : b)
      .toString()
      .length
      .clamp(minCellWidth, 10);

  final cellWidth = maxNumberLength > minCellWidth
      ? maxNumberLength
      : minCellWidth;

  for (final row in matrix) {
    print(row.map((e) => e.toString().padLeft(cellWidth, '0')).join('  '));
  }
}

void main() {
  final matrixA = generateRandomMatrix(4, 3);
  final matrixB = generateRandomMatrix(3, 3);

  printMatrix(matrixA, 'Matrix A');
  printMatrix(matrixB, 'Matrix B');

  printComparisonResult(matrixA, matrixB);
}
