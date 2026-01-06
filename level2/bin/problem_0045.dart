import 'package:level2/level2.dart';

List<int> getNegativeNumbers(List<int> source) =>
    source.where((number) => number < 0).toList();

void printList(String label, List<int> list) {
  print('\n$label:');
  print(list.isEmpty ? 'No elements found.' : list.join(' '));
}

void main() {
  final count = readPositiveNumber('Please enter number of elements');
  final list1 = generateRandomList(count, min: -100, max: 100);

  final listNegative = getNegativeNumbers(list1);

  printList('List 1 elements', list1);
  printList('List 2 (Negative numbers only)', listNegative);

  print('\nNegative Numbers count is:: ${listNegative.length}');
}
