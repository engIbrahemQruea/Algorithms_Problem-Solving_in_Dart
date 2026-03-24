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

  void _resize(int newCapacity) {
    if (newCapacity < _size) {
      throw ArgumentError('New capacity cannot be less than size');
    }

    List<T?> newArray = List<T?>.filled(newCapacity, null);
    for (int i = 0; i < _size; i++) {
      newArray[i] = _array[i];
    }
    _array = newArray;
    _capacity = newCapacity;
  }

  void resize(int newSize) {
    if (newSize < 0) {
      throw ArgumentError('New size cannot be negative');
    }
    if (newSize > _capacity) {
      _resize(newSize);
    }

    if (newSize < _size) {
      for (int i = newSize; i < _size; i++) {
        _array[i] = null;
      }
    }
    _size = newSize;
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

  void reverse() {
    if (_size <= 1) return;

    int left = 0;
    int right = _size - 1;

    while (left < right) {
      final temp = _array[left];
      _array[left] = _array[right];
      _array[right] = temp;

      left++;
      right--;
    }
  }

  void clear({bool shrink = false}) {
    if (shrink) {
      _array = List<T?>.filled(1, null);
      _capacity = 1;
    } else {
      for (int i = 0; i < _size; i++) {
        _array[i] = null;
      }
    }
    _size = 0;
  }

  void removeAt(int index) {
    if (index < 0 || index >= _size) {
      throw RangeError.index(index, _array);
    }

    for (int i = index; i < _size - 1; i++) {
      _array[i] = _array[i + 1];
    }

    _array[_size - 1] = null;
    _size--;
  }

  void removeFirst() {
    if (isEmpty) throw StateError('Array is empty');
    removeAt(0);
    _shrinkIfNeeded();
  }

  void removeLast() {
    if (isEmpty) throw StateError('Array is empty');
    _array[_size - 1] = null;
    _size--;
    _shrinkIfNeeded();
  }

  void _shrinkIfNeeded() {
    const minCapacity = 10;

    if (_capacity > minCapacity && _size <= _capacity ~/ 4) {
      int newCapacity = _capacity ~/ 2;
      if (newCapacity < minCapacity) newCapacity = minCapacity;
      _resize(newCapacity);
    }
  }

  int find(T value) {
    for (int i = 0; i < _size; i++) {
      if (_array[i] == value) {
        return i;
      }
    }
    return -1;
  }

  bool removeItem(T value) {
    int index = find(value);
    if (index == -1) return false;

    removeAt(index);
    _shrinkIfNeeded();
    return true;
  }

  void printList() {
    for (int i = 0; i < _size; i++) {
      stdout.write('${_array[i]} ');
    }
    stdout.writeln();
  }
}
