import 'dart:io';

class Node<T> {
  T value;
  Node<T>? next;
  Node<T>? prev;

  Node(this.value, {this.next, this.prev});
}

class MyDblLinkedList<T> {
  Node<T>? _head;
  Node<T>? _tail;
  int _length = 0;

  int get size => _length;

  bool get isEmpty => _length == 0;

  void insertAtBeginning(T value) {
    final newNode = Node(value);
    if (isEmpty) {
      _head = _tail = newNode;
    } else {
      newNode.next = _head;
      _head?.prev = newNode;
      _head = newNode;
    }
    _length++;
  }

  Node<T>? find(T value) {
    Node<T>? currentNode = _head;
    while (currentNode != null) {
      if (currentNode.value == value) {
        return currentNode;
      }
      currentNode = currentNode.next;
    }
    return null;
  }

  void insertAfter(Node<T> node, T value) {
    final newNode = Node(value, next: node.next, prev: node);

    if (node == _tail) {
      _tail = newNode;
    } else {
      node.next?.prev = newNode;
    }

    node.next = newNode;
    _length++;
  }

  void insertAtEnd(T value) {
    final newNode = Node(value, next: null);
    if (isEmpty) {
      _head = _tail = newNode;
    } else {
      _tail?.next = newNode..prev = _tail;
      _tail = newNode;
    }
    _length++;
  }

  void deleteNode(Node<T> node) {
    if (isEmpty) return;
    if (node == _head) _head = node.next;
    if (node == _tail) _tail = node.prev;

    node.prev?.next = node.next;
    node.next?.prev = node.prev;
    node
      ..next = null
      ..prev = null;
    _length--;
  }

  void deleteFirstNode() {
    if (_head == null) return;

    deleteNode(_head!);
  }

  void deleteLastNode() {
    if (_tail == null) return;

    deleteNode(_tail!);
  }

  void printAll() {
    Node<T>? currentNode = _head;
    while (currentNode != null) {
      stdout.write("${currentNode.value} ");
      currentNode = currentNode.next;
    }
    stdout.writeln();
  }
}
