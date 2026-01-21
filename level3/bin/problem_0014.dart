import 'package:level3/level3.dart';

/// Generates a matrix with random integers
List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

/// Checks whether a matrix is a Scalar Matrix
bool isScalarMatrix(List<List<int>> matrix) {
  if (matrix.isEmpty || matrix.first.isEmpty) return false;

  final int rows = matrix.length;
  final int cols = matrix.first.length;
  if (rows != cols) return false;
  final int scalarValue = matrix[0][0];

  for (int i = 0; i < rows; i++) {
    if (matrix[i].length != rows) return false;

    for (int j = 0; j < rows; j++) {
      int expectedValue = (i == j) ? scalarValue : 0;

      if (matrix[i][j] != expectedValue) {
        return false;
      }
    }
  }
  return true;
}

/// Prints a matrix in a formatted way
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
    [2, 0, 0],
    [0, 2, 0],
    [0, 0, 2],
  ];

  printMatrix(matrixA, 'Matrix A');

  final result = isScalarMatrix(matrixA)
      ? 'Matrix A is an Scalar Matrix.'
      : 'Matrix A is NOT an Scalar Matrix.';

  print('\n$result');
}
