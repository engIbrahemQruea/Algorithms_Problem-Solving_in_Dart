import 'package:level3/level3.dart';

List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

// List<int> calculateRowSums(List<List<int>> matrix) =>
//     matrix.map((row) => row.fold(0, (sum, element) => sum + element)).toList();

int sumOfMatrix(List<List<int>> matrix) {
  return matrix.expand((row) => row).fold(0, (sum, element) => sum + element);
}

void printMatrix(List<List<int>> matrix, String label, {int minCellWidth = 2}) {
  print('\n$label:');

  if (matrix.isEmpty) return print('<empty>');

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
  List<List<int>> matrixA = generateRandomMatrix(5, 3);

  printMatrix(matrixA, 'Matrix A');

  print('Sum of all elements in Matrix A: ${sumOfMatrix(matrixA)}');
}
