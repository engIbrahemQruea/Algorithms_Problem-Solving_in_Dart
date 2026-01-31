import 'dart:io';
import 'dart:math';
import 'package:level3/level3.dart';

const String dataFile = 'MyClient.txt';

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

  String toRecordLine({String separator = '#//#'}) {
    return [
      accountNumber,
      pinCode,
      name,
      phone,
      balance.toStringAsFixed(2),
    ].join(separator);
  }

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

ClsClientData? findClientByAccountNumber(
  String accountNumber,
  List<ClsClientData> clients,
) {
  try {
    return clients.firstWhere(
      (c) =>
          c.accountNumber.trim().toUpperCase() ==
          accountNumber.trim().toUpperCase(),
    );
  } catch (e) {
    return null;
  }
}

Future<void> saveAllClientsToFile(
  String fileName,
  List<ClsClientData> clients,
) async {
  try {
    final file = File(fileName);
    String allData = clients.map((c) => c.toRecordLine()).join('\n');

    if (allData.isNotEmpty) allData += '\n';
    await file.writeAsString(allData);
  } catch (e) {
    stderr.writeln('Critical Error: Could not refresh file. Details: $e');
  }
}

void printClientCard(ClsClientData client) {
  print("\n========================================");
  print("        CLIENT DETAILS CARD             ");
  print("========================================");
  print("  Account Number   : ${client.accountNumber}");
  print("  Pin Code         : ${client.pinCode}");
  print("  Client Name      : ${client.name}");
  print("  Phone            : ${client.phone}");
  print("  Account Balance  : ${client.balance.toStringAsFixed(2)} \$");
  print("========================================\n");
}

bool confirmDelete() {
  String answer = readString(
    message: "Are you sure you want delete this client? y/n ? ",
  );
  return answer.toUpperCase() == 'Y';
}



void deleteClientByAccountNumber(
  List<ClsClientData> clientData,
  searchID,
) async {
  final client = findClientByAccountNumber(searchID, clientData);

  if (client != null) {
    printClientCard(client);
    if (confirmDelete()) {
      clientData.removeWhere((element) => element.accountNumber == searchID);
      await saveAllClientsToFile(dataFile, clientData);
      print('Client Deleted Successfully.');
    } else {
      print('Delete Operation Cancelled.');
    }
  } else {
    print("\n❌ Client with Account Number [$searchID] is NOT found!");
  }
}

void main() {
  final allClients = loadDataFromFile(dataFile);

  String searchID = readString(
    message: "Please enter Account Number to search: ",
  );

  deleteClientByAccountNumber(allClients, searchID);
}
