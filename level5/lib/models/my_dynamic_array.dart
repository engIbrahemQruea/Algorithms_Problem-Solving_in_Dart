import 'dart:io';

class MyDynamicArray<T> {
  int _size = 0;
  int _capacity = 0;
  late List<T?> _array;

  MyDynamicArray([int initialCapacity = 10]) {
    if (initialCapacity < 0) {
      throw ArgumentError('Capacity cannot be negative');
    }
    _capacity = initialCapacity;
    _array = List<T?>.filled(_capacity, null);
  }

  int get size => _size;

  int get capacity => _capacity;

  bool get isEmpty => _size == 0;

  bool get isFull => _size == _capacity;

  bool get isNotEmpty => !isEmpty;

  void setItem(int index, T value) {
    if (index < 0 || index >= _size) {
      throw RangeError.index(
        index,
        _array,
        'index',
        'Index out of bounds',
        _size,
      );
    }
    _array[index] = value;
  }

  void add(T value) {
    if (_size == _capacity) {
      _resize(_capacity == 0 ? 1 : _capacity * 2);
    }
    _array[_size] = value;
    _size++;
  }

  T getItem(int index) {
    if (index < 0 || index >= _size) {
      throw RangeError.index(
        index,
        _array,
        'index',
        'Index out of bounds',
        _size,
      );
    }
    return _array[index] as T;
  }

  void printList() {
    for (int i = 0; i < _size; i++) {
      stdout.write('${_array[i]} ');
    }
    stdout.writeln();
  }
}
