import 'package:level2/level2.dart';

List<int> getOddNumbers(List<int> source) =>
    source.where((number) => number.isOdd).toList();

void printList(String label, List<int> list) {
  print('\n$label:');
  print(list.join(' '));
}

void main() {
  final count = readPositiveNumber('Please enter number of elements');
  final list1 = generateRandomList(count);

  final list2 = getOddNumbers(list1);

  printList('List 1 elements', list1);
  printList('List 2 (Odd numbers only)', list2);

  print('\nCount of odd numbers: ${list2.length}');
}
