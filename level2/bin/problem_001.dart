import 'dart:io';

void printTableHeader() {
  print('\n\n\t\t\t Multiplication Table From 1 to 10\n\n');

  for (int i = 1; i <= 10; i++) {
    stdout.write('\t$i');
  }

  print(
    '\n---------------------------------------------------------------------------------------',
  );
}
String columSperator(int i)
{
    return  i<10?"   |":"  |";
}
void printMultiplicationTable() {
    printTableHeader();
  for (int i = 1; i <= 10; i++) {
    stdout.write('$i${columSperator(i)}\t');
    for (int j = 1; j <= 10; j++) {
      stdout.write('${i * j}\t');
    }
    stdout.write('\n');
  }
}

void main() {

  printMultiplicationTable();
}
