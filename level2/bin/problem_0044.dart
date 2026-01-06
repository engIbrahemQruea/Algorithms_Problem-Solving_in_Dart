import 'package:level2/level2.dart';

List<int> getPositiveNumbers(List<int> source) =>
    source.where((number) => number > 0).toList();

void printList(String label, List<int> list) {
  print('\n$label:');
print(list.isEmpty ? 'No elements found.' : list.join(' '));}

void main() {
  final count = readPositiveNumber('Please enter number of elements');
  final list1 = generateRandomList(count, min: -100, max: 100);

  final listPositive = getPositiveNumbers(list1);

  printList('List 1 elements', list1);
  printList('List 2 (Event numbers only)', listPositive);

  print('\nPositive Numbers count is: ${listPositive.length}');
}
