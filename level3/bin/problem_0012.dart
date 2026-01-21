import 'package:level3/level3.dart';

List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

int sumOfMatrix(List<List<int>> matrix) {
  return matrix.expand((row) => row).fold(0, (sum, element) => sum + element);
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

bool areMatricesTypical(List<List<int>> matrixA, List<List<int>> matrixB) {
  if (matrixA.length != matrixB.length) return false;
  if (matrixA.isEmpty || matrixB.isEmpty) return true;
  if (matrixA.first.length != matrixB.first.length) return false;

  for (int i = 0; i < matrixA.length; i++) {
    for (int j = 0; j < matrixA[i].length; j++) {
      if (matrixA[i][j] != matrixB[i][j]) return false;
    }
  }
  return true;
}

void main() {
  final matrixA = generateRandomMatrix(4, 3);
  final matrixB = generateRandomMatrix(3, 3);

  printMatrix(matrixA, 'Matrix A');
  printMatrix(matrixB, 'Matrix B');

  int sumA = sumOfMatrix(matrixA);
  int sumB = sumOfMatrix(matrixB);

  print('\n--- Comparison Results ---');
  print('Sum A: $sumA | Sum B: $sumB');
  print('Are sums equal? ${sumA == sumB ? "YES" : "NO"}');

  print(
    'Are matrices typical (identical)? ${areMatricesTypical(matrixA, matrixB) ? "YES" : "NO"}',
  );
}
