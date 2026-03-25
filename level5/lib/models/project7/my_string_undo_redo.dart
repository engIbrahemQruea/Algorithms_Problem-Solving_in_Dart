import 'package:level5/models/my_queue_arr.dart';

class MyStringUndoRedo<T> {
  final MyStackArr<T> _undoStack = MyStackArr<T>();
  final MyStackArr<T> _redoStack = MyStackArr<T>();

  T? _currentValue;

  T? get getValue => _currentValue;

  set setValue(T newValue) {
    if (_currentValue != null) {
      _undoStack.push(_currentValue!);
    }
    _currentValue = newValue;
    _redoStack.clear();
  }

  void undo() {
    if (_undoStack.isEmpty) return;
    if (_currentValue != null) {
      _redoStack.push(_currentValue!);
    }
    _currentValue = _undoStack.pop();
  }

  void redo() {
    if (_redoStack.isEmpty) return;
    if (_currentValue != null) {
      _undoStack.push(_currentValue!);
    }
    _currentValue = _redoStack.pop();
  }
}
