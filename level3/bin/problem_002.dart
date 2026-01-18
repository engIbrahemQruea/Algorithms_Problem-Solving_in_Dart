import 'package:level3/level3.dart';

List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols));
}

List<int> calculateRowsSum(List<List<int>> matrix) {
  return matrix.map((row) {
    return row.fold(0, (sum, element) => sum + element);
  }).toList();
}

void printRowsSum(List<int> rowSums) {
  print('\nRow Sums:');
  for (int i = 0; i < rowSums.length; i++) {
    print('Row ${i + 1} Sum: ${rowSums[i]}');
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

  List<int> rowSums = calculateRowsSum(matrixA);

  printRowsSum(rowSums);
}
