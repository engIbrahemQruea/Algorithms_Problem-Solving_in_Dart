import 'dart:io';
import 'package:level3/level3.dart';

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

  static ClsClientData readFromUser() {
    return ClsClientData(
      accountNumber: readString(message: 'Enter Account Number? '),
      pinCode: readString(message: 'Enter Pin Code? '),
      name: readString(message: 'Enter Name? '),
      phone: readString(message: 'Enter Phone? '),
      balance: readPositiveNumber('Enter Account Balance? ').toDouble(),
    );
  }

  String toRecordLine({String separator = '#//#'}) {
    return [
      accountNumber,
      pinCode,
      name,
      phone,
      balance.toStringAsFixed(2),
    ].join(separator);
  }
}

Future<bool> appendLineToFile(String fileName, String lineData) async {
  try {
    final file = File(fileName);
    await file.writeAsString('$lineData\n', mode: FileMode.append, flush: true);
    return true;
  } catch (e) {
    stderr.writeln('Critical Error: Could not save to $fileName. Details: $e');
    return false;
  }
}

Future<void> addNewClient(String fileName) async {
  final client = ClsClientData.readFromUser();
  final isSaved = await appendLineToFile(fileName, client.toRecordLine());

  if (isSaved) {
    print('✅ Client [${client.accountNumber}] saved successfully.');
  } else {
    print('❌ Failed to save client.');
  }
}

void addNewClients(String fileName) async {
  bool tryAgain = true;
  while (tryAgain) {
    print('\n--- Adding New Client ---');
    await addNewClient(fileName);

    String choice = readOnlyString(
      message: "Do you want to add more clients? (Y/N): ",
    );
    tryAgain = choice.toUpperCase() == 'Y';
  }
  print('\n🏁 All operations completed.');
}

void main() {
  const String dataFile = 'MyClient.txt';
  addNewClients(dataFile);
}
