import 'package:level3/level3.dart';

List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

List<List<int>> multiplyTwoMatrixByHadamardProduct(
  List<List<int>> matrixA,
  List<List<int>> matrixB,
) {
  if (matrixA.isEmpty || matrixB.isEmpty) return [];

  final rowsA = matrixA.length;
  final colsA = matrixA.first.length;
  final rowsB = matrixB.length;
  final colsB = matrixB.first.length;

  if (colsA != rowsB) {
    throw ArgumentError('Columns of A ($colsA) must match Rows of B ($rowsB)');
  }

  return List.generate(rowsA, (i) {
    return List.generate(colsB, (j) {
      int sum = 0;
      for (int k = 0; k < colsA; k++) {
        sum += matrixA[i][k] * matrixB[k][j];
      }
      return sum;
    });
  });

  // return List.generate(
  //   rowsA,
  //   (i) => List.generate(
  //     colsB,
  //     (j) => List.generate(
  //       colsA,
  //       (k) => matrixA[i][k] * matrixB[k][j],
  //     ).reduce((a, b) => a + b),
  //   ),
  // );
}

void printMatrix(List<List<int>> matrix, String label, {int minCellWidth = 2}) {
  print('\n$label:');

  if (matrix.isEmpty) return print('<empty>');

  final maxNumberLength = matrix
      .expand((row) => row)
      .reduce((a, b) => a > b ? a : b)
      .toString()
      .length;

  final cellWidth = maxNumberLength > minCellWidth
      ? maxNumberLength
      : minCellWidth;

  for (final row in matrix) {
    print(row.map((e) => e.toString().padLeft(cellWidth)).join('  '));
  }
}

void main() {
  List<List<int>> matrixA = generateRandomMatrix(2, 3);
  List<List<int>> matrixB = generateRandomMatrix(3, 4);

  try {
    List<List<int>> resultMatrix = multiplyTwoMatrixByHadamardProduct(
      matrixA,
      matrixB,
    );

    printMatrix(matrixA, 'Matrix A (2x3)');
    printMatrix(matrixB, 'Matrix B (3x4)');
    printMatrix(
      resultMatrix,
      'Result Matrix (${matrixA.length}x${matrixB.first.length})',
    );
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
