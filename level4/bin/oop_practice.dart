// ignore_for_file: public_member_api_docs, sort_constructors_first
/// 1- Class And Object

extension NameFormatting on String {
  String capitalize() => this[0].toUpperCase() + substring(1);
}

class BankClient {
  final int id;
  final String _firstName;
  final String _lastName;

  BankClient({
    required this.id,
    required String firstName,
    required String lastName,
  }) : _firstName = firstName,
       _lastName = lastName;

  String get fullName =>
      '${_firstName.capitalize()} ${_lastName.capitalize()}}';

  @override
  String toString() => "العميل: $fullName (ID: $id)";
}

class Address {
  late String _addressLine1;
  late String _addressLine2;
  late String _poBox;
  late String _zipCode;

  Address(
    String addressLine1,
    String addressLine2,
    String poBox,
    String zipCode,
  ) {
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _poBox = poBox;
    _zipCode = zipCode;
  }

  void setAddressLine1(String value) {
    _addressLine1 = value;
  }

  String getAddressLine1() {
    return _addressLine1;
  }

  void setAddressLine2(String value) {
    _addressLine2 = value;
  }

  String getAddressLine2() {
    return _addressLine2;
  }

  void setPoBox(String value) {
    _poBox = value;
  }

  String getPoBox() {
    return _poBox;
  }

  void setZipCode(String value) {
    _zipCode = value;
  }

  String getZipCode() {
    return _zipCode;
  }

  void printAddress() {
    print('Address Details:');
    print('Address Line 1: $_addressLine1');
    print('Address Line 2: $_addressLine2');
    print('PO Box: $_poBox');
    print('Zip Code: $_zipCode');
  }
}

void main() {
  // final per1 = Person(
  //   id: 101,
  //   firstName: 'Ibrahim',
  //   lastName: 'Qurea',
  //   email: 'Ibrahim@gmail.com',
  //   phone: '773635382',
  // );
  // per1.printInfo();
  // per1.sendEmail('Hi', "I Love You");
  // per1.sendSms('Hi');

  // final emp1 = Employee(
  //   id: 102,
  //   firstName: 'Ibrahim',
  //   lastName: 'Qurea',
  //   email: 'Ibrahim@gmail.com',
  //   phone: '773635382',
  //   title: 'Developer',
  //   department: 'Flutter Dev',
  //   salary: 10000,
  // );
  // emp1.printInfo();
  // emp1.sendEmail('Hi', "I Love You");
  // emp1.sendSms('Hi');

  // // استخدام Named Parameters يجعل الكود مقروءاً جداً مقارنة بـ C++
  // final emp = Employee1(
  //   id: 10,
  //   firstName: "Mohammed",
  //   lastName: "Abu-Hadhoud",
  //   email: "A@a.com",
  //   title: "CEO",
  //   department: "ProgrammingAdvices",
  //   salary: 5000,
  // );

  // final emp2 = Employee1.management(
  //   id: 101,
  //   firstName: "Mohammeddd",
  //   lastName: "Abu-Hadhouddddd",
  //   email: "A@a.comddddd",
  //   salary: 1000,
  // );

  // emp.printInfo();
  // emp2.printInfo();

  final dev=Developer(
    id: 1022,
    firstName: "Ibrahim",
    lastName: "Qurea",
    email: "Ibrahim@gmail.com",
    title: "Developer",
    department: "Flutter Dev",
    salary: 10000,
    programmingLanguage: "Dart",
  );
  dev.printInfo();
}

class Person {
  final int id;
  final String _FirstName;
  final String _LastName;
  final String _email;
  final String _phone;

  const Person({
    required this.id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) : _FirstName = firstName,
       _LastName = lastName,
       _email = email,
       _phone = phone;

  int get iD => id;

  String get fullName =>
      '${_FirstName.capitalize()} ${_LastName.capitalize()}}';

  void printInfo() {
    print('Info');
    print('____________________________');
    print('ID: $id');
    print('First Name: $_FirstName');
    print('Last Name: $_LastName');
    print('Full Name: $fullName');
    print('Email: $_email');
    print('Phone: $_phone');
    print('____________________________');
  }

  void sendEmail(String subject, String body) {
    print("The following message sent successfuly to email : $_email");
    print("Subject: $subject");
    print("Body: $body");
  }

  void sendSms(String message) {
    print("The following message sent successfuly to phone : $_phone");
    print("Message: $message");
  }
}

class Employee extends Person {
  final String _title;
  final String _department;
  final double _salary;

  Employee({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required String title,
    required String department,
    required double salary,
  }) : _title = title,
       _department = department,
       _salary = salary;

  @override
  void printInfo() {
    super.printInfo();
    print('Title: $_title');
    print('Department: $_department');
    print('Salary: $_salary');
  }
}

// استخدام الـ Extension لإضافة لمسة جمالية للراتب
extension CurrencyFormatter on double {
  String toCurrency() => "\$${toStringAsFixed(2)}";
}

abstract class Person1 {
  final int id;
  final String firstName;
  final String lastName;
  final String email;

  // باني الأب (Base Class Constructor)
  const Person1({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  String get fullName => "$firstName $lastName";

  void printInfo() {
    print('\n--- Person Info ---');
    print('ID: $id | Name: $fullName | Email: $email');
  }
}

class Employee1 extends Person1 {
  final String title;
  final String department;
  final double salary;

  // 🚀 القوة الحقيقية لـ Dart: الـ Super-parameters
  // لاحظ كيف أننا لم نعد بحاجة لكتابة (id, firstName...) مرتين!
  Employee1({
    required super.id, // تمرير تلقائي للأب
    required super.firstName, // تمرير تلقائي للأب
    required super.lastName, // تمرير تلقائي للأب
    required super.email, // تمرير تلقائي للأب
    required this.title, // خاص بالابن
    required this.department, // خاص بالابن
    required this.salary, // خاص بالابن
  });

  // باني إضافي (Named Constructor) لإظهار المرونة
  Employee1.management({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required double salary,
  }) : this.title = "Manager",
       this.department = "Admin",
       this.salary = salary;

  @override
  void printInfo() {
    super.printInfo();
    print(
      'Position: $title | Dept: $department | Salary: ${salary.toCurrency()}',
    );
    print('-------------------');
  }
}

class Developer extends Employee1 {
  final String programmingLanguage;

  Developer({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.title,
    required super.department,
    required super.salary,
    required this.programmingLanguage,
  });

  @override
  void printInfo() {
    super.printInfo();
    print('Programming Language: $programmingLanguage');
    print('-------------------');
  }
}



