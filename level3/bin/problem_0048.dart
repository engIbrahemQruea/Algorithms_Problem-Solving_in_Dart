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

  factory ClsClientData.fromLine(
    String lineRecord, [
    String separator = '#//#',
  ]) {
    final List<String> parts = lineRecord.split(separator);
    if (parts.length < 5) throw FormatException('Invalid record format');

    return ClsClientData(
      accountNumber: parts[0],
      pinCode: parts[1],
      name: parts[2],
      phone: parts[3],
      balance: double.tryParse(parts[4]) ?? 0.0,
    );
  }
}

List<ClsClientData> loadDataFromFile(String fileName) {
  final file = File(fileName);
  if (!file.existsSync()) return [];

  try {
    return file
        .readAsLinesSync()
        .where((line) => line.trim().isNotEmpty)
        .map((line) => ClsClientData.fromLine(line))
        .toList();
  } catch (e) {
    print('Error reading file: $e');
    return [];
  }
}

void printAllClientsData(List<ClsClientData> clients) {
  const accLen = 15, pinLen = 10, nameLen = 20, phoneLen = 12, balLen = 12;
  final String separator =
      "—" * (accLen + pinLen + nameLen + phoneLen + balLen + 16);

  print("\n\t\t\t\t  Client List (${clients.length}) Client(s).");
  print(separator);

  print(
    "| ${"Account Number".padRight(accLen)} "
    "| ${"Pin Code".padRight(pinLen)} "
    "| ${"Client Name".padRight(nameLen)} "
    "| ${"Phone".padRight(phoneLen)} "
    "| ${"Balance".padRight(balLen)} |",
  );
  print(separator);

  if (clients.isEmpty) {
    print("\t\t\t\t  No Clients Available In the System!");
  } else {
    for (var client in clients) {
      print(
        "| ${client.accountNumber.padRight(accLen)} "
        "| ${client.pinCode.padRight(pinLen)} "
        "| ${client.name.padRight(nameLen)} "
        "| ${client.phone.padRight(phoneLen)} "
        "| ${client.balance.toStringAsFixed(2).padRight(balLen)} |",
      );
    }
  }

  print("$separator\n");
}

void main() {
  const String dataFile = 'MyClient.txt';
  final clients = loadDataFromFile(dataFile);
  printAllClientsData(clients);
}
