import 'package:level5/models/project7/my_string_undo_redo.dart';

void main() {
  final myString = MyStringUndoRedo<String>();

  myString.setValue = "Ibrahim";
  print(myString.getValue);
  myString.setValue = 'Ibrahim1';
  print(myString.getValue);
  myString.setValue = 'Ibrahim2';
  print(myString.getValue);
  myString.setValue = 'Ibrahim3';
  print(myString.getValue);

  print("---------------Undo------------");
  myString.undo();
  print('After Undo : ${myString.getValue}');
  myString.undo();
  print('After Undo : ${myString.getValue}');
  myString.undo();
  print('After Undo : ${myString.getValue}');

  print("---------------Redo------------");
  myString.redo();
  print('After Redo : ${myString.getValue}');
  myString.redo();
  print('After Redo : ${myString.getValue}');
  myString.redo();
  print('After Redo : ${myString.getValue}');
}
