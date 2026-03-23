import 'dart:collection';
import 'dart:io';

extension LinkedListUtils<T> on LinkedList<MyDblLinkedList1<T>> {
  void printAll() {
    for (var node in this) {
      stdout.write("${node.value} ");
    }
    stdout.writeln();
  }

  void printList() {
    stdout.write('NULL <--> ');
    stdout.write(this.map((node) => node.value).join(' <--> '));
    stdout.write(' <--> NULL\n');
  }

  void printListDetails() {
    print('\n--- List Details ---');
    for (var node in this) {
      final prevVal = node.previous?.value?.toString() ?? 'null';
      final nextVal = node.next?.value?.toString() ?? 'null';

      print("$prevVal <--> ${node.value} <--> $nextVal");
    }
  }
}

extension LinkedListShortcuts<T> on LinkedList<MyDblLinkedList1<T>> {
  void insertAtBeginning(T value) => addFirst(MyDblLinkedList1(value));
  void insertAfter(MyDblLinkedList1<T> node, T value) =>
      node.insertAfter(MyDblLinkedList1(value));

  void insertAtEnd(T value) => add(MyDblLinkedList1(value));
  MyDblLinkedList1<T>? find(T value) =>
      firstWhere((node) => node.value == value);
  void deleteNode(MyDblLinkedList1<T> node) => node.unlink();
  void deleteFirstNode() {
    if (isNotEmpty) first.unlink();
  }

  void deleteLastNode() {
    if (isNotEmpty) last.unlink();
  }
}

base class MyDblLinkedList1<T> extends LinkedListEntry<MyDblLinkedList1<T>> {
  final T value;
  MyDblLinkedList1(this.value);

  @override
  String toString() => value.toString();
}





// import 'dart:io';

// class Node<T> {
//   T value;
//   Node<T>? next;
//   Node<T>? prev;

//   Node(this.value, {this.next, this.prev});
// }

// class MyDblLinkedList<T> extends Iterable<T> { // جعل القائمة قابلة للتكرار
//   Node<T>? _head;
//   Node<T>? _tail;
//   int _length = 0; // إضافة عداد للحجم

//   @override
//   bool get isEmpty => _head == null;
//   int get length => _length;

//   // إرجاع Iterator يسمح لنا باستخدام for-in
//   @override
//   Iterator<T> get iterator => _LinkedListIterator(_head);

//   void insertAtBeginning(T value) {
//     final newNode = Node(value, next: _head);
//     if (isEmpty) {
//       _head = _tail = newNode;
//     } else {
//       _head?.prev = newNode;
//       _head = newNode;
//     }
//     _length++;
//   }

//   void insertAtEnd(T value) {
//     if (isEmpty) {
//       insertAtBeginning(value);
//       return;
//     }
//     final newNode = Node(value, prev: _tail);
//     _tail?.next = newNode;
//     _tail = newNode;
//     _length++;
//   }

//   void deleteNode(Node<T>? node) {
//     if (node == null || isEmpty) return;

//     if (node == _head) {
//       _head = node.next;
//       _head?.prev = null;
//     } else if (node == _tail) {
//       _tail = node.prev;
//       _tail?.next = null;
//     } else {
//       node.prev?.next = node.next;
//       node.next?.prev = node.prev;
//     }

//     if (_head == null) _tail = null; // القائمة أصبحت فارغة

//     // تنظيف روابط العقدة المحذوفة للـ GC
//     node.next = node.prev = null;
//     _length--;
//   }

//   // الآن الدوال الطرفية أصبحت بسيطة جداً
//   void deleteFirstNode() => deleteNode(_head);
//   void deleteLastNode() => deleteNode(_tail);

//   void printAll() {
//     // بفضل الـ Iterator يمكننا الآن الطباعة بسهولة
//     print(join(' ')); 
//   }
// }

// // كلاس مساعد لجعل القائمة تدعم for-in
// class _LinkedListIterator<T> implements Iterator<T> {
//   Node<T>? _current;
//   T? _currentValue;

//   _LinkedListIterator(this._current);

//   @override
//   T get current => _currentValue as T;

//   @override
//   bool moveNext() {
//     if (_current == null) return false;
//     _currentValue = _current!.value;
//     _current = _current!.next;
//     return true;
//   }
// }