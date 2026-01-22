import 'package:level3/level3.dart';

/// Generates a matrix with random integers
List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

/// is NumberExistsInMatrix checks if exists or not in the matrix
bool containsNumber(List<List<int>> matrix, {required int numberLookFor}) {
  if (matrix.isEmpty) return false;

  return matrix.any((row) => row.any((element) => element == numberLookFor));
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

  printMatrix(matrixA, 'Matrix A');

  final numberLookFor = readPositiveNumber(
    '\nEnter a number to look for in Matrix A ',
  );

  if (containsNumber(matrixA, numberLookFor: numberLookFor)) {
    print('\nYes, $numberLookFor is found in the matrix.');
  } else {
    print('\nNo, $numberLookFor was not found.');
  }
}
