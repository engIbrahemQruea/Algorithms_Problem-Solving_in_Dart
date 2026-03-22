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

  bool get isEmpty => _head == null;

  void insertAtBeginning(T value) {
    final newNode = Node(value);
    if (isEmpty) {
      _head = _tail = newNode;
    } else {
      newNode.next = _head;
      _head?.prev = newNode;
      _head = newNode;
    }
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
  }

  void insertAtEnd(T value) {
    final newNode = Node(value, next: null);
    if (isEmpty) {
      _head = _tail = newNode;
    } else {
      _tail?.next = newNode..prev = _tail;
      _tail = newNode;
    }
  }

  void deleteNode(Node<T> node) {
    if (isEmpty || node == null) return;
    if (node == _head) {
      _head = node.next;
      if (_head != null) {
        _head?.prev = null;
      } else {
        _tail = null;
      }
    } else if (node == _tail) {
      _tail = node.prev;
      _tail?.next = null;
    } else {
      node.prev?.next = node.next;
      node.next?.prev = node.prev;
    }
    node
      ..next = null
      ..prev = null;
  }

  void deleteFirstNode() {
    if (_head != null) {
      _head = _head?.next;
      if (_head != null) {
        _head?.prev = null;
      } else {
        _tail = null;
      }
    }
  }

  void deleteLastNode() {
    if (_tail == null) return;

    if (_head == _tail) {
      _head = _tail = null;
      return;
    }

    _tail = _tail!.prev;
    _tail!.next = null;
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
