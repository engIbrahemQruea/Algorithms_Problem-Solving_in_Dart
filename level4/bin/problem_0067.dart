// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  final String fullName;
  final Address address;

  Person({
    required this.fullName,
    required String address1,
    required String address2,
    required String city,
    required String country,
  }) : address = Address(
         address1: address1,
         address2: address2,
         city: city,
         country: country,
       );
}

class Address {
  final String address1;
  final String address2;
  final String city;
  final String country;
  Address({
    required this.address1,
    required this.address2,
    required this.city,
    required this.country,
  });

  void printInfo() {
    print('$address1, $address2, $city, $country');
  }
}

void main() {
  final pr = Person(
    fullName: 'Ibbb',
    address1: '444',
    address2: '555',
    city: 'yyy',
    country: 'ibb',
  );
  pr.address.printInfo();
}
