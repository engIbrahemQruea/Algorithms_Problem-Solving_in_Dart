import 'dart:io';
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

void main() {
  // تحسين: تحميل البيانات مرة واحدة فقط في البداية لزيادة السرعة
  final allClients = loadDataFromFile(dataFile);

  String searchID = readString(
    message: "Please enter Account Number to search: ",
  );

  final client = findClientByAccountNumber(searchID, allClients);

  if (client != null) {
    printClientCard(client);
  } else {
    print("\n❌ Client with Account Number [$searchID] is NOT found!");
  }
}
