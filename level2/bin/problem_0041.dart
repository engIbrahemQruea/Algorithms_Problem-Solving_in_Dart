List<int> fillList() {
  return [121, 1230, 10, 12321, 50, 147898741, 70, 15975357951, 159, 90];
}

int reverseDigits(int number) {
  int reverseNumber = 0;
  while (number > 0) {
    reverseNumber = (reverseNumber * 10) + (number % 10);
    number ~/= 10;
  }
  return reverseNumber;
}

bool isPalindrome(int number) => number == reverseDigits(number);

List<int> copyPalindromeNumbersToList(List<int> sourceList) {
  return sourceList.where(isPalindrome).toList();
}

void printList(List<int> list) => print(list.join(' '));

void main() {
  List<int> sourceList = fillList();
  List<int> palindromeList = copyPalindromeNumbersToList(sourceList);
  printList(sourceList);
  printList(palindromeList);
}
