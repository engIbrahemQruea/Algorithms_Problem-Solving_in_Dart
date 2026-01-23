import 'dart:io';

import 'package:level3/level3.dart';

/// Generates a matrix with random integers
List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols));
}

void printInterstedMatrix(List<List<int>> matrixA, List<List<int>> matrixB) {
  if (matrixA.isEmpty ||
      matrixB.isEmpty ||
      matrixA.first.isEmpty ||
      matrixB.first.isEmpty) {
    print('<empty>');
    return;
  }

  if (matrixA.length != matrixB.length ||
      matrixA.first.length != matrixB.first.length) {
    print('<matrices have different dimensions>');
    return;
  }

  final matrixBSet = matrixB.expand((row) => row).toSet();

  print('\nMatrix of Interested Numbers:');

  for (int i = 0; i < matrixA.length; i++) {
    for (int j = 0; j < matrixA[i].length; j++) {
      final value = matrixA[i][j];
      stdout.write(
        matrixBSet.contains(value) ? value.toString().padLeft(3) : '  -',
      );
      stdout.write(' ');
    }
    print('');
  }
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
  final matrixB = generateRandomMatrix(3, 3);

  printMatrix(matrixA, 'Matrix A');
  printMatrix(matrixB, 'Matrix B');

  printInterstedMatrix(matrixA, matrixB);
}
