// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Person {
  final int id;
  final String firstName;
  final String lastName;

  const Person({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  String get fullName => "$firstName $lastName";

  // دالة مجردة يجب على الجميع تنفيذها بطريقتهم
  void printIdentity();
}

class Employee extends Person {
  final String title;
  final double salary;
  Employee({
    required super.id,
    required super.firstName,
    required super.lastName,
    required this.title,
    required this.salary,
  });

  Employee.intern({required int id, required String name})
    : this(
        id: id,
        firstName: name,
        lastName: 'ibra',
        title: 'Love',
        salary: 5000,
      );

  @override
  void printIdentity() {
    print("📋 Employee: $fullName | Position: $title");
  }
}

void main() {
  final dev = Employee(
    id: 1,
    firstName: 'firstName',
    lastName: 'lastName',
    title: 'title',
    salary: 500,
  );
  dev.printIdentity();

  final intt = Employee.intern(id: 2, name: 'hhh');
  intt.printIdentity();
}
