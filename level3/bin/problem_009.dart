import 'dart:io';

import 'package:level3/level3.dart';

enum MiddleType { row, column }

List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols, max: 10));
}

List<int> getMiddleColumn(List<List<int>> matrix) {
  if (matrix.isEmpty || matrix.first.isEmpty) return [];

  int rows = matrix.length;
  int middleColIndex = matrix.first.length ~/ 2;

  return List.generate(rows, (i) => matrix[i][middleColIndex]);
}

List<int> getMiddleRow(List<List<int>> matrix) {
  if (matrix.isEmpty) return [];

  int middleRowIndex = matrix.length ~/ 2;
  return matrix[middleRowIndex];
}

void printMiddle({required List<int> middle, required MiddleType type}) {
  if (middle.isEmpty) {
    print('\nNo middle ${type.name}');
    return;
  }

  print('\nMiddle ${type.name}:');
  if (type == MiddleType.row) {
    stdout.writeln(middle.map((e) => e.toString().padLeft(3)).join(' '));
  } else {
    for (final value in middle) {
      print(value.toString().padLeft(3));
    }
  }
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
  List<int> middleCol = getMiddleColumn(matrixA);
  List<int> middleRow = getMiddleRow(matrixA);

  printMatrix(matrixA, 'Matrix A');
  printMiddle(middle: middleCol, type: MiddleType.column);
  printMiddle(middle: middleRow, type: MiddleType.row);
}
