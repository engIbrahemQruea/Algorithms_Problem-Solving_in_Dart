
import 'package:level3/level3.dart';

enum EnMenuOptions {
  showClient,
  addClient,
  deleteClient,
  updateClient,
  findClient,
  exit,
}

class ClsClient {
  final String accountNumber;
  final String pinCode;
  final String name;
  final String phoneNumber;
  final double balance;

  ClsClient({
    required this.accountNumber,
    required this.pinCode,
    required this.name,
    required this.phoneNumber,
    required this.balance,
  });

  factory ClsClient.fromLine(String lineRecord, [String separator = '#//#']) {
    final List<String> parts = lineRecord.split(separator);
    if (parts.length < 5) throw FormatException('Invalid record format');

    return ClsClient(
      accountNumber: parts[0],
      pinCode: parts[1],
      name: parts[2],
      phoneNumber: parts[3],
      balance: double.tryParse(parts[4]) ?? 0.0,
    );
  }

  String toLine({String separator = '#//#'}) {
    return [
      accountNumber,
      pinCode,
      name,
      phoneNumber,
      balance.toStringAsFixed(2),
    ].join(separator);
  }

  static ClsClient clientInputService(String accountNumber) {
    return ClsClient(
      accountNumber: accountNumber,
      pinCode: readString(message: 'Enter Pin Code? '),
      name: readString(message: 'Enter Name? '),
      phoneNumber: readString(message: 'Enter Phone? '),
      balance: readPositiveNumber('Enter Account Balance? ').toDouble(),
    );
  }
}