import 'package:level2/level2.dart';

List<int> getEventNumbers(List<int> source) =>
    source.where((number) => number.isEven).toList();

void printList(String label, List<int> list) {
  print('\n$label:');
  list.isEmpty == true ? print('No elements found.') : print(list.join(' '));
}

void main() {
  final count = readPositiveNumber('Please enter number of elements');
  final list1 = generateRandomList(count);

  final list2 = getEventNumbers(list1);

  printList('List 1 elements', list1);
  printList('List 2 (Event numbers only)', list2);

  print('\nEven Numbers count is: ${list2.length}');
}
