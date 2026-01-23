import 'package:level3/level3.dart';

/// Generates a matrix with random integers
List<List<int>> generateRandomMatrix(int rows, int cols) {
  return List.generate(rows, (_) => generateRandomList(cols));
}

/// Checks if the given matrix is a palindrome matrix
bool isPalindromeMatrix(List<List<int>> matrix) {
  if (matrix.isEmpty || matrix.first.isEmpty) return false;

  for (final row in matrix) {
    int len = row.length;
    for (int i = 0; i < len / 2; i++) {
      if (row[i] != row[len - 1 - i]) {
        return false;
      }
    }
  }

  return true;
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
  //final matrix= generateRandomMatrix(3, 3);
  final matrix = [
    [1, 2, 1],
    [5, 5, 5],
    [7, 3, 7],
  ];
  printMatrix(matrix, 'Matrix');
  if (isPalindromeMatrix(matrix)) {
    print('Yes it is Palindrome Matrix');
  } else {
    print('No it is not Palindrome Matrix');
  }
}
