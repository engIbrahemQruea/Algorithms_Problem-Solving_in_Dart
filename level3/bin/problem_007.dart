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

List<List<int>> transposeMatrix({required List<List<int>> matrix}) {
  if (matrix.isEmpty || matrix.first.isEmpty) {
    return [];
  }

  int originalRows = matrix.length;
  int originalCols = matrix.first.length;

  return List.generate(
    originalCols,
    (colIndex) =>
        List.generate(originalRows, (rowIndex) => matrix[rowIndex][colIndex]),
  );
}

void main() {
  List<List<int>> matrixA = generateOrderNumberMatrix(rows: 3, cols: 3);

  printMatrix(matrixA, 'Matrix Ordered ');
  printMatrix(transposeMatrix(matrix: matrixA), 'Matrix Transpose ');
}
