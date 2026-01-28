import 'dart:math';

import 'package:level3/level3.dart';

/// A class representing client data.
class ClsClientData {
  final String accountNumber;
  final String pinCode;
  final String name;
  final String phone;
  final double balance;

  ClsClientData({
    required this.accountNumber,
    required this.pinCode,
    required this.name,
    required this.phone,
    required this.balance,
  });

  /// Converts the client data to a record line string with the specified [separator].
  String toRecordLine({String separator = '#//#'}) {
    return [
      accountNumber,
      pinCode.toString(),
      name,
      phone,
      balance.toStringAsFixed(2),
    ].join(separator);
  }
}

/// Reads client data from user input.
ClsClientData readNewClient() {
  print('--- Please Enter Client Data ---');
  return ClsClientData(
    accountNumber: readString(message: 'Enter Account Number? '),
    pinCode: readString(message: 'Enter Pin Code? '),
    name: readString(message: 'Enter Name? '),
    phone: readString(message: 'Enter Phone? '),
    balance: readPositiveNumber('Enter Account Balance? ').toDouble(),
  );
}

/// Converts a [ClsClientData] object to a line string for saving With the specified [separator].
String convertRecordToLine(ClsClientData client, [String separator = "#//#"]) {
  List lsClientData = [
    client.accountNumber,
    client.pinCode.toString(),
    client.name,
    client.balance.toStringAsFixed(2),
  ];
  return lsClientData.join(separator).trim();
}

void main() {
  ClsClientData client = readNewClient();

  print('\nClient Record For Saving is:');
  print(convertRecordToLine(client));

  print('\nClient Data is:');

  /// Another Solution way to print client data as a record line
  print(client.toRecordLine());
}
