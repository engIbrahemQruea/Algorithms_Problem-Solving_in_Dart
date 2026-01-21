import 'package:level3/level3.dart';

List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

bool isIdentityMatrix(List<List<int>> matrix) {
  if (matrix.isEmpty) return false;

  final int rows = matrix.length;
  final int cols = matrix.first.length;

  if (rows != cols) return false;

  for (int i = 0; i < rows; i++) {
    if (matrix[i].length != rows) return false;

    for (int j = 0; j < rows; j++) {
      int expectedValue = (i == j) ? 1 : 0;

      if (matrix[i][j] != expectedValue) {
        return false;
      }
    }
  }
  return true;
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
    print(row.map((e) => e.toString().padLeft(cellWidth)).join('  '));
  }
}

void main() {
  //final matrixA = generateRandomMatrix(3, 3);
  final matrixA = [
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1],
  ];

  printMatrix(matrixA, 'Matrix A');

  final result = isIdentityMatrix(matrixA)
      ? 'Matrix A is an Identity Matrix.'
      : 'Matrix A is NOT an Identity Matrix.';

  print('\n$result');
}
