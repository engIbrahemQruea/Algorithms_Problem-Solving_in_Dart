import 'package:level3/level3.dart';

/// Generates a matrix with random integers
List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

/// Counts how many times a specific number appears in the matrix
int countNumberInMatrix(List<List<int>> matrix, int target) {
  return matrix
      .expand((row) => row)
      .where((element) => element == target)
      .length;
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
  final matrixA = generateRandomMatrix(3, 3);
  // final matrixA = [
  //   [2, 0, 0],
  //   [0, 2, 0],
  //   [0, 0, 2],
  // ];

  printMatrix(matrixA, 'Matrix A');

  final target = readPositiveNumber('\nEnter a number to count in Matrix A ');

  final frequency = countNumberInMatrix(matrixA, target);

  print('\nNumber $target appears $frequency times in Matrix A.');
}
