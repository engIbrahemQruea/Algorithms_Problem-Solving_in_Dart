List<List<int>> generateOrderNumberMatrix({
  required int rows,
  required int cols,
  int start = 1,
}) {
  if (rows <= 0 || cols <= 0) {
    throw ArgumentError('rows and cols must be greater than zero');
  }

  int value = start - 1;

  return List.generate(rows, (_) => List.generate(cols, (_) => ++value));
}

void printMatrix(List<List<int>> matrix, String label, {int minCellWidth = 2}) {
  print('\n$label:');

  if (matrix.isEmpty || matrix.first.isEmpty) {
    print('<empty>');
    return;
  }

  final maxNumberLength = matrix.expand((row) => row).last.toString().length;

  final cellWidth = maxNumberLength > minCellWidth
      ? maxNumberLength
      : minCellWidth;

  for (final row in matrix) {
    print(row.map((e) => e.toString().padLeft(cellWidth)).join('  '));
  }
}

// List<List<int>> generateOrderNumberMatrix({required int rows,required int cols}) {
//   if (rows <= 0 || cols <= 0) {
//     throw ArgumentError('rows and cols must be greater than zero');
//   }
//   return List.generate(
//     rows,
//     (rowIndex) =>
//         List.generate(cols, (colsIndex) => (rowIndex * cols) + colsIndex + 1),
//   );
// }

// void printMatrix(List<List<int>> matrix, String label, {int cellWidth = 3}) {
//   print('$label:');
//   if (matrix.isEmpty) return print('<empty>');

//   int cellWidth = matrix.last.last.toString().length;

//   for (final orderMatrix in matrix) {
//     print(orderMatrix.map((e) => e.toString().padLeft(cellWidth)).join('  '));
//   }
// }

void main() {
  List<List<int>> matrixA = generateOrderNumberMatrix(rows: 3, cols: 3);

  printMatrix(matrixA, 'Matrix Ordered ');
}
