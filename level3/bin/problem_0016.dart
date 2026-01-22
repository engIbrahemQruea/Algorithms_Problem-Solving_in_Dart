import 'package:level3/level3.dart';

/// Generates a matrix with random integers
List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

/// is SparseMatrix checks if more than 70% of the elements in the matrix are zero
bool isSparseMatrix(List<List<int>> matrix, {double threshold = 0.5}) {
  if (matrix.isEmpty) return true;

  int rowCount = matrix.length;
  int colCount = matrix.first.length;
  int totalElements = rowCount * colCount;

  int zeroCount = 0;
  for (var row in matrix) {
    for (var element in row) {
      if (element == 0) zeroCount++;
    }
  }

  return zeroCount / totalElements > threshold;
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
    [0, 0, 12],
    [0, 0, 0],
    [7, 0, 0],
  ];

  printMatrix(matrixA, 'Matrix A');

  final sparse = isSparseMatrix(matrixA);

  print('\nMatrix A is ${sparse ? 'sparse' : 'not sparse'}.');
}
