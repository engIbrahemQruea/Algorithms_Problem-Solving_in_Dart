List<int> fillList() {
  return [10, 10, 10, 50, 50, 70, 70, 70, 70, 90];
}

List<int> copyDistinctNumbersToList(List<int> sourceList) {
  return sourceList.toSet().toList();
}

void printList(List<int> list) => print(list.join(' '));

void main() {
  final sourceList = fillList();
  final distinctList = copyDistinctNumbersToList(sourceList);

  print('Source List:');
  printList(sourceList);

  print('\nDistinct List:');
  printList(distinctList);
}
