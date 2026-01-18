import 'package:level3/level3.dart';

List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols));
}

void printMatrix(List<List<int>> matrix, String label, {int cellWidth = 3}) {
  print('\n$label:');

  if (matrix.isEmpty) {
    print('<empty>');
    return;
  }

  for (final row in matrix) {
    final formattedRow = row
        .map((e) => e.toString().padLeft(cellWidth))
        .join('  ');
    print(formattedRow);
  }
}

void main() {
  List<List<int>> matrixA = generateRandomMatrix(3, 3);

  printMatrix(matrixA, 'Matrix A');
}
