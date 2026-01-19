import 'package:level3/level3.dart';

List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols));
}

List<int> calculateColSum(List<List<int>> matrix) {
  if (matrix.isEmpty || matrix.first.isEmpty) return [];

  final cols = matrix.first.length;

  return List.generate(
    cols,
    (colIndex) => matrix.fold(0, (sum, row) => sum + row[colIndex]),
  );
}

void printColSum(List<int> colSums) {
  if (colSums.isEmpty) {
    print('\nNo column sums to display');
    return;
  }

  print('\nColumn Sums:');
  for (final entry in colSums.asMap().entries) {
    print('Column ${entry.key + 1} Sum: ${entry.value}');
  }
}

void printMatrix(List<List<int>> matrix, String label, {int cellWidth = 3}) {
  print('\n$label:');
  if (matrix.isEmpty) return print('<empty>');

  for (final row in matrix) {
    print(row.map((e) => e.toString().padLeft(cellWidth)).join('  '));
  }
}

void main() {
  List<List<int>> matrixA = generateRandomMatrix(3, 3);

  printMatrix(matrixA, 'Matrix A');

  List<int> colSums = calculateColSum(matrixA);

  printColSum(colSums);
}
